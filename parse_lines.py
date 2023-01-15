#!/usr/bin/python3

import sys

exit_success = True

for i in range(1, len(sys.argv)):
	line = sys.argv[i]
	if "==" != line[0:2] and "Directories" != line[0:len("Directories")] and "Subprocess" != line[0:len("Subprocess")]:
		exit_success = False
		parsed_line = "./" + line.replace("-=-", " ") + "\n"
		sys.stdout.write(parsed_line)

if not exit_success:
	sys.exit(1)
