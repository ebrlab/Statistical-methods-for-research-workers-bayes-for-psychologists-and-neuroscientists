## <center>Practicing Bayesian statistics<center>

## Contents
- Introduction
- The two statistical philosophies
    - Frequentist Statistics
    - Bayesian Statistics
- Bayes Theorem
    - prior
    - Likelihood
    - Posterior
- Steps of a Bayesian analysis    
- Effect indices/ hypothesis testing

   - Maximum a posteriori estimates (posterior point estimates )
   - Credible intervals
- Markov Chain Monte Carlo (MCMC)

## Introduction
When Efron and Hastie (2016) identify that “Statistical inference is an unusually wide-ranging discipline, located as it is at the triple-point of mathematics, empirical science, and philosophy” (pp. xv) they make its multidisciplinary nature and complexity clear. This complexity has led to misinterpretation of the standardly taught analysis (frequentist) methods by applied by researchers (Hoekstra, Morey, Rouder, & Wagenmakers, 2014; Lyu, Xu, Zhao, Zuo, & Hu, 2020), seemingly result  primarily due to the “philosophy” section of Efron and Hastie’s quote above. As demonstrated dominant use of frequentist methods, whilst seemingly wanting to interpret the results of their analyses under the Bayesian framework (Etz, Bartlema, Vanpaemel, Wagenmakers, & Morey, 2019). The question then is what is Bayesian statistics?

## The two statistical philosophies
“The numbers have no way of speaking for themselves. We speak for them. We Imbue them with meaning.”

Silver (2012).

“Technical mathematical arguments and formula, though valid and of interest, must always assume, tacitly or explicitly, a philosophy.”

Briggs (2019).

“An important insight that would seem desirable for any statistical philosophy: Conclusions are only as plausible as the subjective foundations on which they are based.”

Western (1999).

As the quotes above point out there is no free lunch when analysing data and conducting statistical inference, but this is often forgotten or ritualised to make it seem as such (Gigerenzeer, 2004).

 Crucially, statistical inference is only possible at all because of the application of probability theory and its interpretation when the data are analysed. However, heated debates about what interpretation of probability to apply have occurred since the inception of statistics and have resulted in what has been termed “The statistics Wars” within the statistical literature (Gigerenzer et al., 1983; Mayo, 2018; Salsburg, 2002).

Despite these worthwhile discussions, it is more important to remember it is the act of applying interpreting probability, that makes statistical inference possible at all; and crucially understand what separates the Frequentist and Bayesian frameworks is their differing interpretations of probability.

 The two interpretations of probability are objective and subjective probability. Lambert (2018), describes it as a difference in world view by the analyst. As a result, by applying either framework, the analyst is making assumptions about how to model the world through these different views of probability.

Frequentist Statistics (objective probability).

The philosophical grounding of the Frequentist statistics framework is objective probability. The meaning of objective probability in terms of data is expressed by the view that any set of observed data is a sample that has been generated from an infinite replication of the experiment from the data generating process. Therefore, any inference that is justifiable within this framework by analyst is that the observed sample is one with a long-run view of repeated sampling; meaning the data is treated as random but the statistical models that are fit to data are an attempt to estimate fixed population parameters.
through the attempts to estimate sampling error and this variation is expressed in varying estimates between experiments or observations and stipulates the necessity for replication and long run error control to understand the phenomena under from a statistical analysis view.

Frequentist statistics dominates research with the use of by Null hypothesis significance testing (NHST). NHST tools for inference are based on repeated on tis sampling paradigm such as the p-value which is the $P(D|H_0)$ and confidence intervals (CI) which are not probability statements but an interval estimate of the parameter estimates generated from the data. As such a CI is again based on repeated sampling. As CI is a such that 95% of the confidence calculated will contain the true population parameter within their estimated intervals.

Bayesian statistics (subjective probability).

Bayesian statistics applies probability as an expression of the analyst’s belief and as an expression of their uncertainty around what they are analysing. This is expressed in the reversal of what the Frequentists do by treating the parameters of the statistical models that they fit as random and the data as fixed. In terms of parameters then a Bayesian does not have to deny the existence of a population parameter but can accept the uncertainty generated by each experiment/acquisition of a sample, that the estimates will vary due sample variation. However, a Bayesian analysis can also specify that differences in parameters is due to our uncertainty based on our  knowledge.

 Under this framework, the use of Bayes theorem and data can be used to update beliefs about phenomena being studied through data analysis. Bayesian statistics allows for inference statements that $P(H_0|D)$, which is of course the opposite of that above from frequentist methods. This type of inference is achieved by the application of Bayes rule.

## Bayes Rule
$$P(A,B) = P(B,A)\: \:\: \: \: \:(1)$$
 $$P(B|A)P(A) = P(A|B)P(B)\: \:\: \: \: \:(2) $$
 $$P(A|B) = \frac{P(B|A)P(A)}{P(B)}\: \:\: \: (3)$$

Hopefully by the outlining Bayes rule above it becomes explicit why we would want to use the statistical practices on which it is based. In case it is not explicit, it is because the posterior allow sus to answer a question in which we are interested in that what is the probability of our hypothesis we are testing base on assumptions of the statistical models of which we use to test the data.

## Steps of a Bayesian analysis
Kruschke (2015) outlines general Bayesian analysis steps which include:

1. Identify data relevant to the research question including the variables of interest.
2. Identify a descriptive model for the data that you are going to analyse. Meaning the mathematical model and the parameter's should be appropriate to the data.
3. Specify priors for the parameter of the model, priors should be reasonable and will have to pass an audience of reviewers.
4. Use Bayes theorem and calculate the posterior.
5. Conduct posterior predictive checks.

## Testing indices/hypothesis testing in the Bayesian framework

 Due to the standard training of researchers to use NHST methods in analysing their data and the ingrained practice of using p-values, which has created an illusionary sense of the ease to understand data analysis and statistical inference with decision-making rules such as standard use of thresholds (i.e. ≤ .05)  and concluding a result or body of work is meaningful or significant in the standard sense of the word when it is only significant in the statistical sense of the word. With this culminating and resulting in publication.

 A result of the standard training in NHST is likely to lead to the first question any researcher curious about Bayesian methods to probably ask, what is its p-value equivalent? A more general and helpful question though would be what are the outputs that are used for making inferences from the data within this framework? Answering that question is likely to result in trepidation by interested parties in applying Bayesian tools in analyzing data, due to the flexibility of the framework and the variety of the analysts’ options. This can either be seen as complicating or liberating.

 To simplify Bayesian methods of inference is to separate out Bayes factor analysis and Bayesian estimation. There is plenty of discussion in the literature of the advantages and disadvantages of each method (Dienes, 2020; Makowski, Ben-Shachar, Chen, & Lüdecke, 2019), with no general consensus.
  The notebooks here focus on Bayesian estimation. For clarity, this is not to suggest a preference because when it comes to statistical tools more options are an advantage but to go over those methods is a project on its own.
 Bayesian estimation test indices
 Point estimates (Mean, median)/Maximum a posteriori estimation (MAP - the mode)
 Posterior mean - minimises the expected square error
 Posterior median - minimises expected absolute error
 MAP - most probable value on the posterior distribution.

 Expression of the uncertainty in parameter estimates.
 Credible intervals Krushcke (2015) (plausibility intervals, McElreath, 2020; uncertainty intervals, Gelman et al., 2013).

 95% credible interval - Krushcke (2015) 10000 effective samples  for stable estimates

 50% credible interval - (Gelman, 2016) suggest using the 50% credibility interval, which gives the quantile interval between 25% and 75% of the posterior distribution.
 Gelman argues usin this interval: Increases the computational stability, gives the credibility interpretation that true value contained in this 50% interval and finally this interval helps avoid certainty.

 ROPE (95%)

 ROPE (Full)

 Hopefully, the different recommendations of the interval size to use when summarising the posterior makes the reader think this is arbitrary like a p-value threshold of .05 because it is and it is down to the analysis to decide and make the argument for their choice. If that choice is due to expert suggestions or for general research practices.

## Markov chain Monte Carlo (MCMC)
In laymen terms MCMC are mathematical tools/algorithms for sampling form posterior distributions. MCMC underlies all modern  applications of Bayesian statistics. this is because many of the statically models to answer complex question in which statisticians and researchers are concerned do not have analytical solutions for calculating the posterior. To overcome this numerical methods such as MCMC must be applied.

## Why Stan?


### <center>References<center>

Betancourt, M. (2017). A conceptual introduction to Hamiltonian Monte Carlo. arXiv preprint	 	arXiv:1701.02434.

Briggs, W. M., 2019. Everything Wrong with P-Values Under One Roof. In Beyond Traditional Probabilistic Methods in Economics,  Kreinovich, V., Thach,  N. N., Trung, N. D., Thanh, D. V. (eds.), pp 22–44. DOI 978-3-030-04200-4_2

Briggs, W. M. (2012). It is time to stop teaching frequentism to non-statisticians. arXiv preprint		 arXiv:1201.2590.

Bürkner, P. C. (2017). brms: An R package for Bayesian multilevel models using Stan. Journal		 of statistical software, 80(1), 1-28.

Carpenter, B., Gelman, A., Hoffman, M. D., Lee, D., Goodrich, B., Betancourt, M., ... & Riddell,		 A. (2017). Stan: A probabilistic programming language. Journal of statistical software,		 76(1).

Dienes, Z. (2020). How to use and report Bayesian hypothesis tests.

Efron, B., & Hastie. (2016). Computer age Statistical Inference: Algorithms, evidence, and data science. New York, NY: Cambridge University Press.

Etz, A., Bartlema, A., Vanpaemel, W., Wagenmakers, E. J., & Morey, R. D. (2019). An exploratory survey of student and researcher intuitions about statistical evidence. In		 Poster presented at the annual meeting of the Association for Psychological Science, Washington, DC.

Gabry, J., & Goodrich, B. (2016). rstanarm: Bayesian applied regression modeling via stan	[computer software manual]. Retrieved from http://CRAN.R‐project.org/				 package=rstanarm (R package version 2.9.0‐1)

Gelman, A. (2016, November 5) Why I prefer 50% rather than 95% intervals [blog post]. Retrieved from https://statmodeling.stat.columbia.edu/2016/11/05/why-i-prefer-50-to-95-intervals/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+MyDataScienceBlogs+%28My+Data+Science+Blogs%29

Gigerenzer, G., Swijtink, Z., Porter, T., Daston, L., Beatty, J., Kruger, L. (1989). The empire       	  	of chance: How probability changed science and everyday life. New York, NY:	Cambridge University Press.

Hoekstra, R., Morey, R. D., Rouder, J. N., & Wagenmakers, E. J. (2014). Robust misinterpretation of confidence intervals. Psychonomic bulletin & review, 21(5), 1157-1164.

Krushcke, J. K. (2015). Doing Bayesian analysis: A tutorial with R, JAGS and Stan. London, England: Academic Press.

Lambert, B. (2018). A student guide to Bayesian statistics. London, England: SAGE.

Lynch, S. M., & Bartlett, B. (2019). Bayesian Statistics in Sociology: Past, Present, and Future.Annual Review of Sociology, 45, 47-68.

Lyu, X. K., Xu, Y., Zhao, X. F., Zuo, X. N., & Hu, C. P. (2020). Beyond psychology: prevalence of	p values and confidence interval misinterpretation across different fields. Journal of Pacific Rim Psychology, 14.

Makowski, D., Ben-Shachar, M. S., Chen, S. H., & Lüdecke, D. (2019). Indices of effect existence and		 significance in the bayesian framework. Frontiers in psychology, 10, 2767.

Mayo, D.G. (2018). Statistical inference as severe testing: How to get beyond the statistics		 wars. New York: NY. Cambridge University Press.

McElreath, R. (2020). Statistical rethinking: A Bayesian course with examples in R and	              	Stan.  London, England: CRC Press.

Morey, R. D., Hoekstra, R., Rouder, J. N., Lee, M. D., & Wagenmakers, E. J. (2016). The fallacy of placing confidence in confidence intervals. Psychonomic bulletin & review, 23(1), 103-123.

Morey, R. D., Rouder, J. N., Jamil, T., & Morey, M. R. D. (2015). Package ‘bayesfactor’. URLh		 http://cran/r-projectorg/web/packages/BayesFactor/BayesFactor pdf i (accessed 1006		 15).

Muth, C., Oravecz, Z., & Gabry, J. (2018). User-friendly Bayesian regression modeling: A tutorial with rstanarm and shinystan. Quantitative Methods for Psychology, 14(2),		 99-119.

Salzburg, D. (2002). The lady Tasting tea: How statistics revolutionised science in the twentieth		 century. New York, NY. First Holts.

Stan Development Team. (2017). Stan modeling language users guide and reference manual,	version 2.17.0. Retrieved from http://mc-stan.org/

Vasishth, S., & Nicenboim, B. (2016). Statistical methods for linguistic research: Foundational ideas–Part I. Language and Linguistics Compass, 10(8), 349-369.

Vasishth, S., & Nicenboim, B. (2016). Statistical methods for linguistic research: Foundational		 ideas–Part I. Language and Linguistics Compass, 10(8), 349-369.

Western, B. (1999). Bayesian analysis for sociologists: An introduction. Sociological Methods &	 Research, 28(1), 7-34.
