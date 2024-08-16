#I was facing issue in writing c code so I have take a lock of ref here

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void matx_multi(int **A, int **B, int **multi, int N) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            multi[i][j] = 0;
            for (int k = 0; k < N; k++) {
                multi[i][j] += A[i][k] * B[k][j];
            }
        }
    }
}

void matx_multi_double(double **A, double **B, double **multi, int N) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            multi[i][j] = 0.0;
            for (int k = 0; k < N; k++) {
                multi[i][j] += A[i][k] * B[k][j];
            }
        }
    }
}

int** create_matrix(int N, int max_value) {
    int **matrix = (int **)malloc(N * sizeof(int *));
    for (int i = 0; i < N; i++) {
        matrix[i] = (int *)malloc(N * sizeof(int));
        for (int j = 0; j < N; j++) {
            matrix[i][j] = rand() % max_value;
        }
    }
    return matrix;
}

double** create_matrix_double(int N, double max_value) {
    double **matrix = (double **)malloc(N * sizeof(double *));
    for (int i = 0; i < N; i++) {
        matrix[i] = (double *)malloc(N * sizeof(double));
        for (int j = 0; j < N; j++) {
            matrix[i][j] = ((double)rand() / RAND_MAX) * max_value;
        }
    }
    return matrix;
}

void free_matrix(int **matrix, int N) {
    for (int i = 0; i < N; i++) {
        free(matrix[i]);
    }
    free(matrix);
}

void free_matrix_double(double **matrix, int N) {
    for (int i = 0; i < N; i++) {
        free(matrix[i]);
    }
    free(matrix);
}

int main() {
    int N_val[] = {64, 128, 256, 512, 1024};
    int num_sizes = sizeof(N_val) / sizeof(N_val[0]);
    srand(time(NULL));

    printf("### Integer Matrix Multiplication ###\n");
    for (int idx = 0; idx < num_sizes; idx++) {
        int N = N_val[idx];
        printf("Matrix size N=%d (Integer elements):\n", N);

        int **A = create_matrix(N, 100);
        int **B = create_matrix(N, 100);
        int **multi = (int **)malloc(N * sizeof(int *));
        for (int i = 0; i < N; i++) {
            multi[i] = (int *)malloc(N * sizeof(int));
        }

        clock_t total_start = clock();

        clock_t meat_start = clock();
        matx_multi(A, B, multi, N);
        clock_t meat_end = clock();

        clock_t total_end = clock();
        double total_time = (double)(total_end - total_start) / CLOCKS_PER_SEC;
        double meat_time = (double)(meat_end - meat_start) / CLOCKS_PER_SEC;

        printf("  Total time: %f seconds\n", total_time);
        printf("  Meat portion time (matrix multiplication): %f seconds\n", meat_time);
        printf("  Proportion of meat portion time: %f%%\n\n", (meat_time / total_time) * 100);

        free_matrix(A, N);
        free_matrix(B, N);
        free_matrix(multi, N);
    }

    printf("### Double Matrix Multiplication ###\n");
    for (int idx = 0; idx < num_sizes; idx++) {
        int N = N_val[idx];
        printf("Matrix size N=%d (Double elements):\n", N);

        double **A = create_matrix_double(N, 100.0);
        double **B = create_matrix_double(N, 100.0);
        double **multi = (double **)malloc(N * sizeof(double *));
        for (int i = 0; i < N; i++) {
            multi[i] = (double *)malloc(N * sizeof(double));
        }

        clock_t total_start = clock();

        clock_t meat_start = clock();
        matx_multi_double(A, B, multi, N);
        clock_t meat_end = clock();

        clock_t total_end = clock();
        double total_time = (double)(total_end - total_start) / CLOCKS_PER_SEC;
        double meat_time = (double)(meat_end - meat_start) / CLOCKS_PER_SEC;

        printf("  Total time: %f seconds\n", total_time);
        printf("  Meat portion time (matrix multiplication): %f seconds\n", meat_time);
        printf("  Proportion of meat portion time: %f%%\n\n", (meat_time / total_time) * 100);

        free_matrix_double(A, N);
        free_matrix_double(B, N);
        free_matrix_double(multi, N);
    }

    return 0;
}
