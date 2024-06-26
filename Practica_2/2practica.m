
% Кодирование сообщения с помощью сверточного кода
msg = [1 0 1 0 1 1 0 1]; % Битовое сообщение
G1 = [1 0 1]; % Полином для 1-го регистра
G2 = [1 1 1]; % Полином для 2-го регистра
state = [0 0]; % Инициализация состояния регистров

encoded_msg = []; % Закодированное сообщение

for i = 1:length(msg)
    bit = msg(i);
    
    % Вычисление нового бита выхода для 1-го регистра
    out1 = mod(sum(state.*G1), 2);
    
    % Вычисление нового бита выхода для 2-го регистра
    out2 = mod(sum(state.*G2), 2);
    
    % Добавление битов в закодированное сообщение
    encoded_msg = [encoded_msg bit out1 out2];
    
    % Обновление состояния регистров
    state = [bit state(1)];
end

% Декодирование сообщения с помощью алгоритма Витерби
% Реализация алгоритма Витерби для декодирования кода

estimated_state = zeros(1,length(encoded_msg)); % Предполагаемые состояние регистров
% Оценка состояния регистров и декодирование
for i = 1:length(encoded_msg)
    % Оценка нового состояния для каждого бита в закодированном сообщении
    state_metrics = zeros(1, 4); % Метрики состояний
    for j = 0:3
        state = dec2bin(j, 2) - '0'; % Преобразование в двоичное представление
        out1 = mod(sum(state.*G1), 2);
        out2 = mod(sum(state.*G2), 2);
        
        % Вычисление метрики для текущего состояния
        metric = sum(abs([out1 out2] - encoded_msg(i*3-2:i*3)));
        state_metrics(j+1) = metric;
    end
    
    % Выбор состояния с минимальной метрикой
    [~, min_state] = min(state_metrics);
    estimated_state(i) = min_state - 1;
end

decoded_msg = estimated_state(4:3:end); % Извлечение декодированного сообщения

% Вывод результатов
disp('Исходное сообщение:');
disp(msg);

disp('Закодированное сообщение:');
disp(encoded_msg);

disp('Декодированное сообщение:');
disp(decoded_msg);
