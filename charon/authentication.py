from functools import wraps
from flask import request, Response, session, abort

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
        if not 'username' in session or not 'password' in session or not check_auth(session.get('username'), session.get('password')):
            return abort(403)
            #return Response('Login!', 401, {'WWW-Authenticate': 'Basic realm="Login!"'})
        return f(*args, **kwargs)
    return decorated

def authorise(username, password):
    return 0