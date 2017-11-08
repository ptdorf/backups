from setuptools import setup, find_packages

setup(
    name="backups",
    version="0.1.12",
    description="Database backup utilities",
    long_description="Database backup utilities.",
    author="ptdorf",
    author_email="ptdorf@gmail.com",
    url="https://github.com/ptdorf/backups",
    download_url="https://github.com/ptdorf/backups/tarball/master",
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
    install_requires=[
        "MySQL-python"
    ],
    entry_points={
        "console_scripts": [
            "backup-mysql=backups.mysql:main",
            "backup-postgres=backups.postgres:main",
        ],
    },
    scripts=[
        "bin/backup-test"
    ]
)
