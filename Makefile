# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: alusnia <alusnia@student.42Warsaw.pl>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/30 11:55:38 by alusnia           #+#    #+#              #
#    Updated: 2026/02/05 19:10:20 by alusnia          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		= libftprintf.a

CC			= cc

CFLAGS		=-g -Wall -Werror -Wextra -I$(INCS_DIR) -I./libft/incs

SRCS_DIR	= ./srcs

OBJS_DIR 	= ./objs

OBJS		= $(addprefix $(OBJS_DIR)/,$(SRCS:.c=.o))

INCS_DIR	= ./incs

INCS		= $(INCS_DIR)/ft_printf.h

LIBFT_DIR	= ./libft

LIBFT_URL	= https://github.com/alusnia/42_libft

LIBFT		= $(LIBFT_DIR)/libft.a

SRCS		= ft_printf.c

SEP			= "\n------------------------------------------------------------\n"

all: $(NAME)

$(NAME): $(LIBFT) $(OBJS)
	cp $(LIBFT) $(NAME)
	ar rcs $(NAME) $(OBJS)

$(LIBFT_DIR):
	@echo $(SEP)
	@echo "Missing library libft.\nDownloading from $(LIBFT_URL)"
	@echo $(SEP)
	@mkdir -p $(LIBFT_DIR)
	@git clone $(LIBFT_URL) $(LIBFT_DIR)

$(LIBFT): | $(LIBFT_DIR)
	$(MAKE) -C $(LIBFT_DIR)

$(OBJS_DIR)/%.o: $(SRCS_DIR)/%.c $(INCS) | $(OBJS_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJS_DIR):
	mkdir -p $(OBJS_DIR)

clean:
	@rm -rf $(OBJS_DIR)
	@if [ -d $(LIBFT_DIR) ]; then $(MAKE) -C $(LIBFT_DIR) clean; fi

fclean: clean
	@rm -f $(NAME)
	@if [ -d $(LIBFT_DIR) ]; then $(MAKE) -C $(LIBFT_DIR) fclean; fi

del_lib:
	@echo $(SEP)
	@echo "Deleting library libft"
	@echo $(SEP)
	@rm -rf $(LIBFT_DIR)

re: del_lib fclean all

.PHONY: all clean fclean re del_lib