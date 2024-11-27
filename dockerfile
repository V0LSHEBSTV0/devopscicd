FROM python:3.7-slim
RUN mkdir -p /usr/local/http-server
RUN useradd runner -d /home/runner -m -s /bin/bash
WORKDIR /usr/local/http-server
ADD ./application.py /usr/local/http-server/application.py
ADD ./index.html /usr/local/http-server/index.html
RUN chown -R runner:runner /usr/local/http-server/
EXPOSE 8000
USER runner
CMD ["python3", "-u", "/usr/local/http-server/application.py"]