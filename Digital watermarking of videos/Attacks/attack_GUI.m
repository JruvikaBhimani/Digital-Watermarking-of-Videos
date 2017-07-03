function varargout = attack_GUI(varargin)

clc;
% ATTACK_GUI MATLAB code for attack_GUI.fig
%      ATTACK_GUI, by itself, creates a new ATTACK_GUI or raises the existing
%      singleton*.
%
%      H = ATTACK_GUI returns the handle to a new ATTACK_GUI or the handle to
%      the existing singleton*.
%
%      ATTACK_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ATTACK_GUI.M with the given input arguments.
%
%      ATTACK_GUI('Property','Value',...) creates a new ATTACK_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before attack_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to attack_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help attack_GUI

% Last Modified by GUIDE v2.5 25-Apr-2012 13:31:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @attack_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @attack_GUI_OutputFcn, ...
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


% --- Executes just before attack_GUI is made visible.
function attack_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to attack_GUI (see VARARGIN)

% Choose default command line output for attack_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes attack_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.v_url,'String','');
set(handles.v,'STring','');
set(handles.radiobutton1,'value',0);
set(handles.radiobutton2,'value',0);
set(handles.radiobutton3,'value',0);
set(handles.radiobutton4,'value',0);

% --- Outputs from this function are returned to the command line.
function varargout = attack_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function v_url_Callback(hObject, eventdata, handles)
% hObject    handle to v_url (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of v_url as text
%        str2double(get(hObject,'String')) returns contents of v_url as a double


% --- Executes during object creation, after setting all properties.
function v_url_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v_url (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in browse.
function browse_Callback(hObject, eventdata, handles)
% hObject    handle to browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname]=uigetfile({'*.avi;*.wmv;*.mp4','Others(*.avi;*.wmv;*.mp4)';...
    '*.mpg;*.mpeg','MPEG Videos(*.mpg,*.mpeg)'},...    
    'open','C:\Users\HP\Desktop\',100,100);
disp(pathname);
disp(filename);
 a=pathname;
    b=strcat(a,filename);
if(filename==0)
    msgbox('Video not selected');
    uiwait();
else
   
    set(handles.v_url,'String',b);
    
end

% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in ok.
function ok_Callback(hObject, eventdata, handles)
% hObject    handle to ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.v_url,'String');

if(isempty(a))
    msgbox('Enter Video Location');
else
    f1=get(handles.radiobutton1,'value');
    f2=get(handles.radiobutton2,'value');
    f3=get(handles.radiobutton3,'value');
    f4=get(handles.radiobutton4,'value');
    val1=get(handles.v,'String');
    val=str2num(val1);
    val=round(val);
         set(attack_GUI,'visible','off');
        if f1 && val<=50
            readFrames(a); 
            Cropping(val,1)
            frame2vid;
        elseif f2 && val<=50
            readFrames(a); 
            Cropping(val,2);
            frame2vid;
        elseif f3 && val<=50
            readFrames(a); 
            Cropping(val,3);
            frame2vid;
        elseif f4 && val<=50
            readFrames(a); 
            Cropping(val,4);
            frame2vid;
               
        else
        msgbox('Select Cropping Region');
       end
end
% --- Executes on button press in cancel.
function cancel_Callback(hObject, eventdata, handles)
% hObject    handle to cancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close force all;



function v_Callback(hObject, eventdata, handles)
% hObject    handle to v (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of v as text
%        str2double(get(hObject,'String')) returns contents of v as a double


% --- Executes during object creation, after setting all properties.
function v_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
