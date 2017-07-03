function varargout = Receiver_GUI(varargin)
clc;
% Receiver_GUI MATLAB code for Receiver_GUI.fig
%      Receiver_GUI, by itself, creates a new Receiver_GUI or raises the existing
%      singleton*.
%
%      H = Receiver_GUI returns the handle to a new Receiver_GUI or the handle to
%      the existing singleton*.
%
%      Receiver_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in Receiver_GUI.M with the given input arguments.
%
%      Receiver_GUI('Property','Value',...) creates a new Receiver_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Receiver_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Receiver_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Receiver_GUI

% Last Modified by GUIDE v2.5 18-Apr-2012 10:22:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Receiver_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Receiver_GUI_OutputFcn, ...
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


% --- Executes just before Receiver_GUI is made visible.
function Receiver_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Receiver_GUI (see VARARGIN)

% Choose default command line output for Receiver_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Receiver_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

set(handles.vw_url,'string','');
set(handles.mv_url,'string','');
set(handles.logo_url,'string','');
% --- Outputs from this function are returned to the command line.
function varargout = Receiver_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function vw_url_Callback(hObject, eventdata, handles)
% hObject    handle to vw_url (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vw_url as text
%        str2double(get(hObject,'String')) returns contents of vw_url as a double


% --- Executes during object creation, after setting all properties.
function vw_url_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vw_url (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function w_url_Callback(hObject, eventdata, handles)
% hObject    handle to w_url (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w_url as text
%        str2double(get(hObject,'String')) returns contents of w_url as a double


% --- Executes during object creation, after setting all properties.
function w_url_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w_url (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in vw_browse.
function vw_browse_Callback(hObject, eventdata, handles)
% hObject    handle to vw_browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname]=uigetfile({'*.avi;*.wmv;*.mp4','Others(*.avi;*.wmv;*.mp4)';...
    '*.mpg;*.mpeg','MPEG Videos(*.mpg,*.mpeg)'},...    
    'open','C:\Users\HP\Desktop\',100,100);
 a=pathname;
    b=strcat(a,filename);
if(filename==0)
    msgbox('Video not selected');
    uiwait();
else   
    set(handles.vw_url,'String',b);    
end

% --- Executes on button press in w_browse.
function w_browse_Callback(hObject, eventdata, handles)
% hObject    handle to w_browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in ok.
function ok_Callback(hObject, eventdata, handles)
% hObject    handle to ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
o=get(handles.vw_url,'string');
m=get(handles.mv_url,'string');
n=get(handles.logo_url,'string');
if ~isempty(o) && ~isempty(m) && ~isempty(n)
    set(Receiver_GUI,'Visible','off');
    readFrames_original(o);
    numFrames=readFrames_modulated(m);
   % numFrames=100;
    extraction(numFrames,n);
else
    msgbox('File not selected','modal');
end

close force all;
    
    

% --- Executes on button press in cancel.
function cancel_Callback(hObject, eventdata, handles)
% hObject    handle to cancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all force;



function mv_url_Callback(hObject, eventdata, handles)
% hObject    handle to mv_url (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mv_url as text
%        str2double(get(hObject,'String')) returns contents of mv_url as a double


% --- Executes during object creation, after setting all properties.
function mv_url_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mv_url (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in mv_browse.
function mv_browse_Callback(hObject, eventdata, handles)
% hObject    handle to mv_browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname]=uigetfile({'*.avi;*.wmv;*.mp4','Others(*.avi;*.wmv;*.mp4)';...
    '*.mpg;*.mpeg','MPEG Videos(*.mpg,*.mpeg)'},...    
    'open','C:\Users\HP\Desktop\',100,100);
 a=pathname;
    b=strcat(a,filename);
if(filename==0)
    msgbox('Video not selected');
    uiwait();
else   
    set(handles.mv_url,'String',b);    
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


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function logo_url_Callback(hObject, eventdata, handles)
% hObject    handle to logo_url (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of logo_url as text
%        str2double(get(hObject,'String')) returns contents of logo_url as a double


% --- Executes during object creation, after setting all properties.
function logo_url_CreateFcn(hObject, eventdata, handles)
% hObject    handle to logo_url (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in l_browse.
function l_browse_Callback(hObject, eventdata, handles)
% hObject    handle to l_browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename,pathname]=uigetfile({'*.jpg;*.jpeg;*.jpe;*.jfif','JPEG(*.jpg;*.jpeg;*.jpe;*.jfif)';...
    '*.png','PNG(*.png)';...
    '*.bmp','BMP(*.bmp)';...
    '*.gif','GIF(*.gif)';...
    '*.tif;*.tiff','TIFF(*.tif;*.tiff)'},...
    'open','C:\Users\HP\Desktop\',100,100);
 a=pathname;
 b=strcat(a,filename);
if(filename==0)
    msgbox('Logo not selected');
    uiwait();
else   
    set(handles.logo_url,'String',b);    
end
