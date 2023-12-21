PHONY: all
all: clean matrix_multiply


matrix_multiply: main.s matrix_multiply.s print.s
	gcc main.s matrix_multiply.s print.s -o $@ -march=armv8-a

.PHONY: clean
clean:
	rm -rf *.o matrix_multiply
