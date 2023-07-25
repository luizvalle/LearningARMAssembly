all: first sum01 load01 store01 compare01 loop01 collatz array01 array02 array03 array04

first: first.o
	gcc $+ -o $@

first.o: first.s
	as $< -o $@

sum01: sum01.o
	gcc $+ -o $@

sum01.o: sum01.s
	as $< -o $@

load01: load01.o
	gcc $+ -o $@

load01.o: load01.s
	as $< -o $@

store01: store01.o
	gcc $+ -o $@

store01.o: store01.s
	as $< -o $@

compare01: compare01.o
	gcc $+ -o $@

compare01.o: compare01.s
	as $< -o $@

loop01: loop01.o
	gcc $+ -o $@

loop01.o: loop01.s
	as $< -o $@

collatz: collatz.o
	gcc $+ -o $@

collatz.o: collatz.s
	as $< -o $@

array01: array01.o
	gcc $+ -o $@

array01.o: array01.s
	as $< -o $@

array02: array02.o
	gcc $+ -o $@

array02.o: array02.s
	as $< -o $@

array03: array03.o
	gcc $+ -o $@

array03.o: array03.s
	as $< -o $@

array04: array04.o
	gcc $+ -o $@

array04.o: array04.s
	as $< -o $@

clean:
	rm -vf *.o first sum01 load01 store01 compare01 loop01 collatz array01 array02 array03 array04
