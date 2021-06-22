FROM python

WORKDIR /app

COPY pyproject.toml poetry.lock ./

RUN pip install poetry \
    && poetry config virtualenvs.create false \
    && poetry install

COPY locustfile.py ./

EXPOSE 8089 

# Set the entrypoint
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]