from flask import Flask
from app.utils import is_positive

app = Flask(__name__)

@app.route('/')
def hello_world():
    # 시연 중 텍스트를 수정하여 캐싱 및 업데이트 시연용으로 사용
    result = is_positive(10)
    return f'welcome {result}!'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
