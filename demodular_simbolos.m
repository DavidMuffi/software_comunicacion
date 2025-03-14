% Función para demodular símbolos recibidos (asigna al más cercano)
function B = demodular_simbolos(recibidos, modulacion)
    [~, idx] = min(abs(recibidos' - modulacion), [], 2);
    B = modulacion(idx);  % Asigna el símbolo más cercano
end
