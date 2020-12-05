.PHONY: day%
day%:
	@dune exec -- $@ < ./input/$@.txt
