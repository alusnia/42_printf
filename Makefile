# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: alusnia <alusnia@student.42Warsaw.pl>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/30 11:55:38 by alusnia           #+#    #+#              #
#    Updated: 2025/10/28 20:57:38 by alusnia          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a
CFLAGS = -Wall -Werror -Wextra -I.
LIBFT_FILES = $(addprefix libft/, ft_substr.c ft_putnbr_fd.c ft_isdigit.c ft_atoi.c ft_isalpha.c \
        ft_memmove.c ft_isprint.c ft_memchr.c ft_striteri.c ft_putendl_fd.c \
        ft_strmapi.c ft_strrchr.c ft_toupper.c ft_memset.c ft_itoa.c \
        ft_isalnum.c ft_strtrim.c ft_putchar_fd.c ft_putstr_fd.c ft_strjoin.c \
        ft_strlcat.c ft_strdup.c ft_memcmp.c ft_memcpy.c ft_bzero.c ft_tolower.c \
        ft_strchr.c ft_strncmp.c ft_strnstr.c ft_strlcpy.c ft_strlen.c \
        ft_calloc.c ft_isascii.c ft_split.c ft_lstsize.c ft_lstnew.c ft_lstlast.c \
        ft_lstdelone.c ft_lstclear.c ft_lstadd_front.c ft_lstadd_back.c \
		ft_lstiter.c ft_lstmap.c ft_putptr_fd.c ft_puthex_fd.c ft_putunbr_fd.c)

PRINTF_FILES = ft_printf.c

FILES = $(LIBFT_FILES) $(PRINTF_FILES)

OBJ = $(FILES:%.c=%.o)

all: $(NAME)

$(NAME): $(OBJ)
	ar rcs $(NAME) $(OBJ)

%.o: %.c ft_printf.h libft.h
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
