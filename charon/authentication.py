from functools import wraps
from flask import request, Response

def check_auth(username, password):
    """
    Check the authorisation of a username and password

    :param username: the username to check
    :param password: the password to check
    :return: true if auth successful, false otherwise
    """
    return username == "koth" and password == "kothPassword"

def requires_auth(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        auth = request.authorization
        if not auth or not check_auth(auth.username, auth.password):
            return Response('Login!', 401, {'WWW-Authenticate': 'Basic realm="Login!"'})
        return f(*args, **kwargs)
    return decorated