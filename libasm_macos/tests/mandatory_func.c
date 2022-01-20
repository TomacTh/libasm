/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   mandatory_func.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tcharvet <tcharvet@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/05/10 21:34:56 by tcharvet          #+#    #+#             */
/*   Updated: 2021/05/10 23:22:56 by tcharvet         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "lib.h"

void	ft_strlen_test(void)
{	
	printf("-----FT_STRLEN--------------------------------------------\n\n");
	printf("strlen | ft_strlen (empty string)\n");
	printf("     %lu | %lu\n\n", strlen(""), ft_strlen(""));
	printf("strlen | ft_strlen (hello world !)\n");
	printf("    %lu | %lu\n\n", strlen("hello world !"), ft_strlen
		("hello world !"));
	printf("strlen | ft_strlen (welcome to 42 Nice)\n");
	printf("    %lu | %lu\n\n", strlen("welcome to 42 Nice"), ft_strlen
		("welcome to 42 Nice"));
}

void	ft_strcmp_test(void)
{
	printf("-----FT_STRCMP--------------------------------------------\n\n");
	printf("strcmp | ft_strcmp ('', '')\n");
	printf("     %i | %i\n\n", strcmp("", ""), ft_strcmp("", ""));
	printf("strcmp | ft_strcmp ('abcd', 'abcd')\n");
	printf("     %i | %i\n\n", strcmp("abcd", "abcd"), ft_strcmp("abcd", "abcd"));
	printf("strcmp | ft_strcmp ('abb', 'abc')\n");
	printf("    %i | %i\n\n", strcmp("abb", "abc"), ft_strcmp("abb", "abc"));
	printf("strcmp | ft_strcmp ('abc', 'abb')\n");
	printf("     %i | %i\n\n", strcmp("abc", "abb"), ft_strcmp("abc", "abb"));
}

void	ft_strcpy_test(void)
{	
	char	s1[1];
	char	s2[14];
	char	s3[18];

	printf("-----FT_STRCPY--------------------------------------------\n\n");
	printf("~~ft_strcpy '' in s1~~\n");
	printf("(return func): %s\n(s1)         : %s\n\n", ft_strcpy(s1, ""), s1);
	printf("~~ft_strcpy 'hello world !' in s2~~\n");
	printf("(return func): %s\n(s2)         : %s\n\n", ft_strcpy
		(s2, "hello world !"), s2);
	printf("~~ft_strcpy 'welcome to 42 Nice' in s3~~\n");
	printf("(return func): %s\n(s3)         : %s\n\n", ft_strcpy
		(s3, "welcome to 42 Nice"), s3);
}

void	ft_strdup_test(void)
{
	char	*s1;
	char	*s2;
	char	*s3;

	s1 = ft_strdup("");
	s2 = ft_strdup("this string was malloc by strdup");
	s3 = ft_strdup("welcome to 42 Nice");
	printf("-----FT_STRDUP--------------------------------------------\n\n");
	printf("~~ft_strdup '' in s1~~\n");
	printf("s1: %s\n\n", s1);
	printf("~~ft_strdup 'this string was malloc by strdup' in s2~~\n");
	printf("s2: %s\n\n", s2);
	printf("~~ft_strdup 'welcome to 42 Nice' in s3~~\n");
	printf("s3: %s\n", s3);
	free(s1);
	free(s2);
	free(s3);
	printf("free\n\n");
}

void	ft_read_test(void)
{	
	char	buf[4096];
	int		i;

	printf("-----FT_READ--------------------------------------------\n\n");
	printf("~~~read 50max from stdin~~~\n");
	i = ft_read(0, buf, 50);
	printf("(buf): %s(i): %i\n", buf, i);
	printf("(strerror): %s\n\n", strerror(errno));
	printf("~~~wrong fd (-1)~~~\n");
	i = ft_read(-1, buf, 50);
	printf("(i): %i\n", i);
	printf("(strerror): %s\n\n", strerror(errno));
}
