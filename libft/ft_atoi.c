/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_atoi.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: alusnia <alusnia@student.42Warsaw.pl>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/09/26 12:34:22 by alusnia           #+#    #+#             */
/*   Updated: 2025/10/06 07:04:32 by alusnia          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static int	ft_isspace(int c)
{
	if ((c >= 9 && c <= 13) || c == 32)
		return (8192);
	return (0);
}

int	ft_atoi(const char *nptr)
{
	int		x;
	int		sign;
	size_t	i;

	x = 0;
	sign = 1;
	i = 0;
	while (nptr[i])
	{
		if ((ft_isspace(nptr[i]) || nptr[i] == '+')
			&& (i == 0 || ft_isspace(nptr[i - 1])))
			i++;
		else if (nptr[i] == '-' && (i == 0 || ft_isspace(nptr[i - 1])))
		{
			sign = -1;
			i++;
		}
		else if (ft_isdigit(nptr[i]) != 0)
			x = (x * 10) + (nptr[i++] - '0');
		else
			break ;
	}
	return (x * sign);
}
