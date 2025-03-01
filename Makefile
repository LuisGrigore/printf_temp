CC = gcc
AR = ar
CFLAGS = -Wall -Wextra -Werror -g
NAME = libftprintf.a
SRC_DIRS = $(shell find . -type d)
SRC = $(foreach dir, $(SRC_DIRS), $(wildcard $(dir)/*.c))
OBJ = $(SRC:.c=.o)
INC = $(foreach dir, $(SRC_DIRS), -I$(dir))
LIBS = $(filter-out $(NAME), $(wildcard *.a))  # Excluir libftprintf.a de las bibliotecas

all: $(NAME)

$(NAME): $(OBJ)
	$(AR) rcs $@ $^

%.o: %.c
	$(CC)  $(INC) -c $< -o $@

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
