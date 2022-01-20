/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   lib.h                                              :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tcharvet <tcharvet@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/05/06 23:31:37 by tcharvet          #+#    #+#             */
/*   Updated: 2021/05/06 23:32:17 by tcharvet         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */



#ifndef LIBASM_H
# define LIBASM_H
# include <string.h>
# include <errno.h>
# include <stdlib.h>
# include <stdio.h>
# include <unistd.h>
# include <fcntl.h>

size_t	ft_strlen(char *s);
int		ft_strcmp(char *s1, char *s2);
char	*ft_strcpy(char *dst, char *src);
ssize_t	ft_write(int fd, void *buf, size_t count);
ssize_t	ft_read(int fd, void *buf, size_t count);

char	*ft_strdup(char *src);

typedef struct	s_list
{
	void		*data;
	struct s_list	*next;
}			t_list;

int	ft_list_size(t_list *begin);
void ft_list_push_front(t_list **begin_list, void *data);
void ft_list_sort(t_list **begin_list, int (*cmp)());
int	 ft_atoi_base(char *str, char *base);
void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), 
	void (*free_fct)(void *));

#endif
