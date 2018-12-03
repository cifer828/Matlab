function varargout = obj_count(varargin)
% OBJ_COUNT MATLAB code for obj_count.fig
%      OBJ_COUNT, by itself, creates a new OBJ_COUNT or raises the existing
%      singleton*.
%
%      H = OBJ_COUNT returns the handle to a new OBJ_COUNT or the handle to
%      the existing singleton*.
%
%      OBJ_COUNT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OBJ_COUNT.M with the given input arguments.
%
%      OBJ_COUNT('Property','Value',...) creates a new OBJ_COUNT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before obj_count_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to obj_count_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help obj_count

% Last Modified by GUIDE v2.5 05-Jan-2018 12:40:22

% Begin initialization code - DO NOT EDIT
global result;
global idx;
global data;
global part_name
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @obj_count_OpeningFcn, ...
                   'gui_OutputFcn',  @obj_count_OutputFcn, ...
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


% --- Executes just before obj_count is made visible.
function obj_count_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to obj_count (see VARARGIN)

% Choose default command line output for obj_count
global result idx
handles.output = hObject;
result = zeros(4,4);
idx = 1;
% Update handles structure
guidata(hObject, handles);
% UIWAIT makes obj_count wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = obj_count_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function callback( hObject,handles)
global result idx part_name data
name = get(hObject,'Tag');
row = str2num(name(4));
col = str2num(name(5));
result(row,col) = result(row,col) + 1;
set(hObject,'string',num2str(result(row,col)));
if idx ~= 100
    num = data{idx, 3};
    img_name = ['D:\data\', part_name, '\img\', num2str(num), '.jpg'];
    I = imread(img_name);
    imshow(I);
    type = {'机动车','非机动车','行人'};
    set(handles.text11, 'String', ['num:', num2str(idx)]);
    set(handles.text12, 'String', type{data{idx, 7}});
end
idx = idx + 1;
save('result.mat','result');

% --- Executes on button press in btn11.
function btn11_Callback(hObject, eventdata, handles)
% hObject    handle to btn11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
callback(hObject, handles)
    


% --- Executes on button press in btn12.
function btn12_Callback(hObject, eventdata, handles)
% hObject    handle to btn12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
callback(hObject, handles)

% --- Executes on button press in btn13.
function btn13_Callback(hObject, eventdata, handles)
% hObject    handle to btn13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
callback(hObject, handles)

% --- Executes on button press in btn21.
function btn21_Callback(hObject, eventdata, handles)
% hObject    handle to btn21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
callback(hObject, handles)

% --- Executes on button press in btn22.
function btn22_Callback(hObject, eventdata, handles)
% hObject    handle to btn22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
callback(hObject, handles)

% --- Executes on button press in btn23.
function btn23_Callback(hObject, eventdata, handles)
% hObject    handle to btn23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
callback(hObject, handles)

% --- Executes on button press in btn31.
function btn31_Callback(hObject, eventdata, handles)
% hObject    handle to btn31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
callback(hObject, handles)

% --- Executes on button press in btn32.
function btn32_Callback(hObject, eventdata, handles)
% hObject    handle to btn32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
callback(hObject, handles)

% --- Executes on button press in btn33.
function btn33_Callback(hObject, eventdata, handles)
% hObject    handle to btn33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
callback(hObject, handles)

% --- Executes on button press in bnt41.
function bnt41_Callback(hObject, eventdata, handles)
% hObject    handle to bnt41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
callback(hObject, handles)

% --- Executes on button press in btn42.
function btn42_Callback(hObject, eventdata, handles)
% hObject    handle to btn42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
callback(hObject, handles)

% --- Executes on button press in btn43.
function btn43_Callback(hObject, eventdata, handles)
% hObject    handle to btn43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
callback(hObject, handles)

% --- Executes on button press in btn14.
function btn14_Callback(hObject, eventdata, handles)
% hObject    handle to btn14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
callback(hObject, handles)

% --- Executes on button press in btn24.
function btn24_Callback(hObject, eventdata, handles)
% hObject    handle to btn24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
callback(hObject, handles)

% --- Executes on button press in btn34.
function btn34_Callback(hObject, eventdata, handles)
% hObject    handle to btn34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
callback(hObject, handles)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


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


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data part_name idx
filename = get(handles.edit1, 'String');
load(filename);
data = data_cell;
part_name = regexp(filename, '_clean', 'split');
part_name = part_name{1, 1};
num = data{idx, 3};
img_name = ['D:\data\', part_name, '\img\', num2str(num), '.jpg'];
I = imread(img_name);
imshow(I);
type = {'机动车','非机动车','行人'};
set(handles.text11, 'String', ['num:', num2str(idx)]);
set(handles.text12, 'String', type{data{idx, 7}});
idx = idx +1;
