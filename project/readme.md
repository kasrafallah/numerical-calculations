### implementing rong Kutta order 4 method for solving differential equation in Matlab
in each loop i calculate 4 coficents of this method and with using them i found answer of each step of that


       for i=1:(length(t)-1)  % At each step in the loop below, changed y(i) to y(:,i) to accomodate 2-element results
          k1 = f( t(i)      , y(:,i)         );
          k2 = f( t(i)+0.5*h, y(:,i)+0.5*h*k1);
          k3 = f( t(i)+0.5*h, y(:,i)+0.5*h*k2);
          k4 = f( t(i)+    h, y(:,i)+    h*k3);
          y(:,i+1) = y(:,i) + (1/6)*(k1 + 2*k2 + 2*k3 + k4)*h; 
       end 

then to show the accuracy of this method I plotted the analytical answer of one equation and our code output in one figure to compare them, as you can see in the figure below:

<p align="center">
<image align="center" src = "images/p1.png" width="600">
</p>
  
- as you can easily infer our method is quite accurate
