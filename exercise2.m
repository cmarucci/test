load 'exampleBehavior.mat'

%% SESSION 1
% tca = behavior(1).changeamount;
% unique(tca)
% thm = behavior(1).hitmiss;
% unique(thm); don't really need this since know just 0 (miss) or 1 (hit)

%% SESSION 16

ca16 = behavior(16).changeamount;
hm16 = behavior(16).hitmiss;
unique(ca16)
% unique(hm16); don't really need this since know just 0 (miss) or 1 (hit)

% CA = 3
idx1 = [ca16]==3;
ca16(idx1);
hm16(idx1);
n1 = numel(find(ca16==3));
h1 = numel(find(hm16(idx1)==1));
r1 = h1 / n1;

% CA = 6
idx2 = [ca16]==6;
ca16(idx2);
hm16(idx2);
n2 = numel(find(ca16==6));
h2 = numel(find(hm16(idx2)==1));
r2 = h2/n2;

% CA = 16
idx3 = [ca16]==16;
ca16(idx3);
hm16(idx3);
n3 = numel(find(ca16==16));
h3 = numel(find(hm16(idx3)==1));
r3 = h3/n3;

% CA = 37
idx4 = [ca16]==37;
ca16(idx4);
hm16(idx4);
n4 = numel(find(ca16==37));
h4 = numel(find(hm16(idx4)==1));
r4 = h4/n4;

% CA = 90
idx5 = [ca16]==90;
ca16(idx5);
hm16(idx5);
n5 = numel(find(ca16==90));
h5 = numel(find(hm16(idx5)==1));
r5 = h5/n5;

% CHECK
calcS16PC = [r1, r2, r3, r4, r5]
x
y
% use to check that all trials accounted for (should be n = 359)
n = n1 + n2 + n3 + n4 + n5