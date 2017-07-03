function [varargout] = Save_Video(varargin)

clc;

% Save_Video MATLAB code for Save_Video.fig
%      Save_Video, by itself, creates a new Save_Video or raises the existing
%      singleton*.
%
%      H = Save_Video returns the handle to a new Save_Video or the handle to
%      the existing singleton*.
%
%      Save_Video('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in Save_Video.M with the given input arguments.
%
%      Save_Video('Property','Value',...) creates a new Save_Video or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Save_Video_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Save_Video_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Save_Video

% Last Modified by GUIDE v2.5 15-Apr-2012 17:49:09

% Begin initialization code - DO NOT EDIT

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Save_Video_OpeningFcn, ...
                   'gui_OutputFcn',  @Save_Video_OutputFcn, ...
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


% --- Executes just before Save_Video is made visible.
function Save_Video_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Save_Video (see VARARGIN)

% Choose default command line output for Save_Video
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Save_Video wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.saveurl,'string','');
set(handles.filename,'string','');

% --- Outputs from this function are returned to the command line.
function varargout = Save_Video_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function saveurl_Callback(hObject, eventdata, handles)
% hObject    handle to saveurl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of saveurl as text
%        str2double(get(hObject,'String')) returns contents of saveurl as a double


% --- Executes during object creation, after setting all properties.

function saveurl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to saveurl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in s_browse.
function s_browse_Callback(hObject, eventdata, handles)
% hObject    handle to s_browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[pathname]=uigetdir('C:\Users\HP\Desktop\','Open Directory');
 a=pathname;
   
if(pathname==0)
    msgbox('Location not selected');
    uiwait();
else   
    set(handles.saveurl,'String',a);    
end

% --- Executes on button press in ok.
function ok_Callback(hObject, eventdata, handles)
% hObject    handle to ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(handles.saveurl,'String');
b=get(handles.filename,'String');

if(isempty(a))
    msgbox('Enter Saving Location','modal');
else
    if(isempty(b))
        msgbox('Enter File Name','modal');
    else                        
        path=strcat(a,'\',b);
        question_ans = questdlg(strcat('Confirm PATH: ',path),...
        'Confirmation','OK','Cancel','Cancel');
             
        if (strcmpi(question_ans,'OK'))
             set(Save_Video,'visible','off');
             frame2vid(path);                
        end
    end
end
close force all;

    
% --- Executes on button press in cancel.
function cancel_Callback(hObject, eventdata, handles)
% hObject    handle to cancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all force;



function filename_Callback(hObject, eventdata, handles)
% hObject    handle to filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of filename as text
%        str2double(get(hObject,'String')) returns contents of filename as a double


% --- Executes during object creation, after setting all properties.
function filename_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in filetype.
function filetype_Callback(hObject, eventdata, handles)
% hObject    handle to filetype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns filetype contents as cell array
%        contents{get(hObject,'Value')} returns selected item from filetype


% --- Executes during object creation, after setting all properties.
function filetype_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filetype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
