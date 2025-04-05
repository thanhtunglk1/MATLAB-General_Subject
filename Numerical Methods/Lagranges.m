X = [0	2	4	6	8	10	12	14	16	18	20	22	24	26	28	30	32	34	36	38	40	42	44	46	48	50	52	54	56	58	60];
Y = [5	7	40	86	90	87	80	5	10	7	5	50	90	5	8	5	40	85	10	5	15	10	15	7	30	28	28	13	32	20	10];
%so phan tu N3
n= length(X);
    syms A(t) % chon 0 <= A(t) >=1
    syms t 
    f = 0;
    for i = 1 : n+1
           q = Y(i);
        for j = 1: n+1
            if i ~= j
                q = q*(t-X(j))/(X(i)-X(j));
            end
        end
        f = f + q;
        A(t)=simplify(f);
    end
    disp('ket qua lagranges la:');
   % ve do thi cua ham noi suy lagranes
      fplot(A, [min(X), max(X)], 'LineWidth', 2);
    hold on;
    plot(X, Y, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
    grid on;
    title('do thi ham largrane bieu thi cho hieu suat cau CPU ');
    xlabel('Thoi gian (s)');
    ylabel('Su dung CPU (%)');
    legend('Da thuc noi suy', 'Du lieu goc', 'Location', 'Best');
    hold off;
