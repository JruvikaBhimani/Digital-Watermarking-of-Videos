function varargout = GUI(varargin)
clc;

% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 15-Apr-2012 18:09:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

set(handles.vurl,'string','');
set(handles.wurl,'string','');

% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function vurl_Callback(hObject, eventdata, handles)
% hObject    handle to vurl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vurl as text
%        str2double(get(hObject,'String')) returns contents of vurl as a double


% --- Executes during object creation, after setting all properties.
function vurl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vurl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in vbrowse.
function vbrowse_Callback(hObject, eventdata, handles)
% hObject    handle to vbrowse (see GCBO)
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
   
    set(handles.vurl,'String',b);
    
end



function wurl_Callback(hObject, eventdata, handles)
% hObject    handle to wurl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of wurl as text
%        str2double(get(hObject,'String')) returns contents of wurl as a double


% --- Executes during object creation, after setting all properties.
function wurl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wurl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in wbrowse.
function wbrowse_Callback(hObject, eventdata, handles)
% hObject    handle to wbrowse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname]=uigetfile({'*.jpg;*.jpeg;*.jpe;*.jfif','JPEG(*.jpg;*.jpeg;*.jpe;*.jfif)';...
    '*.png','PNG(*.png)';...
    '*.bmp','BMP(*.bmp)';...
    '*.gif','GIF(*.gif)';...
    '*.tif;*.tiff','TIFF(*.tif;*.tiff)'},...
    'open','C:\Users\HP\Desktop\',100,100);
%disp(pathname);
%disp(filename);
 a=pathname;
    b=strcat(a,filename);
if(filename==0)
    msgbox('Watermark Image not selected');
    uiwait();
else
   
    set(handles.wurl,'String',b);
    
end


% --- Executes on button press in ok.
function ok_Callback(hObject, eventdata, handles)
% hObject    handle to ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA
a1=get(handles.vurl,'String');
b1=get(handles.wurl,'String'); 
if(isempty(a1))
    msgbox('Enter Video Location','modal');
else
    if(isempty(b1))
        msgbox('Enter Watermark Location','modal');
    else
        set(GUI,'Visible','off');
        f=readFrames(a1);
        %msgbox('done..');
        flag=1;           
        if(~f)
           set(GUI,'visible','on');
        else
            while(flag)
                answers = inputdlg('Enter PASSKEY','',1);
                if(~isempty(answers))
                    key=str2num(answers{1});
                    if(~isempty(key))
                        question_ans = questdlg(strcat('Confirm PASSKEY: ',answers),...
                        'Confirmation','OK','Cancel','Cancel');
                        if (strcmpi(question_ans,'OK'))
                           % set(GUI,'visible','off');
                            value=pseudo(b1,key);
                            Frame_Process(value,a1);
                            flag=0;
                        end
                    else
                        msgbox('Enter NUMERIC key only!','ERROR!','error','modal');
                        uiwait();
                    end
                else
                    flag=0;
                end
            end
        end
    end
end
close GUI;


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.vurl,'string','');
set(handles.wurl,'string','');


% --- Executes on button press in cancel.
function cancel_Callback(hObject, eventdata, handles)
% hObject    handle to cancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close all force;  %some error cums while closing. have to handle it...
