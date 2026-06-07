CC := $(CROSS_COMPILE)gcc

TARGET := writer

all: $(TARGET)

$(TARGET): writer.o
	$(CC) -o $@ $^

writer.o: writer.c
	$(CC) -Wall -Werror -c writer.c

clean:
	rm -f $(TARGET) *.o

.PHONY: all clean