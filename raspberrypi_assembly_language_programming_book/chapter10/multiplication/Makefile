.PHONY: all
all: clean multiply

multiply: multiply.s strtoi.s
	gcc multiply.s strtoi.s -o multiply -g

.PHONY: clean
clean:
	rm -rf *.o multiply
