"""
    Views
    =====

    Url routes are specified here.
"""


from . import application


@application.route('/')
def index():
    """
    Root path of the website.
    :return: HTML content of the rooth path.
    """

    return '<h1>Knights of the Hexagon</h1>'