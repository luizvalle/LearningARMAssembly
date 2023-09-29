.PHONY: all
all: clean toupper


toupper: main.c toupper.s
	gcc main.c toupper.s -o toupper

.PHONY: clean
clean:
	rm -f *.o toupper
