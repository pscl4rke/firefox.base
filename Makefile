
# The problem with this is that the temporary directory
# gets created every time the Makefile is used and then
# not deleted afterwards.
# NOTE: It must be ":=" so that it is evaluated only
# once. Using "=" generates a new one per substitution.
temppath := $(shell mktemp --directory /tmp/firefox.XXXXXXX)

edit:
	firefox -no-remote -profile ./profile

trial:
	(cd profile && tar c .) | (cd $(temppath) && tar x)
	firefox -no-remote -profile $(temppath)


