FROM python:3.8

RUN pip install pipenv

ENV PROJECT_DIR /usr/bin/src/webapp
ENV SRC_DIR ${PROJECT_DIR}/src

COPY Pipfile Pipfile.lock ${PROJECT_DIR}/

WORKDIR ${PROJECT_DIR}

RUN pipenv install --system --dev

COPY ./src ${SRC_DIR}/

WORKDIR ${SRC_DIR}

ENV PYTHONUNBUFFERED=1

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
