#!/usr/bin/env python

"""
Copyright (c) 2020 NIDDS developers (https://github.com/prasanthc41m/nidds/)
See the file 'LICENSE' for copying permission
"""

import re

from core.common import retrieve_content

__url__ = "https://data.netlab.360.com/feeds/dga/chinad.txt"
__check__ = "netlab 360"
__info__ = "chinad dga (malware)"
__reference__ = "360.com"

def fetch():
    retval = {}
    content = retrieve_content(__url__)

    if __check__ in content:
        for match in re.finditer(r"(?m)^([\w.]+)\s+2\d{3}\-", content):
            retval[match.group(1)] = (__info__, __reference__)

    return retval
