from setuptools import setup, find_packages

setup(
    name="backup-mysql",
    version="0.1.6",
    description="Backup mysql utility",
    long_description="Backup mysql utility.",
    url="https://github.com/ptdorf/backup-mysql",
    author="ptdorf",
    author_email="ptdorf@gmail.com",
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
    keywords="backup mysql",
    packages=find_packages(exclude=["contrib", "docs", "tests"]),
    install_requires=["MySQL-python"],
    entry_points={
        "console_scripts": [
            "backup-mysql=backup.mysql:main",
        ],
    },
)
