function [min_point] = golden_ratio_method(f, a, b, n)
A = []; B = []; %左右端点列表
T1 = []; T2 = []; %左右试点列表
lower = []; %左试点函数值是否小于右试点
A(1) = a; B(1) = b; %试点初值
ratio = (sqrt(5) - 1) / 2;
%设定初始参数

T1(1) = b - ratio * (b - a);
T2(1) = a + ratio * (b - a);
%计算首对试点

for k = 2: n - 2
    if f(T1(k - 1)) < f(T2(k - 1))
        A(k) = A(k - 1);
        B(k) = T2(k - 1);
        T2(k) = T1(k - 1);
        T1(k) = B(k) - ratio * (B(k) - A(k));
        lower(k - 1) = true;
    else
        A(k) = T1(k - 1);
        B(k) = B(k - 1);
        T1(k) = T2(k - 1);
        T2(k) = A(k) + ratio * (B(k) - A(k));
        lower(k - 1) = false;
    end
    %根据函数值关系更新试点和区间端点
    %注意由于下标从1开始而公式中符号下标从0开始故下标存在细微差别
end

T1(n - 2) = (A(n - 2) + B(n - 2)) / 2;
T2(n - 2) = T1(n - 2);

for k = 1: n - 3
    disp(['第', num2str(k), '轮：']);
    disp(['a', num2str(k - 1), ' = ', num2str(A(k)) ' b', num2str(k - 1), ' = ' num2str(B(k))]);
    disp(['t' num2str(k) ' = ' num2str(T1(k)) ' t' num2str(k) ''' = ' num2str(T2(k))]);
    disp(['f(t' num2str(k) ') = ' num2str(f(T1(k))) ' f(t', num2str(k), ''') = ' num2str(f(T2(k)))]);
    if lower(k)
        disp(['f(t', num2str(k), ') < ' 'f(t' num2str(k) ''')']);
    else
        disp(['f(t', num2str(k), ') > ' 'f(t' num2str(k) ''')']);
    end
    fprintf('\n');
end

disp('最后一轮');
disp(['t' num2str(n - 2) ' = t' num2str(n - 2) ''' = ' num2str(T2(n - 2))]);
end

