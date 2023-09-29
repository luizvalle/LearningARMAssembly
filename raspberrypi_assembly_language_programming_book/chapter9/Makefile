.PHONY: all
all: clean add


add: main.s add.s input.s
		gcc main.s add.s input.s -o add

.PHONY: clean
clean:
		rm -f *.o add
