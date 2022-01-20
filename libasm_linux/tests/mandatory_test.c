/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   mandatory_test.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tcharvet <tcharvet@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/05/10 21:34:56 by tcharvet          #+#    #+#             */
/*   Updated: 2021/05/10 23:23:07 by tcharvet         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "lib.h"

void	ft_strlen_test(void);
void	ft_strcmp_test(void);
void	ft_strcpy_test(void);
void	ft_strdup_test(void);
void	ft_read_test(void);

void	ft_write_test(void)
{
	int		i;

	printf("-----FT_WRITE--------------------------------------------\n\n");
	printf("~~~write to stdout stdout~~~\n");
	i = ft_write(1, "I write this string to stdout\n", 31);
	printf("(i): %i\n\n", i);
	printf("~~~wrong fd (-1)~~~\n");
	i = ft_write(-1, "hey", 3);
	printf("(i): %i\n", i);
	printf("(strerror): %s\n\n", strerror(errno));
}

int	main(void)
{	
	printf("======================MANDATORY PART======================\n\n");
	ft_strlen_test();
	ft_strcmp_test();
	ft_strcpy_test();
	ft_strdup_test();
	ft_read_test();
	ft_write_test();
}
