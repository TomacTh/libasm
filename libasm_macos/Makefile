CC = gcc
FLAGS = -Wall -Werror -Wextra
NFLAGS = -fmacho64
NAME = libasm.a
INC = ./inc
SRCS = $(addprefix ./srcs/, ft_strlen.s ft_strcmp.s ft_strcpy.s ft_strdup.s \
	ft_read.s ft_write.s)
SRCSBONUS = $(addprefix ./srcs/, ft_list_size_bonus.s ft_list_push_front_bonus.s \
	ft_list_sort_bonus.s ft_atoi_base_bonus.s ft_list_remove_if_bonus.s)
TEST = ./tests

OBJ = $(SRCS:.s=.o)

OBJBONUS = $(SRCSBONUS:.s=.o)

all: $(NAME)

%.o: %.s
	nasm $(NFLAGS) -I$(INC) -o $@ $<

$(NAME): $(OBJ)
	ar rcs $(NAME) $(OBJ)
		
bonus: $(OBJBONUS)
	ar rcs $(NAME) $(OBJBONUS)

test:
	$(CC) -I $(INC) $(FLAGS) $(TEST)/mandatory_test.c $(TEST)/mandatory_func.c $(NAME) -o test_mandatory && ./test_mandatory

testbonus:
	$(CC) -I $(INC) $(FLAGS) $(TEST)/bonus_test.c  $(NAME) -o test_bonus && ./test_bonus
	
clean:
	rm -f $(OBJ) $(OBJBONUS)
fclean: clean
	rm -rf $(NAME) test_mandatory test_bonus

re: fclean all

.PHONY: all bonus clean fclean test re
