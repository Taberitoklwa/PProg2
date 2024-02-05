CC = gcc

CFLAGS = -c -g -Wall -pedantic -ansi

BINARY = anthill

OBJS = game.o command.o game_actions.o game_loop.o game_reader.o graphic_engine.o space.o

all: $(BINARY)

$(BINARY): $(OBJS)
	$(CC) -o $(BINARY) $(OBJS)


game.o: game.o: game.c game.h game_reader.h
	$(CC) -c	 game.c

	$(CC) $(CFLAGS) game.c

command.o: command.c command.h
	$(CC) $(CFLAGS) command.c

game_actions.o: game_actions.c game_actions.h game.h
	$(CC) $(CFLAGS) game_actions.c

game_loop.o: game_loop.c game_actions.h game.h command.h graphic_engine.h
	$(CC) $(CFLAGS) game_loop.c

game_reader.o: game_reader.c game_reader.h
	$(CC) $(CFLAGS) game_reader.c
 
graphic_engine.o: graphic_engine.c graphic_engine.h command.h libscreen.h space.h types.h
	$(CC) $(CFLAGS) graphic_engine.c
	
space.o: space.c space.h 
	$(CC) $(CFLAGS) space.c

clean: 
	rm -f $(BINARY) $(OBJS)
