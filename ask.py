import sys
from vanna_setup import get_vn

vn = get_vn()

question = " ".join(sys.argv[1:]) or "How many artists are in the database?"

print(f"Question: {question}\n")

# generate_sql returns the SQL without running it
sql = vn.generate_sql(question)
print(f"Generated SQL:\n{sql}\n")

# Prompt before executing
confirm = input("Run this query? [y/N] ")
if confirm.lower() == 'y':
    result = vn.run_sql(sql)
    print("\nResult:")
    print(result)