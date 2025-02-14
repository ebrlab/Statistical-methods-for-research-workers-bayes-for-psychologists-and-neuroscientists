data {
    int<lower = 0> N;  // Number of data points
    int<lower = 0> K;  // Number of correlates
    array[N] vector[K] y;  // vectorized form of matrix

    // Assumed known parameter values
    vector[K] mu;
    vector[K] sigma;
}

parameters {
    // Cholesky factor of the correlation matrix
    cholesky_factor_corr[K] L; 
}

transformed parameters {
    // Covariance matrix (Sigma) is formed as L * diag(sigma) * L'
    matrix[K, K] Sigma;
    Sigma = (L * diag_pre_multiply(sigma, L'));
}

model {
    // Uniform prior for correlation parameters
    L ~ lkj_corr_cholesky(1);

    // Likelihood
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