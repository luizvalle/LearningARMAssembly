.PHONY: all
all: clean distance

distance: main.o distance.o strtof.o
	ld main.o distance.o strtof.o -o distance

main.o: main.s
	as -mfpu=vfp main.s -o main.o -g

distance.o: distance.s
	as -mfpu=vfp distance.s -o distance.o -g

strtof.o: strtof.s
	as -mfpu=vfp strtof.s -o strtof.o -g

.PHONY: clean
clean:
	rm -rf *.o distance
