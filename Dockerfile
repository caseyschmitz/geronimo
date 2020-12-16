###########
# BUILDER #
###########
#FROM python:3.8.5 as builder

#WORKDIR /usr/src/app

#ENV PYTHONDONTWRITEBYTECODE 1
#ENV PYTHONUNBUFFERED 1

# python linting
#RUN pip install --upgrade pip
#RUN pip install flake8
#COPY . .
#RUN flake8 --ignore=E501,F401 .

#COPY requirements.txt .
#RUN pip wheel --no-cache-dir --no-deps --wheel-dir /usr/src/app/wheels -r requirements

#########
# FINAL #
#########
FROM python:3.8.5
ENV PYTHONBUFFERED=1

RUN mkdir -p /home/geronimo
RUN addgroup --system geronimo && adduser --system geronimo --ingroup geronimo

ENV HOME=/home/geronimo
ENV APP_HOME=/home/geronimo/backend
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

#RUN --from=builder /usr/src/app/wheels /wheels
#RUN --from=builder /usr/src/app/requirements.txt .

COPY requirements.txt $APP_HOME
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

#COPY requirements.txt $APP_HOME
#RUN pip install -r requirements.txt

COPY . $APP_HOME

RUN chown -R geronimo:geronimo $APP_HOME

USER geronimo
