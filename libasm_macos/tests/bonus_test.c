/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   bonus_test.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tcharvet <tcharvet@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/05/10 22:16:04 by tcharvet          #+#    #+#             */
/*   Updated: 2021/05/10 23:15:07 by tcharvet         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "lib.h"

void	free_func(void *data)
{	
	printf("---data deleted by free_func---\n");
	(void)data;
}

void	print_list(t_list *el)
{	
	printf("list_size: %i\n", ft_list_size(el));
	while (el)
	{
		printf("->%s\n", (char *)el->data);
		el = el->next;
	}
}

void	ft_list_test(t_list **begin)
{
	printf("-----FT_LIST--------------------------------------------\n");
	printf("ft_list_push_front ft_list_size ft_list_sort ft_list_remove_if\n");
	printf("\n1) printlist with empty list:\n\n");
	print_list(*begin);
	printf("\n2) now adding '1' '2' '3' '4' to list:\n\n");
	ft_list_push_front(begin, "1");
	ft_list_push_front(begin, "2");
	ft_list_push_front(begin, "3");
	ft_list_push_front(begin, "4");
	print_list(*begin);
	printf("\n3) now sort list with ft_list_sort and ft_strcmp\n\n");
	ft_list_sort(begin, ft_strcmp);
	print_list(*begin);
	printf("\n4) lets delete first element (if data is equal to '1')\n\n");
	ft_list_remove_if(begin, "1", ft_strcmp, free_func);
	print_list(*begin);
	printf("\n5) lets delete middle element (if data is equal to '3')\n\n");
	ft_list_remove_if(begin, "3", ft_strcmp, free_func);
	print_list(*begin);
	printf("\n6) lets delete last element (if data equal to '4')\n\n");
	ft_list_remove_if(begin, "4", ft_strcmp, free_func);
	print_list(*begin);
	printf("\n7) lets delete last element (if data equal to '2')\n\n");
	ft_list_remove_if(begin, "2", ft_strcmp, free_func);
	print_list(*begin);
}

void	ft_atoi_base_test(void)
{
	printf("-----FT_ATOI_BASE--------------------------------------------\n\n");
	printf("~~~incorrect base len 1: 'a'~~~\n%i\n\n", ft_atoi_base("ab", "a"));
	printf("~~~incorrect base len 0: ''~~~\n%i\n\n", ft_atoi_base("ab", ""));
	printf("~~~incorrect base with space~~~\n%i\n\n", ft_atoi_base("01", "01 "));
	printf("~~~incorrect base with tab~~~\n%i\n\n", ft_atoi_base("01", "01\n"));
	printf("~~~incorrect base with +~~~\n%i\n\n", ft_atoi_base("11", "+01"));
	printf("~~~incorrect base with -~~~\n%i\n\n\n", ft_atoi_base("11", "-01"));
	printf("~~~'10001' in base '01' -~~~\n%i\n\n", ft_atoi_base("10001", "01"));
	printf("~~~'-10001' in base '01' -~~~\n%i\n\n", ft_atoi_base("-10001", "01"));
	printf("~~~'++--10001' in base '01' -~~~\n%i\n\n", ft_atoi_base
		("++--10001", "01"));
	printf("~~~'++--10001' in base '01' -~~~\n%i\n\n", ft_atoi_base
		("++--10001", "01"));
	printf("~~~'ff' in hexa ~~~\n%i\n\n", ft_atoi_base("ff", "0123456789abcdef"));
	printf("~~~'2971db' in hexa ~~~\n%i\n\n", ft_atoi_base
		("2971db", "0123456789abcdef"));
}

int	main(void)
{
	t_list	*ptr;
	void	*copy;

	ptr = malloc(sizeof(t_list) * 1);
	if (!ptr)
		return (0);
	copy = ptr;
	ptr = 0;
	printf("======================BONUS PART======================\n\n");
	ft_atoi_base_test();
	ft_list_test(&ptr);
	free(copy);
}
