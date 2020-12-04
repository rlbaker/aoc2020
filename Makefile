.PHONY: build
build:
	@ dune build
	@echo

.PHONY: clean
clean:
	@ dune clean

.PHONY: day1
day1: build
	@ ./_build/default/bin/day1.exe < input/day1.txt

.PHONY: day2
day2: build
	@ ./_build/default/bin/day2.exe < input/day2.txt

.PHONY: day3
day3: build
	@ ./_build/default/bin/day3.exe < input/day3.txt
