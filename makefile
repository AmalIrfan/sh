SRCDIR = src
OBJDIR = obj
SRCFILES = $(wildcard ${SRCDIR}/*)
OBJFILES = $(patsubst ${SRCDIR}/%.c,${OBJDIR}/%.o,\
           $(patsubst ${SRCDIR}/%.s,${OBJDIR}/%.o,${SRCFILES}))

CFLAGS=-g -no-pie -nostdlib -nolibc -fno-builtin

main: ${OBJFILES}
	gcc -o $@ $^ ${CFLAGS}

${OBJDIR}/%.o: ${SRCDIR}/%.s
	gcc -c -o $@ $^ ${CFLAGS}

${OBJDIR}/%.o: ${SRCDIR}/%.c
	gcc -c -o $@ $^ ${CFLAGS}

clean:
	rm ${OBJFILES}
