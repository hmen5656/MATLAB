function varargout = rlcdevresi(varargin)
%RLCDEVRESI MATLAB code file for rlcdevresi.fig
%      RLCDEVRESI, by itself, creates a new RLCDEVRESI or raises the existing
%      singleton*.
%
%      H = RLCDEVRESI returns the handle to a new RLCDEVRESI or the handle to
%      the existing singleton*.
%
%      RLCDEVRESI('Property','Value',...) creates a new RLCDEVRESI using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to rlcdevresi_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      RLCDEVRESI('CALLBACK') and RLCDEVRESI('CALLBACK',hObject,...) call the
%      local function named CALLBACK in RLCDEVRESI.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help rlcdevresi

% Last Modified by GUIDE v2.5 11-Dec-2017 00:38:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @rlcdevresi_OpeningFcn, ...
                   'gui_OutputFcn',  @rlcdevresi_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before rlcdevresi is made visible.
function rlcdevresi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)
% Choose default command line output for rlcdevresi
handles.output = hObject;


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes rlcdevresi wait for user response (see UIRESUME)
% uiwait(handles.figure1);
% --- Outputs from this function are returned to the command line.

function varargout = rlcdevresi_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in hesapla.
function hesapla_Callback(hObject, eventdata, handles)
% hObject    handle to hesapla (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global hepsi
hepsi=0;
kokler(handles,0);

function editl_Callback(hObject, eventdata, handles)
% hObject    handle to editl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editl as text
%        str2double(get(hObject,'String')) returns contents of editl as a double


% --- Executes during object creation, after setting all properties.
function editl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editc_Callback(hObject, eventdata, handles)
% hObject    handle to editc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editc as text
%        str2double(get(hObject,'String')) returns contents of editc as a double


% --- Executes during object creation, after setting all properties.
function editc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in mh.
function mh_Callback(hObject, eventdata, handles)
% hObject    handle to mh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uh,'Value',0.0);
set(handles.nh,'Value',0.0);
% Hint: get(hObject,'Value') returns toggle state of mh


% --- Executes on button press in uh.
function uh_Callback(hObject, eventdata, handles)
% hObject    handle to uh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.mh,'Value',0.0);
    set(handles.nh,'Value',0.0);
% Hint: get(hObject,'Value') returns toggle state of uh


% --- Executes on button press in mf.
function mf_Callback(hObject, eventdata, handles)
% hObject    handle to mf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.nf,'Value',0.0);
    set(handles.uf,'Value',0.0);
% Hint: get(hObject,'Value') returns toggle state of mf


% --- Executes on button press in uf.
function uf_Callback(hObject, eventdata, handles)
% hObject    handle to uf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 set(handles.mf,'Value',0.0);
    set(handles.nf,'Value',0.0);
% Hint: get(hObject,'Value') returns toggle state of uf



function editv0_Callback(hObject, eventdata, handles)
% hObject    handle to editv0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editv0 as text
%        str2double(get(hObject,'String')) returns contents of editv0 as a double


% --- Executes during object creation, after setting all properties.
function editv0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editv0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editi0_Callback(hObject, eventdata, handles)
% hObject    handle to editi0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editi0 as text
%        str2double(get(hObject,'String')) returns contents of editi0 as a double


% --- Executes during object creation, after setting all properties.
function editi0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editi0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editr_Callback(hObject, eventdata, handles)
% hObject    handle to editr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editr as text
%        str2double(get(hObject,'String')) returns contents of editr as a double


% --- Executes during object creation, after setting all properties.
function editr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in kohm.
function kohm_Callback(hObject, eventdata, handles)
% hObject    handle to kohm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of kohm


% --- Executes on button press in nh.
function nh_Callback(hObject, eventdata, handles)
% hObject    handle to nh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uh,'Value',0.0);
    set(handles.mh,'Value',0.0);
% Hint: get(hObject,'Value') returns toggle state of nh


% --- Executes on button press in nf.
function nf_Callback(hObject, eventdata, handles)
% hObject    handle to nf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uf,'Value',0.0);
set(handles.mf,'Value',0.0);
% Hint: get(hObject,'Value') returns toggle state of nf


% --- Executes on button press in ma.
function ma_Callback(hObject, eventdata, handles)
% hObject    handle to ma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ma


% --- Executes on button press in hesaplatum.
function hesaplatum_Callback(hObject, eventdata, handles)
% hObject    handle to hesaplatum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global hepsi
hepsi=1;
kokler(handles,hepsi);
