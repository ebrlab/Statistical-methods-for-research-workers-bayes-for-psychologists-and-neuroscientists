//
data{

// Number of IQ data points for the two groups which are the same.
int<lower=1> N;

// Vector of dependent variable (IQ) values defined for the two groups
vector[N] y_1; 
vector[N] y_2;

real<lower = 0> sigma;
}

parameters{

// Because in the traditional Z-test we assume we know the standard deviation of the data generating process
// we do not estimate it and the only unknown to be modelled is the mu parameter in the normal likelihood
// specified below in the model block.
real mu_1;
real mu_2;

}

model{

//Priors
mu_1 ~ normal(100, 20);
mu_2 ~ normal(100, 20);

//Likelihood
y_1 ~ normal(mu_1, sigma);
y_2 ~ normal(mu_2, sigma);

}

generated quantities{

// Unstandardised difference between the MCMC samples of the two posteriors
// for the two groups modelled above
real diff = mu_1 - mu_2;


// Calculating a standardised Cohen D measure between the two groups
real  Cohen_D = (mu_1 - mu_2) / sigma;


//Posterior predictive check code
array[N] real y1rep;
array[N] real y2rep;
  
  {
  // Generate simulated data from posterior samples
  for (i in 1:N) {
    y1rep[i] = normal_rng(mu_1, sigma);
  }
}
 {
  // Generate simulated data for posterior samples
  for (i in 1:N) {
    y2rep[i] = normal_rng(mu_2, sigma);
  } 
 }
}
