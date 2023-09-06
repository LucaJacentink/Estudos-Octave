
fprintf('Digite o número de linhas de A: ');
num_linhas = input('');

fprintf('Digite o número de colunas de A: ');
num_colunas = input('');


A = zeros(num_linhas, num_colunas);


fprintf('Digite os elementos de A linha por linha (separe os elementos por espaços):\n');
for i = 1:num_linhas
    fprintf('Digite os elementos da linha %d: ', i);
    linha = input('', 's');
    elementos = str2num(linha);
    A(i, :) = elementos;
end


fprintf('Digite os elementos de b separados por vírgulas (exemplo: 2.4,0,35): ');
b_str = input('', 's');
b = str2num(strrep(b_str, ',', ' '));




function x = eliminacaoGauss(A, b)
    n = length(b);
    x = zeros(n, 1);


    for k = 1:n-1
        for i = k+1:n
            factor = A(i,k) / A(k,k);
            A(i,k+1:n) = A(i,k+1:n) - factor * A(k,k+1:n);
            b(i) = b(i) - factor * b(k);
        end
    end


    x(n) = b(n) / A(n,n);
    for i = n-1:-1:1
        x(i) = (b(i) - A(i,i+1:n) * x(i+1:n)) / A(i,i);
    end
end
x = eliminacaoGauss(A, b);
disp('Vetor x:');
disp(x);

