function [fitresult, gof] = createFits12curve(man_XX_ovo, man_YY_ovo, man_XX_tap, man_YY_tap, man_XX_squ, man_YY_squ)
%CREATEFITS2(MAN_XX_OVO,MAN_YY_OVO,MAN_XX_TAP,MAN_YY_TAP,MAN_XX_SQU,MAN_YY_SQU)
%  Create fits.
%
%  Data for 'poly6_man_ovo' fit:
%      X Input : man_XX_ovo
%      Y Output: man_YY_ovo
%  Data for 'poly4_man_ovo' fit:
%      X Input : man_XX_ovo
%      Y Output: man_YY_ovo
%  Data for 'Fourier4_man_ovo' fit:
%      X Input : man_XX_ovo
%      Y Output: man_YY_ovo
%  Data for 'Fourier2_man_ovo' fit:
%      X Input : man_XX_ovo
%      Y Output: man_YY_ovo
%  Data for 'poly6_man_tap' fit:
%      X Input : man_XX_tap
%      Y Output: man_YY_tap
%  Data for 'poly4_man_tap' fit:
%      X Input : man_XX_tap
%      Y Output: man_YY_tap
%  Data for 'Fourier4_man_tap' fit:
%      X Input : man_XX_tap
%      Y Output: man_YY_tap
%  Data for 'Fourier2_man_tap' fit:
%      X Input : man_XX_tap
%      Y Output: man_YY_tap
%  Data for 'poly6_man_squ' fit:
%      X Input : man_XX_squ
%      Y Output: man_YY_squ
%  Data for 'poly4_man_squ' fit:
%      X Input : man_XX_squ
%      Y Output: man_YY_squ
%  Data for 'Fourier4_man_squ' fit:
%      X Input : man_XX_squ
%      Y Output: man_YY_squ
%  Data for 'Fourier2_man_squ' fit:
%      X Input : man_XX_squ
%      Y Output: man_YY_squ
%  Output:
%      fitresult : a cell-array of fit objects representing the fits.
%      gof : structure array with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 04-Dec-2020 19:52:59

%% Initialization.

% Initialize arrays to store fits and goodness-of-fit.
fitresult = cell( 12, 1 );
gof = struct( 'sse', cell( 12, 1 ), ...
    'rsquare', [], 'dfe', [], 'adjrsquare', [], 'rmse', [] );

%% Fit: 'poly6_man_ovo'.
[xData, yData] = prepareCurveData( man_XX_ovo, man_YY_ovo );

% Set up fittype and options.
ft = fittype( 'poly6' );

% Fit model to data.
[fitresult{1}, gof(1)] = fit( xData, yData, ft, 'Normalize', 'on' );

% Plot fit with data.
figure( 'Name', 'poly6_man_ovo' );
h = plot( fitresult{1}, xData, yData );
legend( h, 'man_YY_ovo vs. man_XX_ovo', 'poly6_man_ovo', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'man_XX_ovo', 'Interpreter', 'none' );
ylabel( 'man_YY_ovo', 'Interpreter', 'none' );
grid on

%% Fit: 'poly4_man_ovo'.
[xData, yData] = prepareCurveData( man_XX_ovo, man_YY_ovo );

% Set up fittype and options.
ft = fittype( 'poly4' );

% Fit model to data.
[fitresult{2}, gof(2)] = fit( xData, yData, ft, 'Normalize', 'on' );

% Plot fit with data.
figure( 'Name', 'poly4_man_ovo' );
h = plot( fitresult{2}, xData, yData );
legend( h, 'man_YY_ovo vs. man_XX_ovo', 'poly4_man_ovo', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'man_XX_ovo', 'Interpreter', 'none' );
ylabel( 'man_YY_ovo', 'Interpreter', 'none' );
grid on

%% Fit: 'Fourier4_man_ovo'.
[xData, yData] = prepareCurveData( man_XX_ovo, man_YY_ovo );

% Set up fittype and options.
ft = fittype( 'fourier4' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0 0 0 0 0 0 0 0 0 0.00337080756822939];

% Fit model to data.
[fitresult{3}, gof(3)] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'Fourier4_man_ovo' );
h = plot( fitresult{3}, xData, yData );
legend( h, 'man_YY_ovo vs. man_XX_ovo', 'Fourier4_man_ovo', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'man_XX_ovo', 'Interpreter', 'none' );
ylabel( 'man_YY_ovo', 'Interpreter', 'none' );
grid on

%% Fit: 'Fourier2_man_ovo'.
[xData, yData] = prepareCurveData( man_XX_ovo, man_YY_ovo );

% Set up fittype and options.
ft = fittype( 'fourier2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0 0 0 0 0 0.00674161513645878];

% Fit model to data.
[fitresult{4}, gof(4)] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'Fourier2_man_ovo' );
h = plot( fitresult{4}, xData, yData );
legend( h, 'man_YY_ovo vs. man_XX_ovo', 'Fourier2_man_ovo', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'man_XX_ovo', 'Interpreter', 'none' );
ylabel( 'man_YY_ovo', 'Interpreter', 'none' );
grid on

%% Fit: 'poly6_man_tap'.
[xData, yData] = prepareCurveData( man_XX_tap, man_YY_tap );

% Set up fittype and options.
ft = fittype( 'poly6' );

% Fit model to data.
[fitresult{5}, gof(5)] = fit( xData, yData, ft, 'Normalize', 'on' );

% Plot fit with data.
figure( 'Name', 'poly6_man_tap' );
h = plot( fitresult{5}, xData, yData );
legend( h, 'man_YY_tap vs. man_XX_tap', 'poly6_man_tap', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'man_XX_tap', 'Interpreter', 'none' );
ylabel( 'man_YY_tap', 'Interpreter', 'none' );
grid on

%% Fit: 'poly4_man_tap'.
[xData, yData] = prepareCurveData( man_XX_tap, man_YY_tap );

% Set up fittype and options.
ft = fittype( 'poly4' );

% Fit model to data.
[fitresult{6}, gof(6)] = fit( xData, yData, ft, 'Normalize', 'on' );

% Plot fit with data.
figure( 'Name', 'poly4_man_tap' );
h = plot( fitresult{6}, xData, yData );
legend( h, 'man_YY_tap vs. man_XX_tap', 'poly4_man_tap', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'man_XX_tap', 'Interpreter', 'none' );
ylabel( 'man_YY_tap', 'Interpreter', 'none' );
grid on

%% Fit: 'Fourier4_man_tap'.
[xData, yData] = prepareCurveData( man_XX_tap, man_YY_tap );

% Set up fittype and options.
ft = fittype( 'fourier4' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0 0 0 0 0 0 0 0 0 0.00679998409867921];

% Fit model to data.
[fitresult{7}, gof(7)] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'Fourier4_man_tap' );
h = plot( fitresult{7}, xData, yData );
legend( h, 'man_YY_tap vs. man_XX_tap', 'Fourier4_man_tap', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'man_XX_tap', 'Interpreter', 'none' );
ylabel( 'man_YY_tap', 'Interpreter', 'none' );
grid on

%% Fit: 'Fourier2_man_tap'.
[xData, yData] = prepareCurveData( man_XX_tap, man_YY_tap );

% Set up fittype and options.
ft = fittype( 'fourier2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0 0 0 0 0 0.00679998409867921];

% Fit model to data.
[fitresult{8}, gof(8)] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'Fourier2_man_tap' );
h = plot( fitresult{8}, xData, yData );
legend( h, 'man_YY_tap vs. man_XX_tap', 'Fourier2_man_tap', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'man_XX_tap', 'Interpreter', 'none' );
ylabel( 'man_YY_tap', 'Interpreter', 'none' );
grid on

%% Fit: 'poly6_man_squ'.
[xData, yData] = prepareCurveData( man_XX_squ, man_YY_squ );

% Set up fittype and options.
ft = fittype( 'poly6' );

% Fit model to data.
[fitresult{9}, gof(9)] = fit( xData, yData, ft, 'Normalize', 'on' );

% Plot fit with data.
figure( 'Name', 'poly6_man_squ' );
h = plot( fitresult{9}, xData, yData );
legend( h, 'man_YY_squ vs. man_XX_squ', 'poly6_man_squ', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'man_XX_squ', 'Interpreter', 'none' );
ylabel( 'man_YY_squ', 'Interpreter', 'none' );
grid on

%% Fit: 'poly4_man_squ'.
[xData, yData] = prepareCurveData( man_XX_squ, man_YY_squ );

% Set up fittype and options.
ft = fittype( 'poly4' );

% Fit model to data.
[fitresult{10}, gof(10)] = fit( xData, yData, ft, 'Normalize', 'on' );

% Plot fit with data.
figure( 'Name', 'poly4_man_squ' );
h = plot( fitresult{10}, xData, yData );
legend( h, 'man_YY_squ vs. man_XX_squ', 'poly4_man_squ', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'man_XX_squ', 'Interpreter', 'none' );
ylabel( 'man_YY_squ', 'Interpreter', 'none' );
grid on

%% Fit: 'Fourier4_man_squ'.
[xData, yData] = prepareCurveData( man_XX_squ, man_YY_squ );

% Set up fittype and options.
ft = fittype( 'fourier4' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0 0 0 0 0 0 0 0 0 0.00307999279763705];

% Fit model to data.
[fitresult{11}, gof(11)] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'Fourier4_man_squ' );
h = plot( fitresult{11}, xData, yData );
legend( h, 'man_YY_squ vs. man_XX_squ', 'Fourier4_man_squ', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'man_XX_squ', 'Interpreter', 'none' );
ylabel( 'man_YY_squ', 'Interpreter', 'none' );
grid on

%% Fit: 'Fourier2_man_squ'.
[xData, yData] = prepareCurveData( man_XX_squ, man_YY_squ );

% Set up fittype and options.
ft = fittype( 'fourier2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0 0 0 0 0 0.0061599855952741];

% Fit model to data.
[fitresult{12}, gof(12)] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'Fourier2_man_squ' );
h = plot( fitresult{12}, xData, yData );
legend( h, 'man_YY_squ vs. man_XX_squ', 'Fourier2_man_squ', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'man_XX_squ', 'Interpreter', 'none' );
ylabel( 'man_YY_squ', 'Interpreter', 'none' );
grid on

