
all:
	python setup.py sdist bdist_wheel upload

docs:
	cd docs && zip -r ../build/backups-docs.zip .

.PHONY: all docs
