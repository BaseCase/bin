/*
 * hr - super stupid horizontal rule for the terminal
 *
 * note: does not support emoji/unicode at this time
 *
 * to compile: `clang -ltermcap c/hr.c -o bin/hr`
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <termcap.h>


static char termbuf[2048];
static char strbuf[1024];


int main(int argc, char** argv)
{
    int screen_width, line_string_len, i, repetitions, remaining;
    char *termtype, *line_string;

    if (argc == 2) {
        line_string = argv[1];
    } else {
        line_string = "-";
    }

    termtype = getenv("TERM");
    tgetent(termbuf, termtype);
    screen_width = tgetnum("co");

    line_string_len = strlen(line_string);
    repetitions = screen_width / line_string_len;
    remaining = screen_width % line_string_len;

    for (i = 0; i < repetitions; i++) {
        strncat(strbuf, line_string, line_string_len);
    }

    if (remaining) strncat(strbuf, line_string, remaining);

    printf("\n%s\n", strbuf);
}
