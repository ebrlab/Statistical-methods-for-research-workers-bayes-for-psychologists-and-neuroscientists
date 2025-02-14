data{

    int<lower = 0> N; // Number of data points
    int<lower = 0> K; // Number of correlates
    array[N] vector[K] y; // vectorised form of matrix
}

parameters{

    // Assumed know parameter values
    vector[K] mu;
    vector[K] sigma;
    // Correlation matrix
    corr_matrix[K] rho;
}
transformed parameters {
    // Covariance matrix
    matrix[K,K] Sigma;
    Sigma = quad_form_diag(rho,sigma);

}
model{
    // Uniform prior for correlation parameters
    mu ~ normal(0,1);
    sigma ~ normal(0,1);
    rho ~ lkj_corr(1);

    //Likelihood
    y ~ multi_normal(mu, Sigma);
} 
generated quantities {
    int idx = 1;
    array[N] vector[K] yrep;  // Posterior predictive samples
    matrix[K, K] Cor = multiply_lower_tri_self_transpose(L);
    
    // Create a vector to store the upper triangular correlations
    vector<lower=-1, upper=1>[K * (K - 1) / 2] rho;
    
    // Generate posterior predictive samples
    for (n in 1:N) {
        yrep[n] = multi_normal_rng(mu, Sigma);  // Each row is a sample of size K
    }

    // Extract the upper triangle of the correlation matrix
    for (i in 1:(K - 1)) {
        for (j in (i + 1):K) {
            rho[idx] = Cor[i, j];
            idx = idx + 1;
        }
    }
}