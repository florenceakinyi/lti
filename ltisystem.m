function varargout = ltisystem(varargin)
% LTISYSTEM MATLAB code for ltisystem.fig
%      LTISYSTEM, by itself, creates a new LTISYSTEM or raises the existing
%      singleton*.
%
%      H = LTISYSTEM returns the handle to a new LTISYSTEM or the handle to
%      the existing singleton*.
%
%      LTISYSTEM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LTISYSTEM.M with the given input arguments.
%
%      LTISYSTEM('Property','Value',...) creates a new LTISYSTEM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ltisystem_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ltisystem_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ltisystem

% Last Modified by GUIDE v2.5 30-Nov-2021 22:15:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ltisystem_OpeningFcn, ...
                   'gui_OutputFcn',  @ltisystem_OutputFcn, ...
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


% --- Executes just before ltisystem is made visible.
function ltisystem_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ltisystem (see VARARGIN)

% Choose default command line output for ltisystem
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ltisystem wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ltisystem_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double

num = textscan(get(hObject, 'string'), '%f');
handles.num=cell2mat(num);
guidata(hObject, handles)

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

sys=tf(handles.num, handles.den);
handles.sys=sys;
T=evalc('sys');
set(handles.text6, 'String', T);

function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
den = textscan(get(hObject, 'string'), '%f');
handles.den=cell2mat(den);
guidata(hObject, handles)

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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
switch handles.response
    case '1'
        cla;
        tx=length(impulse(handles.num, handles.den));
        t=0:tx-1; ft=zeros(1,tx);   %create zero line
        impulse(handles.num, handles.den); 
        hold on
        plot(t, ft, 'r')
        hold off;
        grid;
        
    case '2'
        cla;
        tx=length(step(handles.num, handles.den));
        t=0:tx-1; ft=zeros(1,tx);   %create zero line
        step(handles.num, handles.den); 
        hold on
        plot(t, ft, 'r')
        hold off;
        grid;
    case '3'
        cla;
        [~, t0]=step(tf(handles.num, handles.den));
        T=t0(end);
        den1=[handles.den 0];
        [y, t]=step(tf(handles.num, den1));
        I=find(t==T);
        plot(t(1:I), t(1:I), t(1:I), 'r'); 
        xlim([0. T]);
        title('Ramp Response');
        xlabel('Time(seconds)');
        ylabel('Amplitude');
        grid;
        
    case '4'
        cla;
        bode(handles.num, handles.den);
        grid
    case '5'
        cla
        rlocus(handles.num, handles.den);
        axis equal
    case '6'
        cla;
        nyquist(handles.num, handles.den); 
        axis equal
    case '7'
        cla;
        nichols(handles.num, handles.den);
        grid;
    case '8'
        cla;
        sys=tf(handles.num, handles.den);
        pzmap(sys);
        h=findobj(gca, 'Type', 'Line');
        h(2).LineWidth=3; h(2).MarkerSize=15; h(2).Color='b';
        h(3).LineWidth=3; h(3).MarkerSize=20; h(2).Color='r';
end
guidata(hObject, handles);
      

% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup1 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
switch get(eventdata.NewValue, 'Tag')   %Get tag of the selected object.
    case 'radiobutton1'
        handles.response = '1';
    case 'radiobutton2'
        handles.response = '2';
    case 'radiobutton3'
        handles.response = '3'; 
    case 'radiobutton4'
        handles.response = '4';
    case 'radiobutton5'
        handles.response = '5';
    case 'radiobutton6'
        handles.response = '7';
    case 'radiobutton8'
        handles.response = '8'; 
end
guidata(hObject, handles);
