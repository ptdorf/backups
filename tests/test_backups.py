# The inclusion of the tests module is not meant to offer best practices for
# testing in general, but rather to support the `find_packages` example in
# setup.py that excludes installing the "tests" package
import backups.version

def test_true():
  assert True


def test_version():
  assert backups.version.VERSION is not None
