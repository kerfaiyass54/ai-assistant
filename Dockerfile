FROM python:3.14.2-alpine

WORKDIR /app

RUN pip install langchain langchain_community langchain_ollama duckduckgo-search

COPY ./assistant.py ./

EXPOSE 8080

CMD ["python", "assistant.py"]