function [fitresult, gof] = ManFits(man_XX_squ, man_YY_squ)
%CREATEFITS2(MAN_XX_SQU,MAN_YY_SQU)
%  Create fits.
%
%  Data for 'polynomial6' fit:
%      X Input : man_XX_squ
%      Y Output: man_YY_squ
%      Validation X: man_XX_squ
%      Validation Y: man_YY_squ
%  Data for 'polynomial4' fit:
%      X Input : man_XX_squ
%      Y Output: man_YY_squ
%  Data for 'Fourier' fit:
%      X Input : man_XX_squ
%      Y Output: man_YY_squ
%  Data for 'Fourier4' fit:
%      X Input : man_XX_squ
%      Y Output: man_YY_squ
%  Output:
%      fitresult : a cell-array of fit objects representing the fits.
%      gof : structure array with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 07-Dec-2020 21:34:59

%% Initialization.

% Initialize arrays to store fits and goodness-of-fit.
fitresult = cell( 4, 1 );
gof = struct( 'sse', cell( 4, 1 ), ...
    'rsquare', [], 'dfe', [], 'adjrsquare', [], 'rmse', [] );

%% Fit: 'polynomial6'.
[xData, yData] = prepareCurveData( man_XX_squ, man_YY_squ );

% Set up fittype and options.
ft = fittype( 'poly6' );

% Fit model to data.
[fitresult{1}, gof(1)] = fit( xData, yData, ft, 'Normalize', 'on' );

% Compare against validation data.
[xValidation, yValidation] = prepareCurveData( man_XX_squ, man_YY_squ );
residual = yValidation - fitresult{1}( xValidation );
nNaN = nnz( isnan( residual ) );
residual(isnan( residual )) = [];
sse = norm( residual )^2;
rmse = sqrt( sse/length( residual ) );
fprintf( 'Goodness-of-validation for ''%s'' fit:\n', 'polynomial6' );
fprintf( '    SSE : %f\n', sse );
fprintf( '    RMSE : %f\n', rmse );
fprintf( '    %i points outside domain of data.\n', nNaN );

% Create a figure for the plots.
figure( 'Name', 'polynomial6' );

% Plot fit with data.
subplot( 2, 1, 1 );
h = plot( fitresult{1}, xData, yData );
% Add validation data to plot.
hold on
h(end+1) = plot( xValidation, yValidation, 'bo', 'MarkerFaceColor', 'w' );
hold off
legend( h, 'man_YY_squ vs. man_XX_squ', 'polynomial6', 'man_YY_squ vs. man_XX_squ', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'man_XX_squ', 'Interpreter', 'none' );
ylabel( 'man_YY_squ', 'Interpreter', 'none' );
grid off

% Plot residuals.
subplot( 2, 1, 2 );
h = plot( fitresult{1}, xData, yData, 'residuals' );
% Add validation data to plot.
hold on
h(end+1) = plot( xValidation, yValidation - fitresult{1}( xValidation ), 'bo', 'MarkerFaceColor', 'w' );
hold off
legend( h, 'polynomial6 - residuals', 'Zero Line', 'polynomial6 - validation residuals', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'man_XX_squ', 'Interpreter', 'none' );
ylabel( 'man_YY_squ', 'Interpreter', 'none' );
grid off

%% Fit: 'polynomial4'.
[xData, yData] = prepareCurveData( man_XX_squ, man_YY_squ );

% Set up fittype and options.
ft = fittype( 'poly4' );

% Fit model to data.
[fitresult{2}, gof(2)] = fit( xData, yData, ft, 'Normalize', 'on' );

% Create a figure for the plots.
figure( 'Name', 'polynomial4' );

% Plot fit with data.
subplot( 2, 1, 1 );
h = plot( fitresult{2}, xData, yData );
legend( h, 'man_YY_squ vs. man_XX_squ', 'polynomial4', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'man_XX_squ', 'Interpreter', 'none' );
ylabel( 'man_YY_squ', 'Interpreter', 'none' );
grid off

% Plot residuals.
subplot( 2, 1, 2 );
h = plot( fitresult{2}, xData, yData, 'residuals' );
legend( h, 'polynomial4 - residuals', 'Zero Line', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'man_XX_squ', 'Interpreter', 'none' );
ylabel( 'man_YY_squ', 'Interpreter', 'none' );
grid off

%% Fit: 'Fourier'.
[xData, yData] = prepareCurveData( man_XX_squ, man_YY_squ );

% Set up fittype and options.
ft = fittype( 'fourier2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Normalize = 'on';
opts.StartPoint = [0 0 0 0 0 0.879298784743042];

% Fit model to data.
[fitresult{3}, gof(3)] = fit( xData, yData, ft, opts );

% Create a figure for the plots.
figure( 'Name', 'Fourier' );

% Plot fit with data.
subplot( 2, 1, 1 );
h = plot( fitresult{3}, xData, yData );
legend( h, 'man_YY_squ vs. man_XX_squ', 'Fourier', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'man_XX_squ', 'Interpreter', 'none' );
ylabel( 'man_YY_squ', 'Interpreter', 'none' );
grid off

% Plot residuals.
subplot( 2, 1, 2 );
h = plot( fitresult{3}, xData, yData, 'residuals' );
legend( h, 'Fourier - residuals', 'Zero Line', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'man_XX_squ', 'Interpreter', 'none' );
ylabel( 'man_YY_squ', 'Interpreter', 'none' );
grid off

%% Fit: 'Fourier4'.
[xData, yData] = prepareCurveData( man_XX_squ, man_YY_squ );

% Set up fittype and options.
ft = fittype( 'fourier4' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Normalize = 'on';
opts.StartPoint = [0 0 0 0 0 0 0 0 0 0.439649392371521];

% Fit model to data.
[fitresult{4}, gof(4)] = fit( xData, yData, ft, opts );

% Create a figure for the plots.
figure( 'Name', 'Fourier4' );

% Plot fit with data.
subplot( 2, 1, 1 );
h = plot( fitresult{4}, xData, yData );
legend( h, 'man_YY_squ vs. man_XX_squ', 'Fourier4', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'man_XX_squ', 'Interpreter', 'none' );
ylabel( 'man_YY_squ', 'Interpreter', 'none' );
grid off

% Plot residuals.
subplot( 2, 1, 2 );
h = plot( fitresult{4}, xData, yData, 'residuals' );
legend( h, 'Fourier4 - residuals', 'Zero Line', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'man_XX_squ', 'Interpreter', 'none' );
ylabel( 'man_YY_squ', 'Interpreter', 'none' );
grid off


