from setuptools import setup, find_packages

# from codecs import open
# from os import path
# here = path.abspath(path.dirname(__file__))
# with open(path.join(here, 'Readme.md'), encoding='utf-8') as f:
#     long_description = f.read()

setup(
    name="backups",
    version="0.1.6",
    description="Database backup utilities",
    long_description="Database backup utilities.",
    author="ptdorf",
    author_email="ptdorf@gmail.com",
    url="https://github.com/ptdorf/backups",
    keywords="backup mysql",
    license="MIT",
    classifiers=[
        "Development Status :: 3 - Alpha",
        "Intended Audience :: Developers",
        "Topic :: Software Development :: Build Tools",
        "License :: OSI Approved :: MIT License",
        "Programming Language :: Python :: 2",
        "Programming Language :: Python :: 2.6",
        "Programming Language :: Python :: 2.7",
    ],
    packages=find_packages(exclude=["docs", "tests"]),
    install_requires=["MySQL-python"],
    entry_points={
        "console_scripts": [
            "backup-mysql=backups.mysql:main",
            "backup-postgres=backups.postgres:main",
        ],
    },
)
