CC = gcc
CFLAGS = -Wall -Wextra -std=c99

SOURCES = $(wildcard source/*.c)
OBJECTS = $(patsubst source/%.c, source/%.o, $(SOURCES))

all: papercrypt

papercrypt: $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ $^ -lssl

source/%.o: source/%.c
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -f source/*.o papercrypt

.PHONY: all clean
