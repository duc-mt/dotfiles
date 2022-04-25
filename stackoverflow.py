#!/usr/bin/python3
# -*- coding: utf-8 -*-

# ----------------------------------------------------------------------------
# |
# |        File:  stackoverflow.py
# |      Author:  Tan Duc Mai
# |       Email:  tan.duc.work@gmail.com
# |        Date:  25-Apr-2022
# | Description:  Paste the code snippet which contains an error into the
# |               code_with_error() function.
# |               The error will then be forwarded to stackoverflow website.
# |   I hereby declare that I completed this work without any improper help
# |   from a third party and without using any aids other than those cited.
# |
# ----------------------------------------------------------------------------

# ------------------------------- Module Import -------------------------------
import webbrowser


# ---------------------------- Function Definition ----------------------------
def code_with_error():
    pass


# --------------------------- Call the Main Function --------------------------
if __name__ == '__main__':
    try:
        code_with_error()
    except Exception as e:
        webbrowser.open('http://stackoverflow.com/search?q=[python] ' + str(e))
