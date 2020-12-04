.PHONY: build
build:
	@dune build
	@echo

.PHONY: day%
day%: build
	@echo "----"
	@./_build/default/$@.exe < ./input/$@.txt

