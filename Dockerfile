FROM ubuntu:22.04

RUN apt-get update && apt-get install -y python3 python3-pip postgresql-client libpq-dev

RUN pip3 install poetry

WORKDIR /app

COPY pyproject.toml ./
RUN poetry install --no-root

COPY todo todo

CMD ["bash","-c","sleep 10 && poetry run flask --app todo run --host 0.0.0.0 --port 6400"]