% Matlab exercise 1: making a plot

figure
hold on % this will keep all following plots on 1 fig (vs hold off)

% load data / plot it
load 'exampleBehavior.mat'
x = session16ChangeAmounts;
y = session16ProportionCorrect;
z = y + 0.02;
s1 = scatter(x,y,'blue', 'filled'); % plot(x,y) will connect the dots
s2 = scatter(x,z, 'green', 'filled');

% change visual appearance of plot
set(gca, 'XScale', 'log') % use log scale for x-axis
xlim([0 100])
ylim([0 1])
xticks(0:10:100)
yticks(0:0.25:1)
%to specifically set labels if ticks don't automatically label them right:
    % xticklabels(0:10:100) / xticklabels({'0', '10', '20', '30', '40',
    % '50', '60', '70', '80', '90', '100'})
    % yticklables(0:0.25:1) / yticklabels({'0', '0.25', '0.5', '0.75', '1'})
title('Practice Behavioral Data Plot')
legend('original data', 'offset data', 'Location', 'northwest')

% F2: linear fit (appears non-linear because of log scale)
f2 = fittype('a*x+b', 'independent', 'x', 'dependent', 'y')
myfit2 = fit(x, y, f2, 'Start', [0, 0])
plot(myfit2, x, y)

% F3: exponential fit (using fittype function)
f3 = fittype('a*exp(b*x)', 'independent', 'x', 'dependent', 'y')
myfit3 = fit(x, y, f3, 'Start', [0, 0])
% myfit2 = fit(x, y, f3, 'Start', [0, 1])
plot(myfit3, x, y)

% F4: Weibull function fit
f4 = fittype('c*a*b*x^(b-1)*exp(-a*x^b)', 'independent', 'x', ...
    'dependent', 'y')
myfit4 = fit(x, y, f4, 'Start', [0.01, 0.01, 0.01])
plot(myfit4, x, y)

% determine threshold (75% of time see size change reliably)

xlabel('Size of Change')
ylabel('Proportion of Correct')
hold off