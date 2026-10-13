#!/usr/bin/env python3
"""
==============================================================================
Module Name:   stuck-overflow.py
Description:   Source module stuck-overflow.py.
Author:        Mai Tan Duc <ducmai.network@gmail.com>
Created:       2026-10-10
Version:       1.0.0
License:       MIT
==============================================================================
Usage:         python3 stuck-overflow.py [options]
Notes:         Requires Python 3.8+
==============================================================================
"""

import webbrowser

# Enhance tracebacks
from rich.traceback import install

install(show_locals=True)


# ---------------------------- Function Definition ----------------------------
def code_with_error():
    """Paste the code that results in an error here."""
    print(1 + "1")


# ------------------------------- Main Function -------------------------------
def main():
    # code_with_error()
    try:
        code_with_error()
    except Exception as e:
        import urllib.parse

        query = urllib.parse.quote_plus(str(e))
        webbrowser.open("https://stackoverflow.com/search?q=[python]+" + query)


# -------------------------- Call the Main Function ---------------------------
if __name__ == "__main__":
    main()
