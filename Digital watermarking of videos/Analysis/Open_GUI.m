function varargout = Open_GUI(varargin)
clc;
% OPEN_GUI MATLAB code for Open_GUI.fig
%      OPEN_GUI, by itself, creates a new OPEN_GUI or raises the existing
%      singleton*.
%
%      H = OPEN_GUI returns the handle to a new OPEN_GUI or the handle to
%      the existing singleton*.
%
%      OPEN_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OPEN_GUI.M with the given input arguments.
%
%      OPEN_GUI('Property','Value',...) creates a new OPEN_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Open_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Open_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Open_GUI

% Last Modified by GUIDE v2.5 21-Apr-2012 00:14:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Open_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Open_GUI_OutputFcn, ...
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


% --- Executes just before Open_GUI is made visible.
function Open_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Open_GUI (see VARARGIN)

% Choose default command line output for Open_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Open_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.org_vid,'string','');
set(handles.w_vid,'string','');
set(handles.org_logo,'string','');
set(handles.e_logo,'string','');

% --- Outputs from this function are returned to the command line.
function varargout = Open_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function org_vid_Callback(hObject, eventdata, handles)
% hObject    handle to org_vid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of org_vid as text
%        str2double(get(hObject,'String')) returns contents of org_vid as a double


% --- Executes during object creation, after setting all properties.
function org_vid_CreateFcn(hObject, eventdata, handles)
% hObject    handle to org_vid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function w_vid_Callback(hObject, eventdata, handles)
% hObject    handle to w_vid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w_vid as text
%        str2double(get(hObject,'String')) returns contents of w_vid as a double


% --- Executes during object creation, after setting all properties.
function w_vid_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w_vid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function org_logo_Callback(hObject, eventdata, handles)
% hObject    handle to org_logo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of org_logo as text
%        str2double(get(hObject,'String')) returns contents of org_logo as a double


% --- Executes during object creation, after setting all properties.
function org_logo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to org_logo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function e_logo_Callback(hObject, eventdata, handles)
% hObject    handle to e_logo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e_logo as text
%        str2double(get(hObject,'String')) returns contents of e_logo as a double


% --- Executes during object creation, after setting all properties.
function e_logo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e_logo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in analyse.
function analyse_Callback(hObject, eventdata, handles)
% hObject    handle to analyse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

path_f1=get(handles.org_vid,'String');
path_f2=get(handles.w_vid,'String');
path_l1=get(handles.org_logo,'String');
path_l2=get(handles.e_logo,'String');

if( isempty(path_f1) && isempty(path_f2) && isempty(path_l1) && isempty(path_l2) )
    msgbox('Select file','modal');
else
    
    set(Open_GUI,'visible','off');
    psnr=double(Frame_analysis(path_f1,path_f2));
   % psnr=18.76;
   
     p=num2str(psnr);
   
    nc=double(extracted_correlation(path_l1,path_l2));
    n=num2str(nc);
    msg=strcat('PSNR: ',p ,...
        '    NC: ',n);
   msgbox(msg,'Analysis','modal');
   %inputdlg({'PSNR: ','NC: '}, 'Analysis', [1 10], {int2str(psnr),int2str(nc)});
    %Report('work',psnr,nc);
end
%close force all;

% --- Executes on button press in cancel.
function cancel_Callback(hObject, eventdata, handles)
% hObject    handle to cancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close force all;

% --- Executes on button press in of_browse.
function of_browse_Callback(hObject, eventdata, handles)
% hObject    handle to of_browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[pathname]=uigetdir('C:\Users\HP\Desktop\','Open Directory');
 a=pathname;
   
if(pathname==0)
    msgbox('Location not selected');
    uiwait();
else   
    set(handles.org_vid,'String',a);    
end

% --- Executes on button press in wf_browse.
function wf_browse_Callback(hObject, eventdata, handles)
% hObject    handle to wf_browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[pathname]=uigetdir('C:\Users\HP\Desktop\','Open Directory');
 a=pathname;
   
if(pathname==0)
    msgbox('Location not selected');
    uiwait();
else   
    set(handles.w_vid,'String',a);    
end

% --- Executes on button press in ol_browse.
function ol_browse_Callback(hObject, eventdata, handles)
% hObject    handle to ol_browse (see GCBO)
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
    msgbox('Orginal Logo not selected');
    uiwait();
else
   
    set(handles.org_logo,'String',b);
    
end

% --- Executes on button press in el_browse.
function el_browse_Callback(hObject, eventdata, handles)
% hObject    handle to el_browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[pathname]=uigetdir('C:\Users\HP\Desktop\','opendir');

 a=pathname;
    %b=strcat(a,filename);
if(a==0)
    msgbox('extracted Logo not selected');
    uiwait();
else
   
    set(handles.e_logo,'String',a);
    
end

