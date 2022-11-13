#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

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

int main(int argc, char *argv[]) {
  char strMain[1024 * 1024];
  char charMax;
  char charMin = 127;
  int amount = 0;
  int timeInd = 1;
  FILE *input_file;
  FILE *output_file;

  if (argc > 1) {
    if ((strcmp(argv[1], "time") == 0)) {
      timeInd = 2;
    }
    if (timeInd < argc) {
      if ((strcmp(argv[timeInd], "random") == 0)) {
        generateStr(strMain, atoi(argv[timeInd + 1]));
        amount = 1;
      } else {
        if ((strcmp(argv[timeInd], "file") == 0)) {
          input_file = fopen(argv[timeInd + 1], "r");
          if ((input_file == NULL)) {
            printf("Cannot open input file.\n");
            return 1;
          }
          output_file = fopen(argv[timeInd + 2], "w");
          if (output_file == NULL) {
            printf("Cannot open output file.\n");
            fclose(input_file);
            return 1;
          }
          amount = 2;
        } else {
          printf("Not valid command!");
          return 0;
        }
      }
    }
  }

  // считывание строки;
  if (amount) {
    if (amount == 2) {
      readStrFile(strMain, input_file);
      fclose(input_file);
    }
  } else {
    readStr(strMain);
  }

  if (timeInd != 2) {
    charMax = findMinMax(strMain, &charMin);
  } else {
    clock_t start = clock();
    for (int i = 0; i < 1000000; i++) {
      charMax = findMinMax(strMain, &charMin);
    }
    clock_t end = clock();
    double result = (double)(end - start) / (CLOCKS_PER_SEC);
    if (amount == 2) {
      fprintf(output_file, "Work time: %f\n", result);
    } else {
      printf("Work time: %f\n", result);
    }
  }

  if (amount == 2) {
    writeStrFile(charMax, charMin, output_file);
    fclose(output_file);
  } else {
    writeStr(charMax, charMin);
  }
  return 0;
};