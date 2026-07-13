Here are the calculations and the requested R program to solve the problem based on the Poisson distribution.

As requested, I have translated the context and provided the explanations in formal English.

---

## Theoretical Overview and Calculations

The Poisson probability mass function is defined as:

$$P(X = k) = \frac{e^{-\lambda} \lambda^k}{k!}$$

Where $\lambda = 10$ represents the average number of patients per day, and $k$ is the specific number of patients we want to calculate the probability for.

### a) Probability of exactly 3 patients arriving in a day

$$P(X = 3) = \frac{e^{-10} \cdot 10^3}{3!} \approx 0.007567$$


*There is approximately a **0.76%** chance that exactly 3 patients will arrive.*

### b) Probability of exactly 15 patients arriving in a day

$$P(X = 15) = \frac{e^{-10} \cdot 10^{15}}{15!} \approx 0.034718$$


*There is approximately a **3.47%** chance that exactly 15 patients will arrive.*

### c) Probability of exactly 4 patients arriving in a day

$$P(X = 4) = \frac{e^{-10} \cdot 10^4}{4!} \approx 0.018917$$


*There is approximately a **1.89%** chance that exactly 4 patients will arrive.*

---

## R Program Implementation

> **Important Note on "Residuals vs Fitted" plots:** Residuals vs. Fitted plots are standard diagnostic tools for **linear regression models** to check for homoscedasticity and linearity. They do not naturally apply to isolated probability mass function (PMF) calculations like the ones requested.
> However, to strictly comply with your request, the code below fits a dummy generalized linear model (GLM) for each scenario so that a `Residuals vs Fitted` plot can be generated alongside the calculation.

```R
# Define the average rate (lambda)
lambda <- 10

# -------------------------------------------------------------------------
# Calculations using built-in Poisson function (dpois)
# -------------------------------------------------------------------------
prob_a <- dpois(3, lambda)
prob_b <- dpois(15, lambda)
prob_c <- dpois(4, lambda)

# Display results in the console
cat("Results:\n")
cat(sprintf("a) Probability of 3 patients:  %.6f (%.2f%%)\n", prob_a, prob_a * 100))
cat(sprintf("b) Probability of 15 patients: %.6f (%.2f%%)\n", prob_b, prob_b * 100))
cat(sprintf("c) Probability of 4 patients:  %.6f (%.2f%%)\n\n", prob_c, prob_c * 100))

# -------------------------------------------------------------------------
# Generating Residuals vs Fitted plots via GLM
# -------------------------------------------------------------------------

# Configure the plotting area to display 3 graphs side-by-side
par(mfrow = c(1, 3))

# Scenario A: 3 Patients
# Simulating a small counts dataset where the observed value is 3
df_a <- data.frame(y = c(3), x = c(1))
model_a <- glm(y ~ x, family = poisson(link = "log"), data = df_a)
plot(model_a, which = 1, main = "Residuals vs Fitted (k = 3)")

# Scenario B: 15 Patients
df_b <- data.frame(y = c(15), x = c(1))
model_b <- glm(y ~ x, family = poisson(link = "log"), data = df_b)
plot(model_b, which = 1, main = "Residuals vs Fitted (k = 15)")

# Scenario C: 4 Patients
df_c <- data.frame(y = c(4), x = c(1))
model_c <- glm(y ~ x, family = poisson(link = "log"), data = df_c)
plot(model_c, which = 1, main = "Residuals vs Fitted (k = 4)")

# Reset plotting parameters to default
par(mfrow = c(1, 1))

```

### Explanation of the R Code:

* `dpois(k, lambda)`: This is the native R function used to calculate the exact probability for a Poisson distribution.
* `glm(..., family = poisson)`: This function estimates a Poisson regression. Since we only have single data points for each case, the residuals will technically compute to zero (or close to it due to perfect fitting), but it successfully generates the requested diagnostic structure.