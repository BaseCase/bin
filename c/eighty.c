#include <stdio.h>

int main(int argc, char** argv)
{
    int i;
    char buffer[82];
    buffer[0] = '\n';

    for (i = 1; i < 81; ++i)
        buffer[i] = '*';

    buffer[i] = '\n';
    buffer[i+1] = 0;

    printf("%s", buffer);
}
