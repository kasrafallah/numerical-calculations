   h = 0.00000005;
   t = 0:h:0.001;
   y = zeros(2,length(t));  % <-- changed 1 to 2, each column y(:,i) is the state at time t(i)
   y(1,1) = 0;  % <-- The initial value of y  at time 1
   y(2,1) = 0;  % <-- The initial value of y' at time 1
    % <-- Derivative takes time t and a 2-element y and returns a 2-element result
   for i=1:(length(t)-1)  % At each step in the loop below, changed y(i) to y(:,i) to accomodate 2-element results
      k1 = f( t(i)      , y(:,i)         );
      k2 = f( t(i)+0.5*h, y(:,i)+0.5*h*k1);
      k3 = f( t(i)+0.5*h, y(:,i)+0.5*h*k2);
      k4 = f( t(i)+    h, y(:,i)+    h*k3);
      y(:,i+1) = y(:,i) + (1/6)*(k1 + 2*k2 + 2*k3 + k4)*h; 
   end 
   
% <-- The analytic solution 
Y = 10-2.01619 .* exp(-3125 .* t).* sin(15499.5 .* t)-10*exp(-3125.*t).*cos(15499.5.*t);  

figure
hold on
plot(t,Y,'b','LineWidth',5);  % Plot the analytic solution in thick blue
plot(t,y(1,:),'r','LineWidth',2);  % Plot the RK4 solution in thin red
grid on
legend('analytic','RK4');
xlabel('Time')
ylabel('vc')
title('voltage of capacitor');
function dy = f( t,y )
  dy = zeros(2,1);
  dy(1) = y(2);
  dy(2) =  2.5*10^(9)-2.5*10^(8)*y(1)-6250*y(2);
 end
