"""

"""
import os

import time


def get_file_data(path):
    """

    :param path:
    :return:
    """

    result = {
        'name': path.name,
        'isFile': path.is_file(),
        'size': os.path.getsize(str(path.resolve())),
        'lastModified': time.ctime(os.path.getmtime(str(path.resolve())))
    }

    return result
