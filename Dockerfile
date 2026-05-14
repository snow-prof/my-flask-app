# Stage 1: 빌드 환경
FROM python:3.14-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY app/ ./app/

# Stage 2: 운영 환경 (보안 및 경량화)
FROM gcr.io/distroless/python3-debian11
WORKDIR /app
COPY --from=builder /usr/local/lib/python3.14/site-packages /usr/local/lib/python3.14.3/site-packages
COPY --from=builder /app /app
ENV PYTHONPATH=/usr/local/lib/python3.14/site-packages
EXPOSE 5000
ENTRYPOINT ["python", "/app/app/main.py"]
