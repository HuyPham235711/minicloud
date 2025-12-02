FROM python:3.11-slim
WORKDIR /app
RUN pip install --no-cache-dir flask python-jose requests
COPY app.py students.json ./
EXPOSE 8081
CMD ["python", "app.py"]
