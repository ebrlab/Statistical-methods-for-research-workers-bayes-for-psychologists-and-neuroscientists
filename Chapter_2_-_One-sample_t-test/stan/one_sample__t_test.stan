data{

int<lower = 1> N;
vector[N] y;

}

parameters{

// Model paramaters to be estimated

 real<lower=0, upper=1> mu;// Bounded between 0 and 1 because as proportion of gaze scores cannot exceed those bounds
 real<lower=0> sigma; //Standard deviation bounded at 0
 
}

model{

//priors
// Informed prior based on the use of a normal likelihood to estimate mean and standard deviation parameters
// of proportion score that ranges from 0 to 1

mu ~ normal(0.5, 0.2);
sigma ~ exponential(0.1);

// Likliehood
y ~ normal(mu, sigma);

}

generated quantities {

//Generated a real value for difference between the MCMC sample of mu and 0.5.
real diff = mu - 0.5;

// Generating a quantity of a effect size similar to cohen D of a standarised diffence comparing
// a reference mean (here is proportion of 0.5) as would be specified in a one sample t-test
real Cohen_D = diff / sigma; 
  
vector[N] yrep;
  
// Generate data for posterior samples
  for (i in 1:N) {
    yrep[i] = normal_rng(mu, sigma);
 }
}