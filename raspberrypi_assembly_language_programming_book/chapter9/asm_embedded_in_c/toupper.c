#include <stdio.h>

#define MAX_BUFFER_SIZE 255

int main(int argc, char **argv)
{
  if (argc != 2) {
    printf("Usage: %s <str>\n", *argv);
    return -1;
  }

  char *str = argv[1];
  char buffer[MAX_BUFFER_SIZE];
  int len;

  asm (
    "mov r4, %2\n" // Copy the buffer pointer
    "loop:\n"
    "ldrb r5, [%0], #1\n" // Load the next char and increment
    "cmp r5, #'a'\n"
    "blt not_lowercase\n"
    "cmp r5, #'z'\n"
    "bgt not_lowercase\n"
    "add r5, #('A' - 'a')\n"
    "not_lowercase:\n"
    "strb r5, [r4], #1\n"
    "cmp r5, #0\n"
    "bne loop\n"
    "sub %0, r4, %2\n" // Return the number of bytes processed
    "sub %0, #1\n"
    : "=r" (len)
    : "r" (str), "r" (buffer)
    : "r4", "r5"
    );

  printf("%s\n", buffer);

  return len;
}
