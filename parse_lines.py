#!/usr/bin/python3

import sys

for i in range(1, len(sys.argv)):
	line = sys.argv[i]
	if "==" != line[0:2]:
		parsed_line = "./" + line.replace("-=-", " ")
		sys.stdout.write(parsed_line)
