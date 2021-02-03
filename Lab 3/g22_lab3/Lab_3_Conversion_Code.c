#include <stdio.h>
#include <stdlib.h>
#include <math.h>

char *decimal_to_binary(int);

int main(){
	FILE *file= fopen("lab3-In.txt", "r");

	int N = 1000;
	float values[N];
	int i;

	// store each float from the file into the values array 
	for (i = 0; i < N; i++){
		fscanf(file, "%f", &values[i]);
	}

	fclose(file);

	// multiply each value by 128 
	for (i = 0; i < N; i++){
		values[i]= values[i] * 128;
	}

	// open the files for fixed points values
	FILE *file_fixed_point = fopen("lab3-In-converted","w");

	int n;
	char *fixed_point;


	for(i = 0; i < N; i++){
		n = (int) values[i];

		// convert each value to binary: 
		fixed_point = decimal_to_binary(n);

		// write each value in the new file, one value per line
		fprintf(file_fixed_point, "%s\n", fixed_point);
	}

	free(fixed_point);
	fclose(file_fixed_point);
}


char *decimal_to_binary(int n){
	int c, d, i, invert_spot;
	char *pointer;
	int negative_num = 0; // boolean false
	int count = 0;

	pointer = (char *)malloc(10+1);
	int binary_digits[10];

	if (pointer == NULL){
		exit(EXIT_FAILURE);
	}

	if (n < 0) { // if number is negative, make it positive
		n = n * (-1);
		negative_num = 1; // true
	}

	for (c = 9; c>= 0; c--){
		d=n>>c;
		if(d & 1){
			binary_digits[count]=1;
		}
		else{
			binary_digits[count]=0;
		}
		count++;
	}

	if(!negative_num){ // if positive number:
		for(i = 0; i < 10; i++){
			if(binary_digits[i] == 0){
				*(pointer+i) = 0 + '0';
			}
			else{
				*(pointer+i) = 1 + '0';

			}
		}
	}
	else { // if negative number:
		for(i = 9; i>= 0; i--){
			if(binary_digits[i] == 1){
				invert_spot = i;
				break;
			}
		}

		for(i = 0; i < 10; i++){
			if(i < invert_spot){
				if(binary_digits[i] == 0){
					*(pointer+i) = 1 + '0';
				}
				else{
					*(pointer+i) = 0 + '0';
				}

			}
			else {
				if(binary_digits[i] == 0){
					*(pointer+i) = 0 + '0';
				}
				else{
					*(pointer+i) = 1 + '0';
				}

			}
		}
	}

	*(pointer + count) = '\0';
	return pointer;
}




















