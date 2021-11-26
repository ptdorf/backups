
.PHONY: all
all: clean build release

.PHONY: clean
clean:
	rm -frv dist/ build/ *.egg-info
	rm -frv backups/__pycache__
	rm -frv .pytest_cache

.PHONY: build
build: clean
	# python setup.py sdist bdist_wheel upload
	# python3 -m pip install --upgrade setuptools wheel
	python3 setup.py sdist bdist_wheel

.PHONY: release
release:
	python3 -m twine upload dist/*

.PHONY: test
test:
	pytest
	pip install .
	backups --version
	python3 -m twine upload --repository testpypi dist/*

.PHONY: docs
docs:
	mkdir -p build
	cd ./docs \
		&& zip -r ../build/$(shell echo $(shell basename $(PWD)))-docs.zip . \
		&& ls -la ../build/*-docs.zip
