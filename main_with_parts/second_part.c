#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <string.h>

void readStr(char *ptrStr) { fgets(ptrStr, 1024 * 1024, stdin); };

void readStrFile(char *ptrStr, FILE *s) { fgets(ptrStr, 1024 * 1024, s); };

char findMinMax(char *ptrStr, char *charMin) {
  char charMax = 0;
  unsigned int sizeStr = strlen(ptrStr);
  if (sizeStr == 1) {
    charMax = ptrStr[0];
    *charMin = charMax;
  } else {
    for (unsigned int i = 0; i < sizeStr-1; i++) {
      if (ptrStr[i] > charMax) {
        charMax = ptrStr[i];
      }

      if (ptrStr[i] < *charMin) {
        *charMin = ptrStr[i];
      }
    }
  }
  return charMax;
}

void generateStr(char *ptrStr, int size_array) {
  srand(time(NULL));
  for (unsigned int i = 0; i < size_array - 1; i++) {
      ptrStr[i] = 32 + rand()%(127 - 32 + 1);
  }
  ptrStr[size_array - 1] = '\n';
  ptrStr[size_array] = '\0';
};

void writeStr(char charMax, char charMin) {
  printf("A symbol with a huge numerical value %c (value - %d)\n", charMax,
         charMax);
  printf("A symbol with a small numerical value %c (value - %d)\n", charMin,
         charMin);
}

void writeStrFile(char charMax, char charMin, FILE *s) {
  fprintf(s, "A symbol with a huge numerical value %c (value - %d)\n", charMax,
          charMax);
  fprintf(s, "A symbol with a small numerical value %c (value - %d)\n", charMin,
          charMin);
}