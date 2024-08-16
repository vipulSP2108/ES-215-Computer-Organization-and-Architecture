# Que: Write a simple Matrix Multiplication program for a given NxN matrix in any two of your preferred Languages from the following listed buckets, where N is iterated through the set of values 64, 128, 256, 512 and 1024. N can either be hardcoded or specified as input. Consider two cases (a) Elements of matrix are of data type Integer and (b) Double In each case, (i.e. Bucket 1 for (a) and (b) + Bucket 2 for (a) and( b)) 

# a. Report the output of the ‘time’ describing the system and CPU times. 
import numpy as np
import time

N_val = [64, 128, 256, 512, 1024]
# N = int(input("Enter value of N (through the set of values 64, 128, 256, 512 and 1024): "))

def matx_multi(A, B, N):
    multi = np.zeros((N, N), dtype=A.dtype)
    for i in range(N):
        for j in range(N):
            for k in range(N):
                multi[i][j] += A[i][k] * B[k][j]
    return multi

for N in N_val:
# a. Matrix Multiplication with Integers
# randomInt = int(input("Enter the maximum value for the matrix elements: "))
    A = np.random.randint(100, size=(N, N))
    B = np.random.randint(100, size=(N, N))

    start_time = time.time()
    multi = matx_multi(A, B, N)
    end_time = time.time()

    int_time_taken = end_time - start_time
    print(f"Matrix multiplication with Integers for N={N} took: {int_time_taken} seconds.")

# b. Matrix Multiplication with Double
# rondomInt = int(input("Enter the maximum value for the matrix elements: "))
    A = np.random.rand(N, N) * 100
    B = np.random.rand(N, N) * 100

    start_time = time.time()
    multi = matx_multi(A, B, N)
    end_time = time.time()

    double_time_taken = end_time - start_time
    print(f"Matrix multiplication with Doubles for N={N} took: {double_time_taken} seconds.")




# b. Using the ‘language hooks’ evaluate the execution time for the meat portions of the program and how much proportion is it w.r.t. total program execution time.
import numpy as np
import time

N_val = [64, 128, 256, 512, 1024]
# N = int(input("Enter value of N (through the set of values 64, 128, 256, 512 and 1024): "))

def matx_multi(A, B, N):
    multi = np.zeros((N, N), dtype=A.dtype)
    for i in range(N):
        for j in range(N):
            for k in range(N):
                multi[i][j] += A[i][k] * B[k][j]
    return multi

print("### Integer Matrix Multiplication ###")
for N in N_val:
    print(f"Matrix size N={N} (Integer elements):")
    # a. Matrix Multiplication with Integers
    # randomInt = int(input("Enter the maximum value for the matrix elements: "))
    total_start = time.perf_counter()

    A = np.random.randint(100, size=(N, N))
    B = np.random.randint(100, size=(N, N))

    meat_start = time.perf_counter()
    multi = matx_multi(A, B, N)
    meat_end = time.perf_counter()

    meat_time = meat_end - meat_start
    total_end = time.perf_counter()
    
    total_time = total_end - total_start

    print(f"  Total time: {total_time} seconds")
    print(f"  Meat portion time (matrix multiplication): {meat_time} seconds")
    print(f"  Proportion of meat portion time: {meat_time / total_time * 100}%\n")



print("### Double Matrix Multiplication ###")
for N in N_val:
    print(f"Matrix size N={N} (Double elements):")
    # b. Matrix Multiplication with Double
    # rondomInt = int(input("Enter the maximum value for the matrix elements: "))

    total_start = time.perf_counter()
    A = np.random.rand(N, N) * 100
    B = np.random.rand(N, N) * 100

    meat_start = time.perf_counter()
    multi = matx_multi(A, B, N)
    meat_end = time.perf_counter()

    meat_time = meat_end - meat_start
    total_end = time.perf_counter()
    
    total_time = total_end - total_start

    print(f"  Total time: {total_time} seconds")
    print(f"  Meat portion time (matrix multiplication): {meat_time} seconds")
    print(f"  Proportion of meat portion time: {meat_time / total_time * 100}%\n")

    start_time = time.time()
    multi = matx_multi(A, B, N)
    end_time = time.time()

    double_time_taken = end_time - start_time
    print(f"Matrix multiplication with Doubles for N={N} took: {double_time_taken} seconds.")
