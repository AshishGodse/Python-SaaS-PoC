# FROM cgr.dev/chainguard/python:latest
From FROM python:3.11-slim
WORKDIR /app
COPY app/requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
CMD ["python", "app.py"]