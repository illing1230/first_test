FROM robot-ai-part-docker.bart.sec.samsung.net/base/python:3.8-slim
RUN mkdir -p ~/app
WORKDIR ~/app
COPY requirements.txt .
RUN pip install -r requirements.txt -i https://bart.sec.samsung.net/artifactory/api/pypi/pypi-remote/simple
COPY . .
EXPOSE 5000
ENTRYPOINT ["gunicorn", "--timeout", "60", "-b", "0:5000", "Unlock_flask_main:app"]
