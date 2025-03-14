%Additive White Gaussian Noise
%BPSK
%QPSK
%16QAM
%64QAM
% Simulación de 4-PAM con ruido AWGN
% ================================

% Parámetros
bitsTransmitidos = 6;  % Número de bits a transmitir
M = 4;  % 4-PAM
k = log2(M); % Bits por símbolo
es = 5; % Energía del símbolo
ebnodb = 0; % Relación Eb/No en dB
ebno = 10^(ebnodb/10); % Valor lineal de Eb/No
eb = es / k; % Energía por bit
no = eb / ebno; % Densidad espectral de ruido
sqrt_no = sqrt(no/2); % Factor de escalado para ruido

% Modulación 4-PAM
modulacion = [-3 -1 1 3];
orden = [0 1 2 3]; % Mapeo de símbolos a valores decimales

% Generación de bits aleatorios
bits = generar_bits(bitsTransmitidos);

% Verificar que bitsTransmitidos es múltiplo de log2(M)
if mod(bitsTransmitidos, k) ~= 0
    error('El número de bits debe ser múltiplo de log2(M)');
end

% Conversión de bits a símbolos
bits_reshaped = reshape(bits, k, []);  % Agrupar en pares de bits
indice_simbolos = bits_reshaped(1,:) * 2 + bits_reshaped(2,:);
simbolos = modulacion(indice_simbolos + 1);

% Generación de ruido AWGN
ruido = sqrt_no * randn(size(simbolos));

% Señal recibida
recibido = simbolos + ruido;

% Demodulación
simbolos_demodulados = demodular_simbolos(recibido, modulacion);

% Conversión de símbolos demodulados a bits
[~, indices] = ismember(simbolos_demodulados, modulacion);
indice_demodulado = orden(indices);
aux = dec2bin(indice_demodulado, k) - '0';
bits_recibidos = aux(:)';

% Cálculo de errores
errores = sum(bits ~= bits_recibidos);
ber = errores / bitsTransmitidos;

% Mostrar resultados
disp("Bits originales:");
disp(bits);
disp("Símbolos transmitidos:");
disp(simbolos);
disp("Símbolos recibidos con ruido:");
disp(recibido);
disp("Símbolos demodulados:");
disp(simbolos_demodulados);
disp("Bits recibidos:");
disp(bits_recibidos);
disp("Número de errores:");
disp(errores);
disp("Bit Error Rate (BER):");
disp(ber);

#sqrt((n_zero/2))*randn(size(vector));
#sqrt((n_zero/2))*(randn(size(vector))+1j*randn(size(vector)));

