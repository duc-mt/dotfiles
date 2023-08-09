#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# =============================================================================
#
#        FILE:  debugger.py
#      AUTHOR:  Henry Mai <henryfromvietnam@gmail.com>
#       USAGE:  Paste the code snippet which contains an error into the
#               code_with_error() function.
#               To see the error in beautiful tracebacks, uncomment line 32 and
#               comment out the last 4 lines.
# DESCRIPTION:  Lookup StackOverflow for the error found within code.
#     CREATED:  2022-04-25
#   I hereby declare that I completed this work without any improper help
#   from a third party and without using any aids other than those cited.
#
# =============================================================================


# ------------------------------- Module Import -------------------------------
import webbrowser


# ---------------------------- Function Definition ----------------------------
def code_with_error():
    """Paste the code that results in an error here."""
    print(1+'1')


# --------------------------- Call the Main Function --------------------------
if __name__ == '__main__':
    # code_with_error()
    try:
        code_with_error()
    except Exception as e:
        webbrowser.open('http://stackoverflow.com/search?q=[python] ' + str(e))
