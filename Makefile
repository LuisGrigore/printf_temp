# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lgrigore <lgrigore@student.42madrid.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/03/26 17:38:51 by lgrigore          #+#    #+#              #
#    Updated: 2025/03/26 17:38:55 by lgrigore         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC      = gcc
AR      = ar rcs
CFLAGS  = -Wall -Wextra -Werror -g
NAME    = libftprintf.a

SRC = ./format_funct_mapping/format_funct_mapping.c \
      ./ft_printf/ft_printf.c \
      ./libc/ft_bzero.c ./libc/ft_putnbr_fd.c ./libc/ft_isascii.c \
      ./libc/ft_itoa.c ./libc/ft_memset.c ./libc/ft_strlcpy.c \
      ./libc/ft_strrchr.c ./libc/ft_strncmp.c ./libc/ft_memcpy.c \
      ./libc/ft_memchr.c ./libc/ft_strlen.c ./libc/ft_putendl_fd.c \
      ./libc/ft_strmapi.c ./libc/ft_striteri.c ./libc/ft_strlcat.c \
      ./libc/ft_calloc.c ./libc/ft_strtrim.c ./libc/ft_toupper.c \
      ./libc/ft_strchr.c ./libc/ft_isdigit.c ./libc/ft_split.c \
      ./libc/ft_atoi.c ./libc/ft_tolower.c ./libc/ft_strdup.c \
      ./libc/ft_putchar_fd.c ./libc/ft_memcmp.c ./libc/ft_putstr_fd.c \
      ./libc/ft_strjoin.c ./libc/ft_strnstr.c ./libc/ft_isalpha.c \
      ./libc/ft_isalnum.c ./libc/ft_memmove.c ./libc/ft_substr.c \
      ./libc/ft_isprint.c \
      ./print_arg_functs/chars_functs.c ./print_arg_functs/num_functs.c \
      ./print_arg_functs/extra_functs.c ./print_functs/print_functs.c \
      ./print_functs/reverse_buff.c ./print_special_functs/print_special_functs.c

OBJ = $(SRC:.c=.o)

INC = -I./config -I./format_funct_mapping -I./ft_printf -I./libc -I./print_arg_functs -I./print_functs -I./print_special_functs

all: $(NAME)

$(NAME): $(OBJ)
	$(AR) $(NAME) $(OBJ)

%.o: %.c
	$(CC) $(CFLAGS) $(INC) -c $< -o $@

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
