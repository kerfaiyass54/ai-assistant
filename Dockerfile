FROM python:3.11-slim

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

ENV OLLAMA_BASE_URL=http://host.docker.internal:11434

RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir \
    langchain \
    langchain-community \
    langchain-ollama \
    duckduckgo-search

COPY ./assistant.py ./

CMD ["python", "assistant.py"]