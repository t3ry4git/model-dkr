% Параметри системи
sigma = 10;
rho = 28;
beta = 8/3;

% Початкові умови та часова шкала
initial_conditions = [1, 1, 1];
time_span = [0 50];

% Розв'язання системи диференціальних рівнянь
[t, y] = ode45(@(t, y) lorenz(t, y, sigma, rho, beta), time_span, initial_conditions);

% Побудова траєкторії
plot3(y(:,1), y(:,2), y(:,3));
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Lorenz Attractor');
grid on;

% Визначення функції для системи Лоренца
function dydt = lorenz(t, y, sigma, rho, beta)
    dydt = zeros(3,1);
    dydt(1) = sigma * (y(2) - y(1));
    dydt(2) = y(1) * (rho - y(3)) - y(2);
    dydt(3) = y(1) * y(2) - beta * y(3);
end