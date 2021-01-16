FROM python:3.8.7

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN pip install Flask==1.1.2 uWSGI requests==2.20.0 redis==3.5.3
WORKDIR /app
COPY app /app
COPY cmd.sh /

EXPOSE 9090 9091
USER uwsgi

CMD ["/cmd.sh"]