import numpy as np
import scipy.stats as stats

# Define the control and test groups
control_group = [15.0, 27.0, 11.0, 16.0]
test_group = [14.666666666666700, 13.0, 50.0, 19.666666666666700]

# Calculate the sample means and standard deviations
control_mean = np.mean(control_group)
control_std = np.std(control_group, ddof=1)
test_mean = np.mean(test_group)
test_std = np.std(test_group, ddof=1)

# Calculate the t-statistic and p-value
t_stat, p_value = stats.ttest_ind(control_group, test_group, equal_var=False)

print("Control Mean: {:.2f}".format(control_mean))
print("Control Std: {:.2f}".format(control_std))
print("Test Mean: {:.2f}".format(test_mean))
print("Test Std: {:.2f}".format(test_std))
print("t-statistic: {:.2f}".format(t_stat))
print("p-value: {:.4f}".format(p_value))