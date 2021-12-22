.PHONY: lint # if I want to setup linting for the code

NAME=heimdall

install:
	pip install -r requirements.txt && pip install -e .

lint: # for linting python files
	pip install isort && isort . --atomic && pip install black && black **/*.py

build:
	pip install wheel && python setup.py bdist_wheel && python setup.py sdist && pip install twine

release:
	twine upload dist/*

release-test:
	twine upload --repository testpypi dist/*