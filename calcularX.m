% Solicite ao usuário as dimensões de A
fprintf('Digite o número de linhas de A: ');
num_linhas = input('');

fprintf('Digite o número de colunas de A: ');
num_colunas = input('');

% Inicialize a matriz A
A = zeros(num_linhas, num_colunas);

% Solicite ao usuário os elementos de A linha por linha
fprintf('Digite os elementos de A linha por linha (separe os elementos por espaços):\n');
for i = 1:num_linhas
    fprintf('Digite os elementos da linha %d: ', i);
    linha = input('', 's');  % Ler a linha como uma string
    elementos = str2num(linha);  % Converter a string em números
    A(i, :) = elementos;
end

% Solicite ao usuário os elementos de b
fprintf('Digite os elementos de b separados por vírgulas (exemplo: 2.4,0,35): ');
b_str = input('', 's');  % Ler a linha como uma string
b = str2num(strrep(b_str, ',', ' '));  % Substituir vírgulas por espaços e converter em números

% Chame a função loucura_calcularX com as matrizes A e b


function calcularX(A, b)
    n = length(b);
    x = zeros(n, 1);

    % Calcular x
    x(n) = b(n) / A(n, n);
    for i = n - 1:-1:1
        s = 0;
        for j = i + 1:n
            s = s + A(i, j) * x(j);
        end
        x(i) = (b(i) - s) / A(i, i);
    end

    % Mostrar o vetor x
    disp('Vetor x:');
    disp(x);
end



% Chame a função loucura_calcularX
calcularX(A, b);
