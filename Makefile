all: clean build release

clean:
	rm -frv dist/ build/ *.egg-info

build: clean
	# python setup.py sdist bdist_wheel upload
	# python3 -m pip install --upgrade setuptools wheel
	python3 setup.py sdist bdist_wheel

release:
	python3 -m twine upload dist/*

test:
	python3 -m twine upload --repository testpypi dist/*
	pytest

docs:
	mkdir -p build
	cd ./docs \
		&& zip -r ../build/$(shell echo $(shell basename $(PWD)))-docs.zip . \
		&& ls -la ../build/*-docs.zip

.PHONY: all clean build release test docs
