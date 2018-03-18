# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ymarchys <ymarchys@student.unit.ua>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/03/10 18:08:28 by ymarchys          #+#    #+#              #
#    Updated: 2018/03/18 14:07:43 by ymarchys         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = fdf

# At home (XQuartz):
#FLAGS = -Wall -Wextra -Werror -I /usr/X11/include -g -L /usr/X11/lib -lmlx \
# -framework OpenGL -framework AppKit
# at UNIT:
# I turned off -Wall -Wextra -Werror
FLAGS = -lmlx -framework OpenGL -framework AppKit

FDF = main.c\
	  fdf_error.c\
	  manage_control_keys.c\
	  click_x.c\
	  draw_map.c\
	  put_pixel.c\
	  apply_multiplier.c\
	  define_offset.c\

OBJ = $(FDF: .c = .o)

all: $(NAME)

$(NAME): $(OBJ)
	@make -C ./libft/
	@printf '\033[32m[ ✔ ] %s\n\033[0m' "Compiling FDF"
	@gcc $(FLAGS) $(FDF) ./libft/libft.a -o $(NAME)
	@printf '\033[32m[ ✔ ] %s\n\033[0m' "Done"

clean:
	@make -C ./libft/ clean
#	At home during compilation was creating debug symbols file
#	@rm -rf fdf.dSYM

fclean: clean
	@make -C ./libft/ fclean
	@/bin/rm -f $(NAME)

re: fclean all