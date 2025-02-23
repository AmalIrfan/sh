long strncmp(const char *s1, const char *s2, long n)
{
	for (long i = 0; i < n; i ++) {
		if (s1[i] != s2[i])
			return (unsigned char)s1[i] - (unsigned char)s2[i];
	}
	return 0;
}
