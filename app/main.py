from flask import Flask
from app.utils import is_positive

app = Flask(__name__)

@app.route('/')
def hello_world():
    # 시연 중 텍스트를 수정하여 캐싱 및 업데이트 시연용으로 사용
    return '🚀 [v2] Flask 기반 프로덕션 CI/CD 파이프라인 데모 서버 구동 중!'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
