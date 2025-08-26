# FROM cgr.dev/chainguard/python:latest
# # FROM python:3.11-slim
# WORKDIR /app
# COPY app/requirements.txt requirements.txt
# RUN apt update && apt install -y python3-pip
# RUN pip install --no-cache-dir -r requirements.txt
# COPY . .
# CMD ["python", "app.py"]

FROM cgr.dev/chainguard/python:latest-dev AS builder

ENV LANG=C.UTF-8
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PATH="/app/venv/bin:$PATH"

WORKDIR /app

RUN python -m venv /app/venv
COPY /app/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt



FROM cgr.dev/chainguard/python:latest

WORKDIR /app

ENV PYTHONUNBUFFERED=1
ENV PATH="/venv/bin:$PATH"

COPY /app/app.py /app
COPY --from=builder /app/venv /venv

ENTRYPOINT [ "python", "/app/app.py" ]