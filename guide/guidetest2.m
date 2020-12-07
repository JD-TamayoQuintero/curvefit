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
        zi=A.Location(:,3);
        
        minzi=min(zi); zi= minzi-zi;
        maxzi=max(zi); zi= maxzi-zi;
        
        Image = range3Dto2D( xi,yi,zi, 0.5);
        Image=im2double(Image); Imagenor = normalizar(Image);
        imshow(Imagenor, 'Parent', handles.axes8); % imagen de rango
        colormap('jet');
        level=0.7; % para orthoada dilatar o no usar umbral

        BW = im2bw(Imagenor,level); %#ok<IM2BW>
%       BW = imrotate(BW,-90);
        imshow(BW, 'Parent', handles.axes9);
%       BW1= imcomplement(BW);
        DT= bwdist((BW));
        DTnor=normalizar(DT);
        imshow(DTnor, 'Parent', handles.axes10);
        tempDT = MEDT2(DT);
        [m, n]=size(DT);
        EDT=zeros(m,n);
        
        EDT(10:m-10, 10:n/2)=  tempDT(10:m-10,10:n/2);
        
        imshow(tempDT, 'Parent', handles.axes11);
%         imshow(EDT, 'Parent', handles.axes12);
        colormap('jet');

        [Xli, Yli]=XYpoints(EDT,255);
       
        b1 = Yli\Xli;
        


            if b1<0.0
            angulo = atan(b1)*180 +180
            else
            angulo = atan(b1)*180 -180
            end

        BWaling = imrotate(BW, angulo);
        imshow(BWaling, 'Parent', handles.axes12);
%        tempang=-90-angulo;

        
%         plot(Xli,Yli,'.', 'Parent', handles.axes12);

%         plot(handles.axes3, Xli, Yli,'.');
%         plot(handles.axes4,sin(1:0.01:25.99));
        else 
     print('')
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
