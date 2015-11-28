#!/usr/bin/env python3

"""
    Manage
    ======

    Management script to handle the running and deployment(?) of the Charon project.
"""


from charon import application


if __name__ == '__main__':
    application.run(debug=True)
