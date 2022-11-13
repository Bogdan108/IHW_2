#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

void readStr(char *ptrStr);
void readStrFile(char *ptrStr, FILE *s);
char findMinMax(char *ptrStr, char *charMin);
void generateStr(char *ptrStr, int size_array);
void writeStr(char charMax, char charMin);
void writeStrFile(char charMax, char charMin, FILE *s);

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