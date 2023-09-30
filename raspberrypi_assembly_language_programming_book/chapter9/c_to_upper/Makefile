OBJS = toupper.o

.PHONY: all
all: clean toupper toupper2

%.o: %.s
	as $< -o $@

toupper: main.c toupper.o
	gcc main.c toupper.o -o toupper

# Static library
libtoupper.a: $(OBJS)
	ar -cvq $@ $<

toupper2: main.c libtoupper.a
	gcc main.c libtoupper.a -o toupper2

.PHONY: clean
clean:
	rm -f *.o toupper libtoupper.a toupper2
