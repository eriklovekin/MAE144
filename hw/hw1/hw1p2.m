%% HW1 Problem 2

b = RR_poly([2,-2,5,-5],1);
a = RR_poly([-1 1 -3 3 -6 6],1);
f = RR_poly([-1 -1 -3 -3 -6 -6],1);

%% (a)
[x,y] = RR_diophantine(a,b,f);
test = trim(a*x+b*y);
residual = norm(f-test)% test that answer is correct (should = 0)


%% (b)
f_roots = RR_roots(f);
k = 6;
f2 = RR_poly([f_roots -20*ones(1,k)],1);% Add k poles to make y/x proper
[x2,y2] = RR_diophantine(a,b,f2);
test2 = trim(a*x2+b*y2);
residual2 = norm(f2-test2)% test result is correct (should = 0)





