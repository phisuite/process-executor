NAME=process-executor

PYTHON_VERSION?=3.8.1
SYS_PY?=~/.pyenv/versions/${PYTHON_VERSION}/bin/python
PYTHON?=.venv/bin/python
PORT?=50051

build:
	docker build -t phisuite/${NAME} .

start:
	docker run --rm -it -p ${PORT}:50051 phisuite/${NAME}

publish:
ifdef VERSION
	docker tag phisuite/${NAME} phisuite/${NAME}:${VERSION} && \
	docker push phisuite/${NAME}:latest && \
	docker push phisuite/${NAME}:${VERSION}
else
	echo "VERSION not defined"
endif

debug:
	${PYTHON} ./src/main.py --port ${PORT}

install:
	${SYS_PY} -m venv .venv && \
	${PYTHON} -m pip install -r requirements.txt
