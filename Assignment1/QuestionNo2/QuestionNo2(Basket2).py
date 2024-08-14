# Que: Write a simple Matrix Multiplication program for a given NxN matrix in any two of your preferred Languages from the following listed buckets, where N is iterated through the set of values 64, 128, 256, 512 and 1024. N can either be hardcoded or specified as input. Consider two cases (a) Elements of matrix are of data type Integer and (b) Double In each case, (i.e. Bucket 1 for (a) and (b) + Bucket 2 for (a) and( b)) 

import numpy as np
import time

# a. Matrix Multiplication with Integers
# N = int(input("Enter value of N (through the set of values 64, 128, 256, 512 and 1024): "))
# randomInt = int(input("Enter the maximum value for the matrix elements: "))
N = 64
randomInt = 10

def matrix_multiply_int(matxA, matxB):
    return np.dot(matxA, matxB)

matxA = np.random.randint(randomInt, size=(N, N))
matxB = np.random.randint(randomInt, size=(N, N))

start = time.time()
out = matrix_multiply_int(matxA, matxB)
end = time.time()

time_taken = start - end

# print(f"Matrix multiplication of {matxA} and {matxB} is {out}")
print(f"Matrix multiplication with Integers is: {time_taken} seconds.")



# b. Matrix Multiplication with Double
# N = int(input("Enter value of N (through the set of values 64, 128, 256, 512 and 1024): "))
# rondomInt = int(input("Enter the maximum value for the matrix elements: "))

def matrix_multiply_int(matxA, matxB):
    return np.dot(matxA, matxB)

matxA = np.random.rand(N, N) * rondomInt
matxB = np.random.rand(N, N) * rondomInt

start = time.time()
out = matrix_multiply_int(matxA, matxB)
end = time.time()

time_taken = start - end

# print(f"Matrix multiplication of {matxA} and {matxB} is {out}")
print(f"Matrix multiplication with Double is: {time_taken} seconds.")
