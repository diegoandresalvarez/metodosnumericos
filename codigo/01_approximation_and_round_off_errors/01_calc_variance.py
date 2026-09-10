import numpy as np

# Var(X) = E[X^2] - E[X]^2
def calculate_bad_variance(nums):
    sum_of_squares = 0
    sum_of_nums = 0
    N = len(nums)
    for num in nums:
        sum_of_squares += num**2
        sum_of_nums += num
    mean = sum_of_nums / N
    variance = sum_of_squares/N - mean**2

    print(f"Real variance: {np.var(nums)}")
    print(f"Bad variance:  {variance}")

calculate_bad_variance([2, 7, 3, 12, 9])

calculate_bad_variance(
    np.random.uniform(100_000_000, 100_000_000.06, 100_000)
)
