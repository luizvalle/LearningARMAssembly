.PHONY: all
all: clean distance

distance: main.o distance.o
	ld main.o distance.o -o distance

main.o: main.s
	as -mfpu=vfp main.s -o main.o

distance.o: distance.s
	as -mfpu=vfp distance.s -o distance.o

.PHONY: clean
clean:
	rm -rf *.o distance
