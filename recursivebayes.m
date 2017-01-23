clear all
beta0 = 0.04; %precision of the prior distribution (1/variance)
mu0 = 0; %mean of the prior
gamma = 1; %precision of the noise
Nsamples = 50; %number of observations
%%to generate samples around mean x = 5 and variance = 1/gamma(precision of
%%noise)
sample_variance = 1/gamma;
sample_mean = 5; %given
y = sample_mean + sample_variance.*randn(Nsamples, 1);
means(1:Nsamples) = sample_mean;
for i=2:Nsamples
 newPrecision(i) = beta0 + i*gamma;
 sumY = sum(y(1:i));
 newMean(i) = (beta0*mu0 + gamma*sumY)/newPrecision(i);
end
%%playing around with variance
betanew = 0.00005; %small variance
for i=2:Nsamples
 newPrecision1(i) = betanew + i*gamma;
 sumY = sum(y(1:i));
 newMean1(i) = (betanew*mu0 + gamma*sumY)/newPrecision1(i);
end
figure(1)
hold on
plot([1:Nsamples],means, 'b-');
plot([1:Nsamples], y, 'ro');
estimate = plot([0:Nsamples-1], newMean, 'r.-');
legend(estimate, 'Prior variance = 0.04');
hold off
figure(2)
hold on
plot([1:Nsamples],means, 'b-');
plot([1:Nsamples], y, 'ro');
estimate2 = plot([0:Nsamples-1], newMean1, 'r.-');
legend(estimate2, 'Prior variance = 0.00005');
hold off