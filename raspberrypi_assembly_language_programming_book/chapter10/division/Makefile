.PHONY: all
all: clean division


division: division.s debug.s
	gcc division.s -o division -march=armv8-a

.PHONY: clean
clean:
	rm -rf *.o division
