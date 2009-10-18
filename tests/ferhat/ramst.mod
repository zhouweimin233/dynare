options_.maxit_ = 100;
var c k;
varexo x;

parameters alph gam delt bet aa;
alph=0.5;
gam=0.5;
delt=0.02;
bet=0.05;
aa=0.5;


model(block, bytecode);
c + k - aa*x*k(-1)^alph - (1-delt)*k(-1);
c^(-gam) - (1+bet)^(-1)*(aa*alph*x(+1)*k^(alph-1) + 1 - delt)*c(+1)^(-gam);
end;

initval;
x = 1;
k = ((delt+bet)/(1.0*aa*alph))^(1/(alph-1));
c = aa*k^alph-delt*k;
end;

steady(solve_algo = 5);

//check;
model_info;
shocks;
var x;
periods 1;
values 1.02;
end;

simul(periods = 200, stack_solve_algo = 5, markowitz = 2);

rplot c;
rplot k;
