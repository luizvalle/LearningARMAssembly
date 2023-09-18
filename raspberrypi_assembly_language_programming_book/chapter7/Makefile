ifdef DEBUG
DEBUGFLAGS = -g
else
DEBUGFLAGS =
endif

.PHONY: all
all: to_upper

to_upper: main.o to_upper.o
	ld $^ -o $@

main.o: main.s
	as $(DEBUGFLAGS) $< -o $@

to_upper.o: to_upper.s
	as $(DEBUGFLAGS) $< -o $@

.PHONY: clean
clean:
	rm -rf *.o to_upper

.SECONDARY: main.o

