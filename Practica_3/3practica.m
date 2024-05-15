msg = [1 0 1 1 0 0 1 0 1]; % Пример битового сообщения
% Прямой перемежитель
function permuted_message = forward_permutation(message)
    % Задаем псевдослучайный закон перестановки
    permutation_sequence = randperm(length(message));
    
    % Перемешиваем биты входного сообщения
    permuted_message = message(permutation_sequence);
end

% Обратный перемежитель
function recovered_message = inverse_permutation(permuted_message, permutation_sequence)
    % Используем заданный закон перестановки
    % для восстановления исходного порядка битов
    recovered_message = permuted_message(permutation_sequence);
end

% Пример использования

permuted_message = forward_permutation(message); % Прямое перемешивание
recovered_message = inverse_permutation(permuted_message, randperm(length(message))); % Обратное перемешивание

disp('Исходное сообщение:');
disp(message);

disp('Прямое перемешивание:');
disp(permuted_message);

disp('Обратное перемешивание:');
disp(recovered_message);
