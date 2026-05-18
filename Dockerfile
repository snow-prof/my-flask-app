# Stage 1: Builder
FROM python:3.11-slim AS builder 
# (※ Docker 공식 Python 3.14 슬림 이미지가 아직 불안정할 수 있으므로, 빌드는 3.11/3.12를 쓰는 것이 CI 안정성에 좋습니다.)
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY app/ ./app/

# Stage 2: Production
FROM gcr.io/distroless/python3-debian12
WORKDIR /app
COPY --from=builder /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages
COPY --from=builder /app /app
ENV PYTHONPATH=/usr/local/lib/python3.11/site-packages
EXPOSE 5000
ENTRYPOINT ["python", "/app/app/main.py"]
