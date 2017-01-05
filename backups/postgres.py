#!/usr/bin/env python
import os
import sys
import time
import yaml
import logging
import MySQLdb


def main():
  if len(sys.argv) < 2:
    exit('Usage: $0 <data-source> [<database>]')

  try:
    raise NotImplementedError('Adapter postgres is not implemented yet.')

  except Exception as e:
    exit('Error: %s' % (err))


if __name__ == '__main__':
  main()
