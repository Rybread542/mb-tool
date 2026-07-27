from vanna_setup import get_vn
from training.docs import docs_arr
import re
import shutil, os

shutil.rmtree('chrome_db', ignore_errors=True)

vn = get_vn()

df_ddl = vn.run_sql("""
    SELECT table_name,
           'CREATE TABLE ' || table_name || ' (' ||
           string_agg(column_name || ' ' || data_type, ', ') || ');' AS ddl
    FROM information_schema.columns
    WHERE table_schema = 'public'
    GROUP BY table_name
""")

for ddl in df_ddl['ddl']:
    vn.train(ddl=ddl)

for doc in docs_arr: 
    vn.train(documentation=doc)

# ---------------------------------------------------------------------------
# Question/SQL example loading
#
# Training SQL files follow this layout:
#
#   --------------------------------------   <- separator line (ignored)
#   -- SECTION TITLE                         <- header comment (ignored)
#   -- Output: description of the rows       <- header comment (ignored)
#   --------------------------------------
#
#   --The question text.                     <- question
#   SELECT ...                               <- query body, ends at the next
#   ... ;                                       comment, separator, or EOF
#
# A comment line only becomes a question if SQL actually follows it before
# the next comment/separator, so header text is dropped automatically.
# One caveat: don't put `--` comments inside a query body — they would split
# the query in two.
# ---------------------------------------------------------------------------

SEPARATOR_RE = re.compile(r'^-{4,}\s*$')


def load_examples(path):
    examples = []
    question, sql_lines = None, []

    def flush():
        nonlocal question, sql_lines
        sql = '\n'.join(sql_lines).strip()
        if question and sql:
            examples.append((question, sql))
        question, sql_lines = None, []

    with open(path) as f:
        for raw in f:
            line = raw.rstrip('\n')
            stripped = line.strip()
            if SEPARATOR_RE.match(stripped):
                flush()                      # never a question, ends any pair
            elif stripped.startswith('--'):
                flush()                      # previous pair (if any) is done
                question = stripped.lstrip('-').strip()
            else:
                sql_lines.append(line)
    flush()
    return examples


for path in ('./training/stats.sql', './training/discovery.sql'):
    examples = load_examples(path)
    print(f"{path}: loaded {len(examples)} question/SQL pairs")
    for question, sql in examples:
        vn.train(question=question, sql=sql)

print("Training complete.")
print(vn.get_training_data())