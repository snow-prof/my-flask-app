from flask import Flask
from app.utils import is_positive

app = Flask(__name__)

@app.get('/')
def hello_world():
    result = is_positive(10)
    return f'welcome {result}!'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
