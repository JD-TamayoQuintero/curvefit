function varargout = guidetest2(varargin)
% GUIDETEST2 MATLAB code for guidetest2.fig
%      GUIDETEST2, by itself, creates a new GUIDETEST2 or raises the existing
%      singleton*.
%
%      H = GUIDETEST2 returns the handle to a new GUIDETEST2 or the handle to
%      the existing singleton*.
%
%      GUIDETEST2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIDETEST2.M with the given input arguments.
%
%      GUIDETEST2('Property','Value',...) creates a new GUIDETEST2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guidetest2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guidetest2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guidetest2

% Last Modified by GUIDE v2.5 06-Dec-2020 15:39:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guidetest2_OpeningFcn, ...
                   'gui_OutputFcn',  @guidetest2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before guidetest2 is made visible.
function guidetest2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guidetest2 (see VARARGIN)

% Choose default command line output for guidetest2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using guidetest2.
if strcmp(get(hObject,'Visible'),'off')
    plot(handles.axes1,0,0);
    plot(handles.axes2,0,0);
    plot(handles.axes3,0,0);
    plot(handles.axes4,0,0);
end

% UIWAIT makes guidetest2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guidetest2_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
cla;

popup_sel_index = get(handles.popupmenu1, 'Value');
switch popup_sel_index
    case 1   %Mandibular(poly6)
        
        
        model = uigetfile('*.ply;*.pcd;');
        if ~isequal(model, 0)
        A=pcread(model);
        pcshow(A);
        
        xi=A.Location(:,1);
        yi=A.Location(:,2);
        zii=A.Location(:,3);
        
        minzi=min(zii); zi= minzi-zii; %ORGANIZAMOS DE 0 A MAX
        maxzi=max(zi); zi= maxzi-zi;  %VOLTEMOAS IMAGEN ROJO MAYOR AZUL MENOR
        
%       minzi=min(zii); zi= minzi-zii;
%       maxzi=max(zi); zi= maxzi-zi;
        
        Image = range3Dto2D( xi,yi,zi, 0.5);
        Image=im2double(Image); Imagenor = normalizar(Image);
        imshow(Imagenor, 'Parent', handles.axes8); % imagen de rango
        colormap('jet');
        level=0.7; % para orthoada dilatar o no usar umbral 30%SUPERIOR

        BW = imbinarize(Imagenor,level);
        
        BW =maskconncomp(BW);
%       BW = imrotate(BW,-90);
        imshow(BW, 'Parent', handles.axes9);
%       BW1= imcomplement(BW);
        DT= bwdist((BW));
        DTnor=normalizar(DT);
        imshow(DTnor, 'Parent', handles.axes10);
        tempDT = MEDT2(DT);
        [m, n]=size(DT);
        EDT=zeros(m,n);
        
        EDT(10:m-10, 10:n-10)=  tempDT(10:m-10,10:n-10);
        
        imshow(EDT, 'Parent', handles.axes11);
%         imshow(EDT, 'Parent', handles.axes12);
        colormap('jet');

        [Xli, Yli]=XYpoints(EDT,255);
       
        b1 = Yli\Xli
        
        if b1 == 0.0
         angulo = atan(b1)*180 
        end
        
        if b1 > 0.0
        angulo = atan(b1)*180 -180
        end
                
         if b1 < 0.0
         angulo = -atan(b1)*180 +180
         end
            

        BWaling = imrotate(BW, angulo);
        imshow(BWaling, 'Parent', handles.axes12);
        
        tempang=angulo;
        Imagealing = imrotate(Imagenor,tempang);
 
        BWrange = (BWaling.*Imagealing);  [m,n]=size(BWrange);

        imshow(  BWrange, 'Parent', handles.axes13);
%         colormap('jet')
        
        BWrange1 = imrotate(BWrange, 90); newimage0=zeros(m, n);
        left=BWrange1(:,1:n/2); [newimageleft]=MEDT2(left);
        rigth=BWrange1(:,n/2+1:n); [newimageright]=MEDT2(rigth);

        newimage0(:,1:n/2)=newimageleft; newimage0(:,n/2+1:n)=newimageright;         
%         newimage0  = imrotate(newimage0, -90); %prueba  
%         imshow( newimage0, 'Parent', handles.axes14);
        
        %%
        
%          BWrange = imrotate(BWrange, 90);  %prueba
        
        [m,n]=size(BWrange);
        
        newimage1=zeros(m, n);

        left=BWrange(:,1:n/2);
        [newimageleft]=MEDT2(left);

        rigth=BWrange(:,n/2+1:n);
        [newimageright]=MEDT2(rigth);

        newimage1(:,1:n/2)=newimageleft;
        newimage1(:,n/2+1:n)=newimageright;
         
        newimage0  = imrotate(newimage0, -90); %prueba
        
        imshow(newimage1, 'Parent', handles.axes14);
        imshow(newimage0, 'Parent', handles.axes15);
        
        imshow(newimage0+newimage1, 'Parent', handles.axes16);
        
        [MEDTXx, MEDTYx]=XYpoints(newimage0,255);
        [MEDTXy, MEDTYy]=XYpoints(newimage1,255);
        
        XX = [MEDTXx', MEDTXy'];
        YY = [MEDTYx', MEDTYy'];
        
        relacion_x_ori= abs(max(XX) - min(XX));
        relacion_y_ori= abs(max(YY) - min(YY));

        relacion_xy_ori=relacion_y_ori/relacion_x_ori
        
        %escalamos a 1 en X pero conservamos relacion X:Y


       [XX, YY] = XYpointscalemean(-YY, XX);
       % como la imagen tiene diferente referencia introducimos los valores
       % de la siguiente forma
%         XX= round((XX)); YY= round((YY));
        plot(XX, YY,'.', 'Parent', handles.axes17);
 
        newrgb(:,:,1)= (newimage0+newimage1)*255;
        newrgb(:,:,2)= BWrange;
        newrgb(:,:,3)= (newimage0+newimage1)*255;
        
        imshow(newrgb, 'Parent', handles.axes1);
        

        
        

myString = sprintf('Angulo : %2f', angulo);
set(handles.angulo, 'String', myString);

%%  CUADRADO

man_XX_squ = [295,40,72,110,146,255,241,223,203,177,550,516,480,413,389,367,349,333,445,12,580];
man_YY_squ = [0,175,108,66,40,2,4,8,14,24,175,108,66,24,14,8,4,2,40,285,285];

max_man_squ_x=357;
max_man_squ_y=365;
min_man_squ_x=56;
min_man_squ_y=22;

relacion_x_squ= abs(max_man_squ_x - min_man_squ_x);
relacion_y_squ= abs(max_man_squ_y - min_man_squ_y);

relacion_xy_squ=relacion_y_squ/relacion_x_squ

[man_XX_squ, man_YY_squ ] = XYpointscalemean(man_XX_squ, man_YY_squ);

% Initialize arrays to store fits and goodness-of-fit.
fitresult_man_XX_squ = cell( 1, 1 );
gof_man_XX_squ = struct( 'sse', cell( 1, 1 ), ...
    'rsquare', [], 'dfe', [], 'adjrsquare', [], 'rmse', [] );

% Fit: 'polynomial6'.
[xData, yData] = prepareCurveData( man_XX_squ, man_YY_squ*relacion_xy_squ);

% Set up fittype and options.
ft = fittype( 'poly6' );

% Fit model to data.
[fitresult_man_XX_squ{1}, gof_man_XX_squ(1)] = fit( xData, yData, ft);

% % [points] = newXYpointcurveselection(XX)
% 
% [YY] = YY(points);
% [XX] = XX(points);

% Compare against validation data.
[xValidation, yValidation] = prepareCurveData(XX, YY*relacion_xy_ori);
residual = yValidation - fitresult_man_XX_squ{1}( xValidation );
nNaN = nnz( isnan( residual ) );
residual(isnan( residual )) = [];
sse_squ = norm( residual )^2;
rmse_squ = sqrt( sse_squ/length( residual ) );

% Create a figure for the plots.
figure(1);

% Plot fit with data.

subplot( 1, 1, 1 );
h = plot( fitresult_man_XX_squ{1}, xData, yData);

% plot(h, 'Parent', handles.axes2);
% Add validation data to plot.
hold on
h(end+1) = plot( xValidation, yValidation, 'g.', 'MarkerFaceColor', 'w');
hold off
legend( h, 'mandibula_plantilla cuadrada', 'polynomial-6', 'modelo maximos', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
% xlabel( 'man_XX_squ', 'Interpreter', 'none' );
% ylabel( 'man_YY_squ', 'Interpreter', 'none' );
grid off

saveas(figure(1),'man_XX_squ.png');

IM_squ=imread('man_XX_squ.png');
imshow(IM_squ, 'Parent', handles.axes2);

myString = sprintf( 'CUADRADO \n SSE : %f\n RMSE : %f\n', sse_squ, rmse_squ);
set(handles.text3, 'String', myString);

%% Triangular   tapered


man_XX_tap = [306,72,115,153,181,262,254,238,221,203,534,491,455,405,387,370,356,346,427,30,574];
man_YY_tap = [0,177,109,66,40,2,4,8,14,24,177,109,66,24,14,8,4,2,40,288,288];


max_man_tap_x=357; max_man_tap_y=336; min_man_tap_x=38; min_man_tap_y=28;

relacion_x_tap= abs(max_man_tap_x - min_man_tap_x);
relacion_y_tap= abs(max_man_tap_y - min_man_tap_y);

relacion_xy_tap=relacion_y_tap/relacion_x_tap



[man_XX_tap, man_YY_tap ] = XYpointscalemean(man_XX_tap, man_YY_tap);

% Initialize arrays to store fits and goodness-of-fit.
fitresult_man_XX_tap = cell( 1, 1 );
gof_man_XX_tap = struct( 'sse', cell( 1, 1 ), ...
    'rsquare', [], 'dfe', [], 'adjrsquare', [], 'rmse', [] );

% Fit: 'polynomial6'.
[xData, yData] = prepareCurveData( man_XX_tap, man_YY_tap*relacion_xy_tap );

% Set up fittype and options.
ft = fittype( 'poly6' );

% Fit model to data.
[fitresult_man_XX_tap{1}, gof_man_XX_tap(1)] = fit( xData, yData, ft);

% % [points] = newXYpointcurveselection(XX)
% 
% [YY] = YY(points);
% [XX] = XX(points);

% Compare against validation data.
[xValidation, yValidation] = prepareCurveData(XX, YY*relacion_xy_ori);
residual = yValidation - fitresult_man_XX_tap{1}( xValidation );
nNaN = nnz( isnan( residual ) );
residual(isnan( residual )) = [];
sse_tap = norm( residual )^2;
rmse_tap = sqrt( sse_tap/length( residual ) );


% Create a figure for the plots.
figure(2);

% Plot fit with data.

subplot( 1, 1, 1 );
h = plot( fitresult_man_XX_tap{1}, xData, yData);

% plot(h, 'Parent', handles.axes2);
% Add validation data to plot.
hold on
h(end+1) = plot( xValidation, yValidation, 'g.', 'MarkerFaceColor', 'w');
hold off
legend( h, 'mandibula plantilla triangular', 'polynomial6', 'modelo dental ', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
% xlabel( 'man_XX_squ', 'Interpreter', 'none' );
% ylabel( 'man_YY_squ', 'Interpreter', 'none' );
grid off

saveas(figure(2),'man_XX_tap.png');

IM_squ=imread('man_XX_tap.png');
imshow(IM_squ, 'Parent', handles.axes3);

myString = sprintf( 'TRIANGULAR \n SSE : %f\n RMSE : %f\n', sse_tap, rmse_tap);
set(handles.text2, 'String', myString);
%% OVALADA



man_XX_ova = [301,68,102,139,170,260,253,239,220,197,534,500,465,407,386,367,347,341,434,31,569];
man_YY_ova = [0,170,104,64,39,2,4,8,14,23,170,104,64,23,14,8,4,2,39,276,276];

% 
% 
max_man_ova_x=357;
max_man_ova_y=369;
min_man_ova_x=46;
min_man_ova_y=27;

relacion_x_ova= abs(max_man_ova_x - min_man_ova_x);
relacion_y_ova= abs(max_man_ova_y - min_man_ova_y);

relacion_xy_ova=relacion_y_ova/relacion_x_ova



[man_XX_ova, man_YY_ova ] = XYpointscalemean(man_XX_ova, man_YY_ova);

% Initialize arrays to store fits and goodness-of-fit.
fitresult_man_XX_tap = cell( 1, 1 );
gof_man_XX_tap = struct( 'sse', cell( 1, 1 ), ...
    'rsquare', [], 'dfe', [], 'adjrsquare', [], 'rmse', [] );

% Fit: 'polynomial6'.
[xData, yData] = prepareCurveData( man_XX_ova, man_YY_ova*relacion_xy_ova );

% Set up fittype and options.
ft = fittype( 'poly6' );

% Fit model to data.
[fitresult_man_XX_ova{1}, gof_man_XX_ova(1)] = fit( xData, yData, ft);

% % [points] = newXYpointcurveselection(XX)
% 
% [YY] = YY(points);
% [XX] = XX(points);

% Compare against validation data.
[xValidation, yValidation] = prepareCurveData(XX, YY*relacion_xy_ori);
residual = yValidation - fitresult_man_XX_ova{1}( xValidation );
nNaN = nnz( isnan( residual ) );
residual(isnan( residual )) = [];
sse_ova = norm( residual )^2;
rmse_ova = sqrt( sse_ova/length( residual ) );

% Create a figure for the plots.
figure(3);

% Plot fit with data.

subplot( 1, 1, 1 );
h = plot( fitresult_man_XX_ova{1}, xData, yData);

% plot(h, 'Parent', handles.axes2);
% Add validation data to plot.
hold on
h(end+1) = plot( xValidation, yValidation, 'g.', 'MarkerFaceColor', 'w');
hold off
legend( h, 'mandibula plantilla ovalda', 'polynomial6', 'modelo ', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
% xlabel( 'man_XX_squ', 'Interpreter', 'none' );
% ylabel( 'man_YY_squ', 'Interpreter', 'none' );
grid off

saveas(figure(2),'man_XX_ova.png');

IM_ova=imread('man_XX_ova.png');
imshow(IM_ova, 'Parent', handles.axes4);

myString = sprintf( 'OVALADA \n SSE : %f\n RMSE : %f\n', sse_ova, rmse_ova);
set(handles.text1, 'String', myString);



%% 
        else 
        end
        
    case 2
      
        model = uigetfile('*.ply;*.pcd;');
        if ~isequal(model, 0)
        A=pcread(model);
        pcshow(A);
        
        xi=A.Location(:,1);
        yi=A.Location(:,2);
        zi=A.Location(:,3);
        
        maxzi=max(zi);
        zi= maxzi-zi;
        end

end


% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
     set(hObject,'BackgroundColor','white');
end


set(hObject, 'String', {'Mandibular(poly6)', 'Maxilar(poly6)'});


% % --- Executes on button press in pushbutton2.
% function pushbutton2_Callback(hObject, eventdata, handles)
% % hObject    handle to pushbutton2 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of pushbutton2
% 
% 
% % --- Executes on button press in cargar.
% function cargar_Callback(hObject, eventdata, handles)
% % hObject    handle to cargar (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% 
% % --- If Enable == 'on', executes on mouse press in 5 pixel border.
% % --- Otherwise, executes on mouse press in 5 pixel border or over text4.
% function text4_ButtonDownFcn(hObject, eventdata, handles)
% % hObject    handle to text4 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
