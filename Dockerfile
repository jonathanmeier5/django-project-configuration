FROM python:3.8

RUN pip install poetry

ENV PROJECT_DIR /usr/bin/src/webapp
ENV SRC_DIR ${PROJECT_DIR}/src

COPY pyproject.toml poetry.lock ${PROJECT_DIR}/

WORKDIR ${PROJECT_DIR}

RUN poetry config virtualenvs.create false
RUN poetry install --no-root

COPY ./src ${SRC_DIR}/

WORKDIR ${SRC_DIR}

ENV PYTHONUNBUFFERED=1

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
