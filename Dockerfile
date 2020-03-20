FROM python:3.8
WORKDIR /app
COPY requirements.txt ./
RUN python -m pip install -r requirements.txt
COPY ./src .
EXPOSE 50051
CMD ["python", "-OO", "main.py"]
