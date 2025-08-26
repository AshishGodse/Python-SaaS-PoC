FROM cgr.dev/chainguard/python:latest
# FROM python:3.11-slim
WORKDIR /app
COPY app/requirements.txt requirements.txt
RUN apt update && apt install -y python3-pip
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
CMD ["python", "app.py"]