#!/usr/local/bin/python

import re
import sys

def convert_filename(filename):
	stripped = filename.replace('.py', '')
	cameled = re.sub(r'_([a-z])', _upper, stripped)
	classy = cameled[0].upper() + cameled[1:]
	return classy

def _upper(match):
	return match.group(1).upper()



if __name__ == '__main__':
	if len(sys.argv) > 1:
		sys.stdout.write(convert_filename(sys.argv[1]))
	else:
		for filename in sys.stdin:
			sys.stdout.write(convert_filename(filename))
