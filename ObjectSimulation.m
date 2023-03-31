clear;
close all;
n = 8^3;
stepA = 1;
stepB = 1;
stepC = 1;
stepD = 1;
dif = [0 0];
hold on;
object1 = [0 10];    object2 = [10 10];   object3 = [10 0];   object4 = [0 0];
save = zeros(4,2);

for i = 1:n
    [dif(1), dif(2)] = dif_var(object1(1), object1(2), object2(1), object2(2), stepA);
    save(1,1) = object1(1) + dif(1);
    save(1,2) = object1(2) + dif(2);

    [dif(1), dif(2)] = dif_var(object2(1), object2(2), object3(1), object3(2), stepB);
    save(2,1) = object2(1) + dif(1);
    save(2,2) = object2(2) + dif(2);
    
    [dif(1), dif(2)] = dif_var(object3(1), object3(2), object4(1), object4(2), stepC);
    save(3,1) = object3(1) + dif(1);
    save(3,2) = object3(2) + dif(2);

    [dif(1), dif(2)] = dif_var(object4(1), object4(2), object1(1), object1(2), stepD);
    save(4,1) = object4(1) + dif(1);
    save(4,2) = object4(2) + dif(2);

    object1(1) = save(1,1); object1(2) = save(1,2);
    object2(1) = save(2,1); object2(2) = save(2,2);
    object3(1) = save(3,1); object3(2) = save(3,2);
    object4(1) = save(4,1); object4(2) = save(4,2);

    plot(object1(1), object1(2), '.b');
    plot(object2(1), object2(2), '.r');
    plot(object3(1), object3(2), '.g');
    plot(object4(1), object4(2), '.y');
end

function [varX, varY] = dif_var(X1, Y1, X2, Y2, step)  
    
    step_new = step*(1/(((X1-X2)*(X1-X2)) + ((Y1 - Y2)*(Y1 - Y2))));

    difX = X2 - X1;
    difY = Y2 - Y1;
    
    varY = (step_new*(difY/(abs(difX)+abs(difY))));
    varX = sign(difX)*(step_new - abs(varY));

end