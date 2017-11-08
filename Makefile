
all: test docs release

release:
	python setup.py sdist bdist_wheel upload

test:
	pytest

docs:
	@cd docs \
	&& zip -r ../build/$(shell echo $(shell basename $(PWD)))-docs.zip . \
	&& ls -la ../build/*-docs.zip

clean:
	rm -fr dist/ build/ *.egg-info

.PHONY: all release test docs clean
