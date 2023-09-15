NAME = libexecution.a

SRCS = $(wildcard *.c) $(wildcard builtins/*.c) $(wildcard env_variables_list/*.c) $(wildcard pipes_and_processes/*.c)  $(wildcard redirections/*.c) $(wildcard *.c)

CC = cc -I/usr/local/Cellar/readline/8.1/include ../Libft/libft.a ../parse/parse.a 

CFLAGS = -Wall -Werror -Wextra -I../Includes

OBJ = $(SRCS:.c=.o)

all: $(NAME)

%.o: %.c
		$(CC) $(CFLAGS) -c $< -o $@

$(NAME): $(OBJ) 
		ar rcs $(NAME) $(OBJ)

clean: 
		rm -rf $(OBJ)

fclean: clean
		rm -f $(NAME)

norm:
		norminette *.c
		norminette *.h

re: fclean all

.PHONY: all clean fclean re