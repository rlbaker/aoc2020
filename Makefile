.PHONY: build
build:
	@dune build
	@echo
	@echo "----"

.PHONY: day%
day%: build
	@./_build/default/$@.exe < ./input/$@.txt

