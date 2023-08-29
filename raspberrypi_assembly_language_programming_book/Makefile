ifdef DEBUG
DEBUGFLAGS = -g
else
DEBUGFLAGS =
endif

SOURCE_FILES = $(wildcard *.s)
OBJS = $(SOURCE_FILES:%.s=%.o)
EXECUTABLES = $(SOURCE_FILES:%.s=%.out)

.PHONY: all
all: $(EXECUTABLES)

%.out: %.o
	ld $< -o $@

%.o: %.s
	as $(DEBUGFLAGS) $< -o $@

.PHONY: clean
clean:
	rm -rf *.o $(EXECUTABLES)

.SECONDARY: $(OBJS)
