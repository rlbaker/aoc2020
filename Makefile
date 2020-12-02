.PHONY: build
build:
	@ dune build
	@echo

.PHONY: clean
clean:
	@ dune clean

.PHONY: day1
day1: build
	@ ./_build/default/bin/day1.exe < data/input_day1.txt

.PHONY: day2
day2: build
	@ ./_build/default/bin/day2.exe < data/input_day2.txt
