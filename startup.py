"""
Startup script for ipython
"""

# Enable autoreload
from IPython import get_ipython

ipython = get_ipython()
if ipython:
    ipython.run_line_magic("load_ext", "autoreload")
    ipython.run_line_magic("autoreload", "2")

# Auto import modules
import os
import sys
