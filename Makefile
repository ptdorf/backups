
all:
	python setup.py sdist bdist_wheel upload

docs:
	cd docs && zip -r ../backup-mysql.zip .

.PHONY: all docs
