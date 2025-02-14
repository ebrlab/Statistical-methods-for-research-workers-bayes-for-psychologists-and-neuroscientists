data {
    int<lower = 0> N;  // Number of data points
    int<lower = 0> K;  // Number of correlates
    int n_rho;         // Number of correlations in the upper triangle of the correlation matrix
    array[N] vector[K] y;  // Data matrix (vectorized form)

    // Known parameter values
    vector[K] mu;    // Means of the data
    vector[K] sigma; // Standard deviations
}

parameters {
    // Cholesky factor of the correlation matrix
    cholesky_factor_corr[K] L;
}
transformed parameters {
    matrix[K, K] Sigma = L * diag_pre_multiply(sigma, L');
}
model {
    // Prior for the Cholesky factor of the correlation matrix
    L ~ lkj_corr_cholesky(1);

    // Likelihood: Multivariate normal with Cholesky factor
    y ~ multi_normal(mu, Sigma);
}

generated quantities {
    int idx = 1;
    array[N] vector[K] yrep;  // Posterior predictive samples
    matrix[K, K] Cor = multiply_lower_tri_self_transpose(L); // Correlation matrix

    // Vector to store the upper triangular correlations
    vector<lower=-1, upper=1>[n_rho] rho;

    // Generate posterior predictive samples
    for (n in 1:N) {
        yrep[n] = multi_normal_rng(mu, Sigma);
    }

    // Extract the upper triangle of the correlation matrix into the vector rho
    for (i in 1:(K - 1)) {
        for (j in (i + 1):K) {
            rho[idx] = Cor[i, j];
            idx = idx + 1;
        }
    }
}