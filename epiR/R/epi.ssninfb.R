epi.ssninfb <- function(treat, control, delta, n, r = 1, power, nfractional = FALSE, alpha){
   
   # alpha <- 1 - conf.level
   beta <- 1 - power

   z.alpha <- qnorm(1 - alpha, mean = 0, sd = 1)
   z.beta <- qnorm(1 - beta, mean = 0, sd = 1)

   if (!is.na(treat) & !is.na(control) & !is.na(delta) & !is.na(power) & is.na(n)) {
      # http://powerandsamplesize.com/Calculators/Compare-2-Proportions/2-Sample-Non-Inferiority-or-Superiority:
      
     if(nfractional == FALSE){
       n.control <- ceiling((treat * (1 - treat) / r + control * (1 - control)) * ((z.alpha + z.beta) / (treat - control - delta))^2)
       n.treat <- n.control * r
       n.total <- n.treat + n.control
     }
     
     if(nfractional == TRUE){
       n.control <- (treat * (1 - treat) / r + control * (1 - control)) * ((z.alpha + z.beta) / (treat - control - delta))^2
       n.treat <- n.control * r
       n.total <- n.treat + n.control
     }
     
      rval <- list(n.total = n.total, n.treat = n.treat, n.control = n.control, power = power)
   }
  
   if (!is.na(treat) & !is.na(control) & !is.na(delta) & !is.na(n) & is.na(power) & !is.na(r) & !is.na(alpha)) {
      
     # Work out the number of subjects in the control group. r equals the number in the treatment group divided by the number in the control group.
      
     if(nfractional == FALSE){     
       n.control <- ceiling(1 / (r + 1) * (n))
       n.treat <- n - n.control
       n.total <- n.treat + n.control
     }
     
     if(nfractional == TRUE){     
       n.control <- 1 / (r + 1) * (n)
       n.treat <- n - n.control
       n.total <- n.treat + n.control
     }
     
     # Replaced 010518 in response to email from Aline Guttmann on 080318: 
     z <- (treat - control - delta) / sqrt(treat * (1 - treat) / n.treat + control * (1 - control) / n.control)
     # Old code: z <- (treat - control - delta) / sqrt(treat * (1 - treat) / n.treat / r + control * (1 - control) / n.control)
     power <- pnorm(z - z.alpha) + pnorm(-z - z.alpha)
      
      rval <- list(n.total = n.total, n.treat = n.treat, n.control = n.control, power = power)
  }
  rval
}  

# Blackwelder WC. "Proving the Null Hypothesis" in Clinical Trials. Control. Clin. Trials 1982; 3:345-353. 
# Chow S, Shao J, Wang H. 2008. Sample Size Calculations in Clinical Research. 2nd Ed. Chapman & Hall/CRC Biostatistics Series. page 90.

# URL: http://support.sas.com/kb/48/616.html

# https://www2.ccrb.cuhk.edu.hk/stat/proportion/tspp_sup.htm

# epi.noninfb(treat = 0.85, control = 0.65, delta = -0.1, n = NA, power = 0.80, r = 1, alpha = 0.05)
# n.treat = 25, n.control = 25, n.total = 50
# Agrees with http://powerandsamplesize.com/Calculators/Compare-2-Proportions/2-Sample-Non-Inferiority-or-Superiority

# epi.noninfb(treat = 0.85, control = 0.65, delta = -0.1, n = 30, power = NA, r = 1, design = 1, alpha = 0.05)

# epi.noninfb(treat = 0.85, control = 0.80, delta = -0.01, n = NA, power = 0.80, r = 1, design = 1, alpha = 0.05)
# epi.noninfb(treat = 0.85, control = 0.80, delta = -0.01, n = 988, power = NA, r = 2, design = 1, alpha = 0.05)