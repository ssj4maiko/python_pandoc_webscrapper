FROM python:3-alpine

WORKDIR /app
RUN pip install --no-cache-dir lxml html5lib beautifulsoup4

CMD [ "sh", "scripts/shell-run-for-python.sh" ]