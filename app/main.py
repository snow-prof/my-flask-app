from flask import Flask
from app.utils import is_positive


app = Flask(__name__)


@app.get('/')
def home():
    result = is_positive(10)
    return f'[v1] Flask CI/CD 데모 (로직 체크: {result})'


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

