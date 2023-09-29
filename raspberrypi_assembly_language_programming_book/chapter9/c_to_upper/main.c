#include <stdio.h>
#include <string.h>
#include <stdlib.h>

extern int to_upper(char *str_in, char *str_out);

int main(int argc, char **argv)
{
  if (argc != 2) {
    printf("Usage: %s <str>\n", *argv);
    return 1;
  }
  char *str_in = argv[1];
  int len = strlen(str_in);
  char *buffer = (char *) malloc(len + 1);
  len = to_upper(str_in, buffer);
  printf("Input: %s\n", str_in);
  printf("Upper case: %s\n", buffer);
  printf("Length of the string: %d\n", len);
  return 0;
}
