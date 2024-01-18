""" 
Transformation function from Smithson and Verkuilen (2006),
so the dependent variable values are > 0 and < 1
"""
def beta_transform(x):
    n = len(x)
    y = (x * (n - 1) + .5)/n
    return(y)

