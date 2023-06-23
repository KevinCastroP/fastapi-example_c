FROM python:3.9

RUN groupadd -r nonroot && useradd -r -g nonroot nonroot

RUN mkdir -p /home/nonroot && chown -R nonroot:nonroot /home/nonroot

USER nonroot

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir --upgrade --user -r /code/requirements.txt
COPY ./app /code/app

EXPOSE 8000

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
