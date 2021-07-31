
### nonlinear equation solving method- jacobian method
first of all I write matrix that inclouds all of the equations we must solve after that we must find the jacobian form that is writen below

    Jacobian_F = zeros(Number_of_divisions);

        Jacobian_F(1, 1) = 1;

        for i = 2 : Number_of_divisions - 1
            Jacobian_F(i, i - 1) = 1;
            Jacobian_F(i, i) = -2 - 8*h^2*y(i);
            Jacobian_F(i, i + 1) = 1;
        end
  and then we must just we the theory to caculate the answers as i writen below:
  
      for i = 1:10

        F = y(1) - 10;

        for i = 2 : Number_of_divisions - 1
            F = [F; y(i - 1) - 2*y(i) + y(i + 1) - 4*h^2*y(i)^2];
        end

        F = [F; y(Number_of_divisions - 1) - y(Number_of_divisions) - 2*h^2*y(Number_of_divisions)^2];


        Jacobian_F = zeros(Number_of_divisions);

        Jacobian_F(1, 1) = 1;

        for i = 2 : Number_of_divisions - 1
            Jacobian_F(i, i - 1) = 1;
            Jacobian_F(i, i) = -2 - 8*h^2*y(i);
            Jacobian_F(i, i + 1) = 1;
        end

        Jacobian_F(Number_of_divisions, Number_of_divisions - 1) = 1;
        Jacobian_F(Number_of_divisions, Number_of_divisions) = -1 - 4*h^2*y(Number_of_divisions);

        y = y - inv(Jacobian_F)*F
    end
