
all:
	python setup.py sdist bdist_wheel upload

docs:
	cd docs && zip -r ../build/backups-docs.zip .

clean:
	rm -fr dist/ build/ *.egg-info

.PHONY: all docs clean
