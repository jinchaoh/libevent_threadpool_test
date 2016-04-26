.SUFFIXES:
.SUFFIXES: .c .o

.PHONY: clean

CC = gcc
CFLAGS = -Wall -Iinclude
LDFLAGS = -levent -pthread
SRCDIR = src
OBJDIR = obj
SRCS = $(addprefix $(SRCDIR)/, logger.c conf.c worker.c server.c main.c)
OBJS = $(addprefix $(OBJDIR)/, logger.o conf.o worker.o server.o main.o)
EXE = main

$(EXE): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(EXE) $(LDFLAGS)

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm $(OBJS) $(EXE)