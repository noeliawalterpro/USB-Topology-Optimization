
function varargout = topUSB_GUI(varargin)
% TOPUSB_GUI MATLAB code for topUSB_GUI.fig
%      TOPUSB_GUI, by itself, creates a new TOPUSB_GUI or raises the existing
%      singleton*.
%
%      H = TOPUSB_GUI returns the handle to a new TOPUSB_GUI or the handle to
%      the existing singleton*.
%
%      TOPUSB_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TOPUSB_GUI.M with the given input arguments.
%
%      TOPUSB_GUI('Property','Value',...) creates a new TOPUSB_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before topUSB_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to topUSB_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
 
    % Create pop-up menu    
    
set(0,'DefaultFigureWindowStyle','normal')
% Edit the above text to modify the response to help topUSB_GUI
% Last Modified by GUIDE v2.5 12-Dec-2018 17:30:53
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @topUSB_GUI_OpeningFcn, ...
    'gui_OutputFcn',  @topUSB_GUI_OutputFcn, ...
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


% --- Executes just before topUSB_GUI is made visible.
function topUSB_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to topUSB_GUI (see VARARGIN)

% Choose default command line output for topUSB_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes topUSB_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = topUSB_GUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to METODOS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nmenu1=get(handles.popupmenu4,'value') ;
            
if nmenu1==1; METODO1=1;nmetodo1='SIMP';end
if nmenu1==2; METODO1=2;nmetodo1='ESO';end
if nmenu1==3; METODO1=3;nmetodo1='BESO';end

set(handles.edit25,'string',num2str(METODO1));
METODO1
% --- Executes on selection change in METODOS.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to METODOS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nmenu2=get(handles.popupmenu3,'value') ;

if nmenu2==1; METODO2=1;nmetodo2='M1_OT_2D_SIMP_topUSB';end
if nmenu2==3; METODO2=3;nmetodo2='M3_OT_2D_ESO_topUSB';end
if nmenu2==2; METODO2=2;nmetodo2='M2_OT_2D_HOMab_topUSB';end
if nmenu2==4; METODO2=4;nmetodo2='M4_OT_2D_BESO2_topUSB';end

set(handles.edit26,'string',num2str(METODO2));
METODO2
% --- Executes on selection change in METODOS.
function METODOS_Callback(hObject, eventdata, handles)
% hObject    handle to METODOS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nmenu=get(handles.METODOS,'value') ;

if nmenu==1; METODO=0;end
if nmenu==2; METODO=1;end
if nmenu==3; METODO=2;end
if nmenu==4; METODO=3;end
if nmenu==5; METODO=4;end
if nmenu==6; METODO=200;...
set(handles.popupmenu4,'enable','on')
set(handles.popupmenu3,'enable','on')
set(handles.edit25,'enable','on')
set(handles.edit26,'enable','on')
else
    set(handles.popupmenu4,'enable','off')
set(handles.popupmenu3,'enable','off')
set(handles.edit25,'enable','off')
set(handles.edit26,'enable','off')
nmetodo1='';
nmetodo2='';
end
if nmenu==7; METODO=100;Met=0;end
set(handles.edit12,'string',num2str(METODO));
METODO

% Hints: contents = cellstr(get(hObject,'String')) returns METODOS contents as cell array
%        contents{get(hObject,'Value')} returns selected item from METODOS


% --- Executes during object creation, after setting all properties.
function METODOS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to METODOS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double

% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, ~)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function PROBLEMAS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, ~, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 disp('no expresion')
CASO='';
nmetodo='';
tStart = tic;
tStartB = tic;
nproblema='';
vollopp=0;
ACTPAS=0;       % activos y pasivos
FIJOS=0;        % elementos fijos
NODOS=0;
ft=2;
displayflag=1;
if (get(handles.radiobutton4,'Value') == get(hObject,'Max'))
    %display('Selected');
    GRAF_ViewDesign=1; % view design CON PROBLEMAS
else
    GRAF_ViewDesign=0; % view design CON PROBLEMAS
end

if (get(handles.radiobutton4,'Value') == get(hObject,'Max'))
    %display('Selected');
    edo_pdef=1    % Estado plano de deformaciones 1 ACTIVO
else
    edo_pdef=0   % Estado plano de deformaciones 1 ACTIVO
end
if (get(handles.radiobutton3,'Value') == get(hObject,'Max'))
    %display('Selected');
    RESULTADOS=1    % 1 Deformada 0 INDEFORMADA
else
    RESULTADOS=0   % 1 Deformada 0 INDEFORMADA	%display('Not selected');
end

if (get(handles.radiobutton2,'Value') == get(hObject,'Max'))
    %display('Selected');
    GRAF_D=1    % 1 Deformada 0 INDEFORMADA
else
    GRAF_D=0   % 1 Deformada 0 INDEFORMADA	%display('Not selected');
end

if (get(handles.radiobutton1,'Value') == get(hObject,'Max'))
    %display('Selected');
    DEFORMADA=1;    % 1 Deformada 0 INDEFORMADA
else
    DEFORMADA=0   % 1 Deformada 0 INDEFORMADA	%display('Not selected');
end
if (get(handles.radiobutton7,'Value') == get(hObject,'Max'))
    %display('Selected');
    IMAGENES=1     % EXPORTAR IMAGENES 1 ACTIVO 0 INACTIVO
    
else
    IMAGENES=0     % EXPORTAR IMAGENES 1 ACTIVO 0 INACTIVO
    %display('Not selected');
end
nmenu1=get(handles.popupmenu4,'value') ;
            
if nmenu1==1; METODO1=1;nmetodo1='M1_OT_2D_SIMP_topUSB';end
if nmenu1==2; METODO1=2;nmetodo1='M3_OT_2D_ESO_topUSB';end
if nmenu1==3; METODO1=3;nmetodo1='M4_OT_2D_BESO2_topUSB';end


nmenu2=get(handles.popupmenu3,'value') ;

if nmenu2==1; METODO2=1;nmetodo2='M1_OT_2D_SIMP_topUSB';end
if nmenu2==3; METODO2=3;nmetodo2='M3_OT_2D_ESO_topUSB';end
if nmenu2==2; METODO2=2;nmetodo2='M2_OT_2D_HOMab_topUSB';end
if nmenu2==4; METODO2=4;nmetodo2='M4_OT_2D_BESO2_topUSB';end



nelx=str2double(get(handles.edit4,'string'));
nely=str2double(get(handles.edit3,'string'));
lx=str2double(get(handles.edit10,'string'));
%%
HOM=0;
tolx=1;
F1=str2double(get(handles.edit8,'string'));
rmin=str2double(get(handles.edit9,'string'));
volfrac=str2double(get(handles.edit6,'string'));
penal=str2double(get(handles.edit5,'string'));

v=volfrac;
%% problema
PROBLEMA=str2double(get(handles.edit11,'string'));
MALLADO=3;
topUSB_LProblema
nproblema
%% metodo
Met=0;
METODO=str2double(get(handles.edit12,'string'));
%%
if METODO==100;
  ConvergenciaFEM
end
%% Materiales
topUSB_LMateriales

%%
A_2D_topUSB

% to indicate is finish
assignin('base','xPhys',xPhys)
assignin('base','xcl',xcl)
assignin('base','ycl',ycl)
assignin('base','al',al)
assignin('base','bl',bl)


msgbox('Listo')

function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double




function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double





function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
METODO=str2double(get(handles.edit11,'string'));

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double




function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
PROBLEMA=str2double(get(handles.edit12,'string'));

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double




% --- Executes on selection change in PROBLEMAS.
function PROBLEMAS_Callback(hObject, eventdata, handles)

pmenu=get(handles.PROBLEMAS,'value') ;

if pmenu==3; PROBLEMA=str2double(get(handles.edit11,'string'));
else
    pmenu
    if pmenu==1; PROBLEMA=1;end
    if pmenu==2; PROBLEMA=2;end
    
    set(handles.edit11,'string',num2str(PROBLEMA))
end
PROBLEMA
%topUSB_Mallado
MALLADO=0;
nelx=str2double(get(handles.edit4,'string'));
nely=str2double(get(handles.edit3,'string'));
lx=str2double(get(handles.edit10,'string'));
topUSB_LProblema
nproblema

set(handles.edit4,'string',num2str(nelx));
set(handles.edit3,'string',num2str(nely));
set(handles.edit10,'string',num2str(lx));

nelx=str2double(get(handles.edit4,'string'));
nely=str2double(get(handles.edit3,'string'));

x= ones(nely,nelx);
design=x;
m1=x-1;
m2=x-1;
xPhys=x;
HU=0;


eval(nproblema);
if HU==1
    xPhys=design.*xPhys +m2;
else
    xPhys=design.*xPhys+m1;
end
xini=xPhys;
assignin('base','xPhys',xPhys)
colormap(gray);     imagesc(1-xPhys); daspect([1 1 1]);
axis off
disp('grafica')
% hObject    handle to PROBLEMAS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns PROBLEMAS contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PROBLEMAS


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1

% --- Executes on button press in radiobutton9.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton9

% --- Executes on button press in radiobutton9.
function radiobutton4_Callback(~, eventdata, handles)
% hObject    handle to radiobutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton9


% --- Executes on button press in radiobutton9.
function radiobutton9_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton9


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
PROBLEMA=str2double(get(handles.edit11,'string'))

%topUSB_Mallado
%topUSB_Mallado
MALLADO=0;

nelx=str2double(get(handles.edit4,'string'));
nely=str2double(get(handles.edit3,'string'));
lx=nelx;
topUSB_LProblema
nproblema

set(handles.edit4,'string',num2str(nelx));
set(handles.edit3,'string',num2str(nely));
set(handles.edit10,'string',num2str(lx));

nelx=str2double(get(handles.edit4,'string'));
nely=str2double(get(handles.edit3,'string'));
%%
x= ones(nely,nelx);
design=x;
m1=x-1;
m2=x-1;
xPhys=x;
HU=0;
MALLADO=0;
eval(nproblema)

if HU==1
    xPhys=design.*xPhys +m2;
else
    xPhys=design.*xPhys+m1;
end
xini=xPhys;
%set(0, 'visible','on');
colormap(gray);     imagesc(1-xPhys); daspect([1 1 1]);
axis off
disp('grafica')



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit19_Callback(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit19 as text
%        str2double(get(hObject,'String')) returns contents of edit19 as a double


% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit20 as text
%        str2double(get(hObject,'String')) returns contents of edit20 as a double


% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit23_Callback(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit23 as text
%        str2double(get(hObject,'String')) returns contents of edit23 as a double


% --- Executes during object creation, after setting all properties.
function edit23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit24_Callback(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit24 as text
%        str2double(get(hObject,'String')) returns contents of edit24 as a double


% --- Executes during object creation, after setting all properties.
function edit24_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nelx=str2double(get(handles.edit4,'string'));
nely=str2double(get(handles.edit3,'string'));
lx=str2double(get(handles.edit10,'string'));
paso=lx/nelx;
jj=0;

for j=1:nelx
    for i=1:nely
        
        jj=jj+1;
        %
        node(jj,1)=i+(j-1)*(nely+1);
        node(jj,2)=j*(nely+1)+i;
        node(jj,3)=j*(nely+1)+i+1;
        node(jj,4)=i+(j-1)*(nely+1)+1;%
    end
end

xi=0:paso:nelx*paso;
yi=0:paso:nely*paso;
[XI,YI]=meshgrid(xi,yi);
XI=XI(:);
YI=YI(:);
xe=XI(node);
ye=YI(node);
loop=0;

xPhys=evalin('base','xPhys');
 xx=xe;yy=ye;
cc=1-xPhys;
%topUSB_graf2(xPhys,paso,nelx,nely,xx,yy,cc)
topUSB_struct
 colormap(bone); 
 disp('estructura')



function edit25_Callback(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit25 as text
%        str2double(get(hObject,'String')) returns contents of edit25 as a double


% --- Executes during object creation, after setting all properties.
function edit25_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit26_Callback(hObject, eventdata, handles)
% hObject    handle to edit26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit26 as text
%        str2double(get(hObject,'String')) returns contents of edit26 as a double


% --- Executes during object creation, after setting all properties.
function edit26_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
