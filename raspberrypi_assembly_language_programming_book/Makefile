ifdef DEBUG
DEBUGFLAGS = -g
else
DEBUGFLAGS =
endif

.PHONY: all
all: HelloWorld movexampls add add64

HelloWorld: HelloWorld.o
	ld $< -o $@

movexampls: movexampls.o
	ld $< -o $@

add: add.o
	ld $< -o $@

add64: add64.o
	ld $< -o $@

%.o: %.s
	as $(DEBUGFLAGS) $< -o $@

.PHONY: clean
clean:
	rm -rf *.o HelloWorld movexampls add add64
