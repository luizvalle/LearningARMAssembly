#include <stdio.h>

char *str_in = "My name is Luiz, this is a test sTring.\n";
char str_out[255];

int main()
{
    char *r1 = str_in, *r2 = str_out;
    char c;
    do {
        c = *r1++;
        if (c >= 'a' && c <= 'z') {
            c += 'A' - 'a';
        }
        *r2++ = c;
    } while (c);

    write(1, str_out, r2 - str_out);

    return 0;
}
