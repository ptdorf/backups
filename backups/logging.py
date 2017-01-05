import time


def info(message):
    now = time.strftime("%Y-%m-%d %H:%M:%S")
    print("%s  %s" %(now, message))

def debug(message):
    # print(message)
    pass
