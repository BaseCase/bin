/*
 * hr - stupid little horizontal rule thing for a bash terminal
 *
 *
 * COMPILE: `clang -ltermcap hr.c -o hr`
 *           then dump the binary somewhere on your PATH
 *
 *
 * RUN: `hr`        // fills the width of your terminal with '-'
 *      `hr hello`  // repeats "hello" until width of terminal is filled
 *
 * NOTE: This works with normal utf-8 characters, and is untested with anything else.
 *       Macs do this weird double-wide emoji thing sometimes that I haven't yet
 *       figured out how to deal with. So certain emoji will confuse this code.
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <termcap.h>


int get_screen_width();
void build_horizontal_rule(char* output_string, char* line_string, int screen_width);
int is_interior_multibyte(char c);


int main(int argc, char** argv)
{
    int screen_width;
    char *line_string;
    char output_string[1024];

    if (argc == 2) {
        line_string = argv[1];
    } else {
        line_string = "-";
    }

    screen_width = get_screen_width();
    build_horizontal_rule(output_string, line_string, screen_width);

    printf("\n%s\n", output_string);
}


int get_screen_width()
{
    char* termtype;
    char termbuf[2048];

    termtype = getenv("TERM");
    tgetent(termbuf, termtype);
    return tgetnum("co");
}


void build_horizontal_rule(char* output_string, char* line_string, int screen_width)
{
    int i, j, cur_col;
    char c;

    i = j = cur_col = 0;
    while(cur_col < screen_width) {
        c = line_string[i++];

        if (!c) {
            i = 0;
            continue;
        }

        output_string[j++] = c;

        if (!is_interior_multibyte(c))
            ++cur_col;
    }

    // flush the rest of a multibyte char if we've already started one
    c = line_string[i];
    while (is_interior_multibyte(c)) {
        output_string[j++] = c;
        c = line_string[++i];
    }

    output_string[j] = '\0';
}


int is_interior_multibyte(char c)
{
    // If the byte's leftmost bits are '10', we're inside a multibyte glyph.
    // Note that Apple has some funky emoji that disobey this rule.
    // I am probably too lazy to figure out how to deal with that.
    return ((1<<7) & c) && !((1<<6) & c);
}

