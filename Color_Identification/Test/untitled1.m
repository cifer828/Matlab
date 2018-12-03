function varargout = untitled1(varargin)
% UNTITLED1 MATLAB code for untitled1.fig
%      UNTITLED1, by itself, creates a new UNTITLED1 or raises the existing
%      singleton*.
%
%      H = UNTITLED1 returns the handle to a new UNTITLED1 or the handle to
%      the existing singleton*.
%
%      UNTITLED1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED1.M with the given input arguments.
%
%      UNTITLED1('Property','Value',...) creates a new UNTITLED1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled1

% Last Modified by GUIDE v2.5 07-Jun-2017 10:45:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;

global idx;
global output;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled1_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled1_OutputFcn, ...
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



% --- Executes just before untitled1 is made visible.
function untitled1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled1 (see VARARGIN)

% Choose default command line output for untitled1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set(handles.axes1,'visible','off')
set(handles.axes2,'visible','off')
set(handles.axes3,'visible','off')
set(handles.axes4,'visible','off')
set(handles.axes5,'visible','off')
set(handles.axes6,'visible','off')
set(handles.axes11,'visible','off')
set(handles.axes12,'visible','off')
set(handles.axes13,'visible','off')
set(handles.axes14,'visible','off')
set(handles.text_multi,'visible','off')
set(handles.button_multi_1,'visible','off')
set(handles.button_multi_2,'visible','off')
set(handles.button_multi_3,'visible','off')
set(handles.button_multi_4,'visible','off')
set(handles.button_multi_5,'visible','off')
set(handles.button_multi_end,'visible','off')

% UIWAIT makes untitled1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


function g = rgb2g(I ,rgb_w)
g = I(:,:,1) * rgb_w(1) + I(:,:,2) * rgb_w(2) + I(:,:,3) * rgb_w(3);


% --- generate images in axis 
function generate_image(handles,I,rgb_w,n_idx,ud_idx)
%rgb_w --- check every member in rgb_w >=0 & <= 1
%n_idx --- button idx n_idx = 1,2,3,4,5
%ud_idx --- uo?down ud_idx = 1,2
idx = [4 5 6 13 14 ; 1 2 3 11 12];

if sum((rgb_w>=0)&(rgb_w<=1)) == 3
    img = rgb2g(I,rgb_w);
    if ud_idx ==1
        eval(['axes(handles.axes',num2str(idx(ud_idx,n_idx)),');'])
        imshow(I,[]);
    else
        eval(['axes(handles.axes',num2str(idx(ud_idx,n_idx)),');'])
        imshow(img,[]);
    end
else
    return
end


% --- Outputs from this function are returned to the command line.
function varargout = untitled1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in button_A.
function button_A_Callback(hObject, eventdata, handles)
% hObject    handle to button_A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global idx output A  img_ s_l
idx = idx + 1;
choice =1;
rgb_w_now = generate_rgb_weights(A,s_l);
output = [output ; idx , choice , reshape(rgb_w_now' , [1 15]) , s_l];

[status , A , s_l] = change_rules(choice , rgb_w_now(choice , : ) , s_l);
handles.text_StepLength.String = num2str(s_l)
generate_five_images(handles,img_,A,s_l)


% --- Executes on button press in button_B.
function button_B_Callback(hObject, eventdata, handles)
% hObject    handle to button_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global idx output A  img_ s_l
idx = idx + 1;
choice =2;
rgb_w_now = generate_rgb_weights(A,s_l);
output = [output ; idx , choice , reshape(rgb_w_now' , [1 15]) , s_l];

[status , A , s_l] = change_rules(choice , rgb_w_now(choice , : ) , s_l);
handles.text_StepLength.String = num2str(s_l)
generate_five_images(handles,img_,A,s_l)

% --- Executes on button press in button_C.
function button_C_Callback(hObject, eventdata, handles)
% hObject    handle to button_C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global idx output A  img_ s_l
idx = idx + 1;
choice =3;
rgb_w_now = generate_rgb_weights(A,s_l);
output = [output ; idx , choice , reshape(rgb_w_now' , [1 15]) , s_l];

[status , A , s_l] = change_rules(choice , rgb_w_now(choice , : ) , s_l);
handles.text_StepLength.String = num2str(s_l)
generate_five_images(handles,img_,A,s_l)

% --- Executes on button press in button_D.
function button_D_Callback(hObject, eventdata, handles)
% hObject    handle to button_C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global idx output A  img_ s_l
idx = idx + 1;
choice =4;
rgb_w_now = generate_rgb_weights(A,s_l);
output = [output ; idx , choice , reshape(rgb_w_now' , [1 15]) , s_l];

[status , A , s_l] = change_rules(choice , rgb_w_now(choice , : ) , s_l);
handles.text_StepLength.String = num2str(s_l)
generate_five_images(handles,img_,A,s_l)


% --- Executes on button press in button_E.
function button_E_Callback(hObject, eventdata, handles)
% hObject    handle to button_C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global idx output A  img_ s_l
idx = idx + 1;
choice =5;
rgb_w_now = generate_rgb_weights(A,s_l);
output = [output ; idx , choice , reshape(rgb_w_now' , [1 15]) , s_l];

[status , A , s_l] = change_rules(choice , rgb_w_now(choice , : ) , s_l);
handles.text_StepLength.String = num2str(s_l)
generate_five_images(handles,img_,A,s_l)


% --- based on standard rgb_w generate five grey images
function generate_five_images(handles,I,st_rgb_w,sl)
rgb_w_new = generate_rgb_weights(st_rgb_w,sl);
generate_image(handles,I,st_rgb_w,1,2);
generate_image(handles,I,st_rgb_w + [sl , sl , -2 * sl],2,2);
generate_image(handles,I,st_rgb_w + [-sl , sl , 0],3,2);
generate_image(handles,I,st_rgb_w + [sl , -sl , 0],4,2);
generate_image(handles,I,st_rgb_w + [-sl , -sl , 2 * sl],5,2);

% --- based on standard rgb_w generate five rgb_w_new
function rgb_w_new = generate_rgb_weights(st_rgb_w,sl)
rgb_w_new = [st_rgb_w ; st_rgb_w + [sl , sl , -2 * sl] ; st_rgb_w + [-sl , sl , 0] ; st_rgb_w + [sl , -sl , 0] ; st_rgb_w + [-sl , -sl , 2 * sl]];



% --- change rules
function [status , st_rgb_w_new , sl_new] = change_rules(choice , rgb_w_now , sl)
% choice can  be 1,2,3,4,5, but almost all should be 1
% sl --- step length
% status --- 0 - the experiment is over  1 - the wxperiment should continue
% rgb_w_now  length(choice)*3

st_rgb_w_new = mean(rgb_w_now);
if length(choice) > 1
    status = 0;
    sl_new = sl; 
else
    status = 1;
    st_rgb_w_new = rgb_w_now;
    if choice == 1
        sl_new = sl / 2;
    else
        sl_new = sl;
    end
end


 
% --- Executes on button press in button_strat.
function button_strat_Callback(hObject, eventdata, handles)
% hObject    handle to button_strat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s_l %step length
global idx output A B C img_A img_B img_C img_ i_r i_g i_b
[filename,pathname]=uigetfile({'*.jpg';'*.bmp';'*.gif'},'选择图片');
img_ = imread([pathname,filename]);
idx = 0;
output = [];
s_l = 0.2;

% i_r = 10;
% i_g = 200;
% i_b = 100;
i_ = [i_r i_g i_b];


% generate first row images
for i = 1 : 5
    generate_image(handles,img_,[0 0 1],i,1);
end

%generate second row images
A = [0.299 , 0.587 , 0.114];
generate_five_images(handles,img_,A,s_l)
% generate_image(handles,img_,A,1,2);
% generate_image(handles,img_,A,1,2);
% generate_image(handles,img_,A,1,2);
% generate_image(handles,img_,A,1,2);
% generate_image(handles,img_,A,1,2);









% --- Executes on button press in button_close.
function button_close_Callback(hObject, eventdata, handles)
% hObject    handle to button_close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global idx output A B C img_A img_B img_C img_
file_name = int2str(clock);
file_name(ismember(file_name,' ')) = [];
button=questdlg('是否确认关闭','关闭确认','是','否','是');
if strcmp(button,'是')
    close(gcf)
    delete(hObject);
    output_ = output;
    save([file_name,'.mat'],'output_')
else
    return;
end



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



function edit_R_Callback(hObject, eventdata, handles)
% hObject    handle to edit_R (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_R as text
%        str2double(get(hObject,'String')) returns contents of edit_R as a double
global i_r
i_r = str2num(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function edit_R_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_R (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_G_Callback(hObject, eventdata, handles)
% hObject    handle to edit_G (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_G as text
%        str2double(get(hObject,'String')) returns contents of edit_G as a double
global i_g 
i_g = str2num(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function edit_G_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_G (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_B_Callback(hObject, eventdata, handles)
% hObject    handle to edit_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_B as text
%        str2double(get(hObject,'String')) returns contents of edit_B as a double
global i_b
i_b = str2num(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function edit_B_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function axes5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes5

% --- Executes during object creation, after setting all properties.
function axes6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes6


% --- Executes on button press in button_Save.
function button_Save_Callback(hObject, eventdata, handles)
% hObject    handle to button_Save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global idx output A B C D E img_A img_B img_C img_D img_E img_
file_name = int2str(clock);
file_name(ismember(file_name,' ')) = [];
save([file_name,'.mat'],'output_')


% --- Executes on button press in button_multi_start.
function button_multi_start_Callback(hObject, eventdata, handles)
% hObject    handle to button_multi_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text_multi,'visible','on')
set(handles.button_multi_1,'visible','on')
set(handles.button_multi_2,'visible','on')
set(handles.button_multi_3,'visible','on')
set(handles.button_multi_4,'visible','on')
set(handles.button_multi_5,'visible','on')
set(handles.button_multi_end,'visible','on')

global multi_choice idx
multi_choice = [];
idx = idx + 1;
for i = 1 : 5
    eval(['handles.button_multi_' , num2str(i) , '.Enable = ''on'';'])  
end



% --- Executes on button press in button_multi_1.
function button_multi_1_Callback(hObject, eventdata, handles)
% hObject    handle to button_multi_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global idx output A  img_ s_l multi_choice
choice = 1;
eval(['handles.button_multi_' , num2str(choice) , '.Enable = ''off'';'])
multi_choice = [multi_choice ; choice];
rgb_w_now = generate_rgb_weights(A,s_l);
output = [output ; idx , choice , reshape(rgb_w_now' , [1 15]) , s_l];
handles.text_StepLength.String = num2str(s_l);

% --- Executes on button press in button_multi_2.
function button_multi_2_Callback(hObject, eventdata, handles)
% hObject    handle to button_multi_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global idx output A  img_ s_l multi_choice
choice = 2;
eval(['handles.button_multi_' , num2str(choice) , '.Enable = ''off'';'])
multi_choice = [multi_choice ; choice];
rgb_w_now = generate_rgb_weights(A,s_l);
output = [output ; idx , choice , reshape(rgb_w_now' , [1 15]) , s_l];
handles.text_StepLength.String = num2str(s_l);

% --- Executes on button press in button_multi_3.
function button_multi_3_Callback(hObject, eventdata, handles)
% hObject    handle to button_multi_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global idx output A  img_ s_l multi_choice
choice = 3;
eval(['handles.button_multi_' , num2str(choice) , '.Enable = ''off'';'])
multi_choice = [multi_choice ; choice];
rgb_w_now = generate_rgb_weights(A,s_l);
output = [output ; idx , choice , reshape(rgb_w_now' , [1 15]) , s_l];
handles.text_StepLength.String = num2str(s_l);

% --- Executes on button press in button_multi_4.
function button_multi_4_Callback(hObject, eventdata, handles)
% hObject    handle to button_multi_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global idx output A  img_ s_l multi_choice
choice = 4;
eval(['handles.button_multi_' , num2str(choice) , '.Enable = ''off'';'])
multi_choice = [multi_choice ; choice];
rgb_w_now = generate_rgb_weights(A,s_l);
output = [output ; idx , choice , reshape(rgb_w_now' , [1 15]) , s_l];
handles.text_StepLength.String = num2str(s_l);

% --- Executes on button press in button_multi_5.
function button_multi_5_Callback(hObject, eventdata, handles)
% hObject    handle to button_multi_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global idx output A  img_ s_l multi_choice
choice = 5;
eval(['handles.button_multi_' , num2str(choice) , '.Enable = ''off'';'])
multi_choice = [multi_choice ; choice];
rgb_w_now = generate_rgb_weights(A,s_l);
output = [output ; idx , choice , reshape(rgb_w_now' , [1 15]) , s_l];
handles.text_StepLength.String = num2str(s_l);

% --- Executes on button press in button_multi_end.
function button_multi_end_Callback(hObject, eventdata, handles)
% hObject    handle to button_multi_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global idx output A  img_ s_l multi_choice

button=questdlg('是否确认选择结束','关闭确认','是','否','是');

rgb_w_now = generate_rgb_weights(A,s_l);
[status , A , s_l] = change_rules(multi_choice , rgb_w_now(multi_choice , : ) , s_l);
rgb_w_now = generate_rgb_weights(A,s_l);
output = [output ; idx , 0 , reshape(rgb_w_now' , [1 15]) , s_l];
if strcmp(button,'是')
    return
else
    return;
end
