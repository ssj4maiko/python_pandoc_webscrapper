FROM python:3-alpine

WORKDIR /usr/src/app
RUN pip install --no-cache-dir lxml html5lib beautifulsoup4

CMD [ "sh", "shell-run-for-python.sh" ]