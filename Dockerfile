FROM python:3.7

# install dependencies
RUN apt update && \
    apt add --virtual build-deps gcc python-dev musl-dev

# set working directory
WORKDIR /app

# add and install requirements
COPY ./requirements/install.txt requirements.txt
RUN pip install -r requirements.txt

COPY ./src/ /app/src
COPY ./tests/ /app/tests


# add entrypoint.sh
COPY ./entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# add app

# run server
CMD tail -f /dev/null