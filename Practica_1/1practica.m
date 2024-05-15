% Входное сообщение
message = 'Hello World!';

% Знаковый кодер
binary_message = ''; % Переменная для хранения двоичного сообщения
for i = 1:length(message)
    binary_char = dec2bin(message(i), 8); % Преобразование символа в двоичный вид
    binary_message = strcat(binary_message, binary_char);
end

disp('Сообщение после знакового кодирования:');
disp(binary_message);

% Знаковый декодер
decoded_message = ''; % Переменная для хранения декодированного сообщения
for i = 1:8:length(binary_message)
    binary_char = binary_message(i:i+7); % Извлечение двоичного символа
    decoded_char = char(bin2dec(binary_char)); % Преобразование двоичного символа в символ
    decoded_message = strcat(decoded_message, decoded_char);
end

disp('Сообщение после знакового декодирования:');
disp(decoded_message);
