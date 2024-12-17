% Plot roots of Wilkinson polynomials for n = 21 to 30
figure;
hold on;
for n = 21:30
    % Generate the Wilkinson polynomial coefficients
    coefficients = poly(1:n);
    
    % Find the numerical roots
    computed_roots = roots(coefficients);
    
    % Plot the roots in the complex plane
    plot(real(computed_roots), imag(computed_roots), '*', 'DisplayName', sprintf('Roots for n=%d', n));
    
    % If n == 30, analyze the 20th root
    if n == 30
        % True value of the 20th root
        true_root = 20;
        
        % Find the root closest to 20
        [~, idx] = min(abs(computed_roots - true_root)); % Returns min value and index. Min value not needed, thus the placeholder "~"
        estimated_root = computed_roots(idx);
        
        % Calculate relative error
        relative_error = abs(estimated_root - true_root) / abs(true_root);
        
        % Machine epsilon
        epsilon = eps;
        
        % Estimate condition number
        condition_number = relative_error / epsilon;
        
        % Display results
        fprintf('Degree-30 Polynomial:\n');
        fprintf('True Root: %f\n', true_root);
        fprintf('Estimated Root: %f + %fi\n', real(estimated_root), imag(estimated_root));
        fprintf('Relative Error: %e\n', relative_error);
        fprintf('Condition Number: %e\n', condition_number);
        
        % Highlight the 20th root
        plot(real(estimated_root), imag(estimated_root), 'rx', 'MarkerSize', 10, 'LineWidth', 2, ...
             'DisplayName', '20th Root (Estimated)');
    end
end
hold off;

% Finalize the plot
title('Roots of Wilkinson Polynomials (n=21 to 30) in the Complex Plane');
xlabel('Real Part');
ylabel('Imaginary Part');
grid on;
legend;
