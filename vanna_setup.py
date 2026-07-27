import os
from dotenv import load_dotenv
from vanna.ollama import Ollama
from vanna.chromadb import ChromaDB_VectorStore
from training.docs import initial
import re
    

load_dotenv()

class MusicVanna(ChromaDB_VectorStore, Ollama):
    
    def __init__(self, config=None):
        ChromaDB_VectorStore.__init__(self, config=config)
        Ollama.__init__(self, config=config)

    def extract_sql(self, llm_response: str) -> str:
        """Override: Vanna's Ollama extractor truncates on '[', which breaks
        Postgres array[...] syntax. This version stops only at ';' or a code
        fence"""

        llm_response = llm_response.replace("\\_", "_").replace("\\", "")

        # Preferred: fenced ```sql block
        m = re.search(r"```sql\n(.*?)(?=;|```)", llm_response, re.DOTALL)
        if m:
            sql = m.group(1).replace("```", "").strip()
            self.log(f"Extracted SQL: {sql}")
            return sql

        # Fallback: find the first SQL keyword, then slice to ; or fence
        start_match = re.search(r"\b(WITH|SELECT)\b", llm_response, re.IGNORECASE)
        if start_match:
            start = start_match.start()
            tail = llm_response[start:]
            end_match = re.search(r";|```", tail)
            end = end_match.start() if end_match else len(tail)
            sql = tail[:end].strip()
            self.log(f"Extracted SQL: {sql}")
            return sql

        return llm_response.strip()



def get_vn():

    vn = MusicVanna(config={
        'model' : 'qwen2.5-coder:14b',
        'ollama_host' : os.getenv('OLLAMA_HOST'),
        'path' : './chrome_db',
        'options' : {
            'temperature' : 0,
            'num_ctx' : 8192
        },
        'initial_prompt' : initial,
        'n_results' : 20
    })

    vn.connect_to_postgres(
        host=os.getenv('PG_HOST'),
        dbname=os.getenv('PG_DB'),
        user=os.getenv('PG_USER'),
        password=os.getenv('PG_PASSWORD'),
        port=int(os.getenv('PG_PORT', 5432))
    )

    return vn

if __name__ == '__main__':
    vn = get_vn()
    print('Vanna init')
    print('test DB:')
    result = vn.run_sql("SELECT COUNT(*) AS artist_count FROM artist")
    print(result)