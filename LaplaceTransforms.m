syms b m w z
E1 = ((b/m+100)/(2*w))-z;
E2 = 10*sqrt(b/m)-w;
E3 = 1/(z*w)-4/3;
E4 = (4.64*z-1.3)/w-2.8875;
solv = solve(E1,E2,E3,E4, w>0, z>0,m>0,b>0);