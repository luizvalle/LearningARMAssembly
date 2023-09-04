ifdef DEBUG
DEBUGFLAGS = -g
else
DEBUGFLAGS =
endif

SOURCE_FILES = $(wildcard *.s)
OBJS = $(SOURCE_FILES:%.s=%.o)

.PHONY: all
all: to_upper

to_upper: $(OBJS)
	ld $^ -o $@

%.o: %.s
	as $(DEBUGFLAGS) $< -o $@

.PHONY: clean
clean:
	rm -rf *.o to_upper

.SECONDARY: $(OBJS)

