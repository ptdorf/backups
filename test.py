import os
def resolve(value):
    if value[0:1] == "$":
        value = os.environ.get(value[1:], value)

    return value


print(resolve("$USER"))
print(resolve("$HOSTNAME"))
print(resolve("$SHOW_AWS"))
