void exit(long);

long readf(long fd, char *buf, long count);
long read(char **rbuf);

long writef(long fd, char *buf, long count);
long write(const char *buf, long count);

long strncmp(const char *s1, const char *s2, long n);

long chdir(const char *pathname);
long getcwd(char **rbuf);

#define S(s) s, (sizeof(s)-1)

void _start()
{
	write(S("Program commencing.\n"));

	char *buf = 0;
	long n = 0;

	while (1) {
		write(S("> "));
		
		n = read(&buf);
		
		if (strncmp(buf, S("cd")) == 0) {
			write(S("Change directory function commencing.\n"));
			buf[n-1] = '\0';
			chdir(buf + 3);
			n = getcwd(&buf);
			write(S("CWD: "));
			write(buf, n - 1);
			write(S("\n"));
		} else if (strncmp(buf, S("ls")) == 0) {
			write(S("List directory function commencing.\n"));
		} else if (strncmp(buf, S("pwd")) == 0) {
			write(S("Print current working directory function commencing.\n"));
			n = getcwd(&buf);
			write(S("CWD: "));
			write(buf, n - 1);
			write(S("\n"));
		} else if (strncmp(buf, S("help")) == 0) {
			write(S("Help function commencing.\n"
				"Available Functions:\n"
				"    cd    Under developed\n"
				"    pwd   Functional\n"
				"    ls    Not implemented\n"
				"    help  Under developed\n"
				"    exit  Functional\n"
				"    *     Error\n"));
		} else if (strncmp(buf, S("exit")) == 0) {
			write(S("Exit function commencing.\n"));
			break;
		} else {
			write(S("Error: Unrecognised input `"));
			write(buf, n - 1);
			write(S("`\n"));
		}
	}
	
	write(S("Program terminating.\n"));
	exit(0);
}
