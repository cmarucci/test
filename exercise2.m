load 'exampleBehavior.mat'

%% SESSION 1
% tca = behavior(1).changeamount;
% unique(tca)
% thm = behavior(1).hitmiss;
% unique(thm); don't really need this since know just 0 (miss) or 1 (hit)

%% SESSION 16: LOOP

ca16 = behavior(16).changeamount;
hm16 = behavior(16).hitmiss;
vals = unique(ca16);

for i = 1:size(vals)
    idx = [ca16]==vals(i);
    n = numel(find(ca16==vals(i)));
    h = numel(find(hm16(idx)==1));
    r(i) = h/n;
end
r = r'

%% SESSION 16: PLOT

figure
hold on

s = scatter(vals, r, 'blue', 'filled')

set(gca, 'XScale', 'log') % use log scale for x-axis
xlim([0 100])
ylim([0 1])
xticks(0:10:100)
yticks(0:0.25:1)

% Weibull function fit
% TODO: add the 3rd parameter
% f2 = fittype('c*a*b*x^(b-1)*exp(-a*x^b)', 'independent', 'x', ...
%     'dependent', 'y')
% myfit2 = fit(vals, r, f2, 'Start', [25.69, 1.859, 1])
% plot(myfit2, 'green', vals, r)
f = fittype('1-exp(-(x/a)^b)');
myfit = fit(vals, r, f, 'Start', [25.69, 1.859])
plot(myfit, 'red', vals, r)

% plot's visual appearance
title('Ex2: Practice Behavioral Data Plot')
legend('original data', ' ', 'weibull fit', 'Location', 'northwest')
xlabel('Size of Change')
ylabel('Proportion of Correct')
hold off

%% SESSION 16: no loop

% ca16 = behavior(16).changeamount;
% hm16 = behavior(16).hitmiss;
% unique(ca16)
% unique(hm16); don't really need this since know just 0 (miss) or 1 (hit)

% CA = 3
% idx1 = [ca16]==3;
% ca16(idx1);
% hm16(idx1);
% n1 = numel(find(ca16==3));
% h1 = numel(find(hm16(idx1)==1));
% r1 = h1 / n1;

% CA = 6
% idx2 = [ca16]==6;
% ca16(idx2);
% hm16(idx2);
% n2 = numel(find(ca16==6));
% h2 = numel(find(hm16(idx2)==1));
% r2 = h2/n2;

% CA = 16
% idx3 = [ca16]==16;
% ca16(idx3);
% hm16(idx3);
% n3 = numel(find(ca16==16));
% h3 = numel(find(hm16(idx3)==1));
% r3 = h3/n3;

% CA = 37
% idx4 = [ca16]==37;
% ca16(idx4);
% hm16(idx4);
% n4 = numel(find(ca16==37));
% h4 = numel(find(hm16(idx4)==1));
% r4 = h4/n4;

% CA = 90
% idx5 = [ca16]==90;
% ca16(idx5);
% hm16(idx5);
% n5 = numel(find(ca16==90));
% h5 = numel(find(hm16(idx5)==1));
% r5 = h5/n5;

%% CHECK SESSION 16
% calcS16PC = [r1, r2, r3, r4, r5]
% session16ChangeAmounts
% session16ProportionCorrect
% use to check that all trials accounted for (should be n = 359)
% n = n1 + n2 + n3 + n4 + n5