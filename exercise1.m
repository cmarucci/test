% Matlab exercise 1: making a plot

% load data / plot it
load 'exampleBehavior.mat'
x = session16ChangeAmounts;
y = session16ProportionCorrect;
z = y + 0.02;
hold on % this will keep all following plots on 1 fig (vs hold off)
s1 = scatter(x,y,'blue', 'filled'); % plot(x,y) will connect the dots
s2 = scatter(x,z, 'green', 'filled');

% change visual appearance of plot
set(gca, 'XScale', 'log') % use log scale for x-axis
xlim([0 100])
ylim([0 1])
xticks(0:10:100)
yticks(0:0.25:1)
%to specifically set labels if ticks don't automatically label them
%correctly
    % xticklabels(0:10:100) OR xticklabels({'0', '10', '20', '30', '40',
    % '50', '60', '70', '80', '90', '100'})
    % yticklables(0:0.25:1) OR yticklabels({'0', '0.25', '0.5', '0.75',
    % '1'})
% xlabel('Size of Change') % this goes away after add fit line, so write
% ylabel('Proportion of Correct') % again after it & comment this out now
title('Practice Behavioral Data Plot')
% legend('original data', 'offset data');

% F1 NOTE: fittype function - linear fit - get error when try to plot
f1 = fittype({'x', '1'});
plot(f1, x, y) %get an error when try this
xlabel('Size of Change')
ylabel('Proportion of Correct')

% F2 NOTE: creates nonlinear curve/fit when do this instead of linear
f2 = fittype('a*x+b', 'independent', 'x', 'dependent', 'y')
myfit = fit(x, y, f2)
plot(myfit, x, y)
xlabel('Size of Change')
ylabel('Proportion of Correct')

% TODO: implement exponential fit (using fittype function)

% TODO: add Weibull function fit

% determine threshold (75% of time see size change reliably)