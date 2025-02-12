// Stan model to repliciate a bayesain estiamtion equivalent of the classical one sample z-test.

data{
// Number of IQ data points
int<lower=1> N;

// Define a vector of dependent variable (IQ scores) values
vector[N] y;
real<lower = 0> sigma;

}

parameters{
// Because in the traditional Z-test we assume we know the standard deviation of the DGP
// we do not estimate it and the only unknown is the mu (mean) parameter in the normal 
// model specified below.
real mu;
}

model{
// The priors
mu ~ normal(100, 20);

// The likelihood
  y ~ normal(mu, sigma);
}

generated quantities{

// Generated a real value for difference between the MCMC samples of mu and 100.
real diff = mu - 100;

// Cohen D calculation of the MCMC samples to get the standardised effect size
// for the diffence between the mean estimates and 100.
real Cohen_D = (mu - 100) / sigma;

// Generate posterior p-value variable 
int<lower = 0, upper = 1> mean_pv;
array[N] real yrep;
{
  // Generate data for posterior samples
  for (i in 1:N) {
    yrep[i] = normal_rng(mu, sigma);  
   }
}

mean_pv = mean(yrep) > mean(y);
}