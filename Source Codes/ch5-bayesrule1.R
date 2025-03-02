# https://stackoverflow.com/questions/68849489/conditional-probability-in-r

set.seed(1) # This makes the sample reproducible

sample_size <- 1000000 # This can be changed to get a larger or smaller sample

# Create a large sample of 1 million "people", using a 1 to denote disease and
# a 0 to denote no disease, with probabilities of 0.0005 (which is 0.05%) and
# 0.9995 (which is 99.95%) respectively.
disease <- sample(x = c(0, 1), 
                  size = sample_size, 
                  replace = TRUE, 
                  prob = c(0.9995, 0.0005))

# Create an empty vector to hold the test results for each person
test <- numeric(sample_size)

# Simulate the test results of people with the disease, using a 1 to denote
# a positive test and 0 to denote a negative test. This uses a probability of
# 0.9 (which is 90%) of having a positive test and 0.1 (which is 10%) of having
# a negative test. We draw as many samples as we have people with the disease
# and put them into the "test" vector at the locations corresponding to the
# people with the disease.
test[disease == 1] <- sample(x = c(0, 1), 
                             size = sum(disease), 
                             replace = TRUE, 
                             prob = c(0.1, 0.9))

# Now we do the same for people without the disease, simulating their test
# results, with a 1% probability of a positive test.
test[disease == 0] <- sample(x = c(0, 1), 
                             size = 1e6 - sum(disease), 
                             replace = TRUE, 
                             prob = c(0.99, 0.01))

# Now we have run our simulation, we can just count the true positives, false positives, true negatives and false negatives 
# by creating a contingency table
contingency_table <- table(disease, test)

contingency_table

# get the approximate probability of having the disease given a positive test 
contingency_table[2, 2] / sum(contingency_table[,2])

# the probability of having the disease given a negative test 
contingency_table[2, 1] / sum(contingency_table[,1])