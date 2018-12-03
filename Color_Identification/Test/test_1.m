function varargout = test_1(varargin)
% TEST_1 MATLAB code for test_1.fig
%      TEST_1, by itself, creates a new TEST_1 or raises the existing
%      singleton*.
%
%      H = TEST_1 returns the handle to a new TEST_1 or the handle to
%      the existing singleton*.
%
%      TEST_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEST_1.M with the given input arguments.
%
%      TEST_1('Property','Value',...) creates a new TEST_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before test_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to test_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help test_1

% Last Modified by GUIDE v2.5 11-Jun-2017 12:46:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @test_1_OpeningFcn, ...
    'gui_OutputFcn',  @test_1_OutputFcn, ...
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


% --- Executes just before test_1 is made visible.
function test_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to test_1 (see VARARGIN)

% Choose default command line output for test_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

set(handles.axes1,'visible','off')
set(handles.axes2,'visible','off')
set(handles.axes3,'visible','off')
set(handles.axes4,'visible','off')
set(handles.axes5,'visible','off')
set(handles.axes6,'visible','off')
set(handles.axes7,'visible','off')
set(handles.axes8,'visible','off')
set(handles.axes9,'visible','off')
set(handles.axes10,'visible','off')
set(handles.axes11,'visible','off')
set(handles.axes12,'visible','off')
set(handles.axes13,'visible','off')
set(handles.axes14,'visible','off')
set(handles.axes15,'visible','off')
set(handles.axes16,'visible','off')
set(handles.axes17,'visible','off')
set(handles.axes18,'visible','off')
set(handles.axes19,'visible','off')
set(handles.axes20,'visible','off')
set(handles.axes21,'visible','off')
set(handles.axes22,'visible','off')
set(handles.axes23,'visible','off')
set(handles.axes24,'visible','off')
set(handles.axes25,'visible','off')
set(handles.axes26,'visible','off')
set(handles.axes27,'visible','off')
set(handles.axes28,'visible','off')
set(handles.axes29,'visible','off')
set(handles.axes30,'visible','off')
set(handles.axes31,'visible','off')
set(handles.axes32,'visible','off')
set(handles.axes33,'visible','off')
set(handles.axes34,'visible','off')
set(handles.axes35,'visible','off')
set(handles.axes36,'visible','off')
set(handles.axes37,'visible','off')
set(handles.axes38,'visible','off')
set(handles.axes39,'visible','off')
set(handles.axes40,'visible','off')
for i = 1 : 20
    eval(['handles.button_' , num2str(i) , '.Enable = ''off'';'])
end



% UIWAIT makes test_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = test_1_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- generate origin color in 20 axes
function generate_origin_color(rgb,handles)
for i = 0 : 3
    for j = 1 : 5
        for k = 1 : 3
            I(:,:,k) = rgb(k) * ones(100,200);
        end
        eval(['axes(handles.axes',num2str(i * 10 + j),');'])
        I = uint8(I);
        imshow(I,[]);
    end
end

% --- generate compare color in 20 axes
function generate_compare_color(rgb,handles)
%rgb  20*3
idx = 0;
for i = 0 : 3
    for j = 6 : 10
        idx = idx + 1;
        for k = 1 : 3
            I(:,:,k) = rgb(idx , k) * ones(100,200);
        end
        eval(['axes(handles.axes',num2str(i * 10 + j),');'])
        I = uint8(I);
        imshow(I,[]);
    end
end

% --- generate compare rgb in 20 axes
function rgb_new = generate_compare_rgb(oringin_rgb , r)
% oringin_rgb  standard RGB
% r  radius for generating
i = 0;
while i < 20
    rgb_(1,1) = r * (2 * rand(1) - 1);
    rgb_(1,2) = sqrt(r ^ 2 - rgb_(1) ^ 2) * (2 * rand(1) - 1);
    rgb_(1,3) = sqrt(r ^ 2 - rgb_(1) ^ 2 - rgb_(2) ^ 2) * (2 * rand(1) - 1);
    if (floor(oringin_rgb + rgb_)<0)|(ceil(oringin_rgb + rgb_)>255)
        continue;
    else
        i = i + 1;
        rgb_new(i,:) = oringin_rgb + rgb_;
        rgb_ = [];
    end
end


% --- Executes on button press in button_Start.
function button_Start_Callback(hObject, eventdata, handles)
% hObject    handle to button_Start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global st_rgb radius rgb output status step origin_r idx
button=questdlg('是否已正确填写RGB值,半径和步长','填写确认','是','否','是');
if strcmp(button,'是')
    idx = 1;
    output = [];
    radius = str2double(handles.edit_radius.String);
    handles.text_radius.String = num2str(radius);
    origin_r = radius;
    step = str2double(handles.edit_step.String);
    handles.text_step.String = num2str(step);
    status = zeros(1,20);
    st_rgb = [str2double(handles.edit_R.String) str2double(handles.edit_G.String) str2double(handles.edit_B.String)];
    generate_origin_color(st_rgb,handles)
    rgb = generate_compare_rgb(st_rgb , radius);
    generate_compare_color(rgb,handles)
    for i = 1 : 20
        eval(['handles.button_' , num2str(i) , '.Enable = ''on'';'])
    end
else
    return;
end


% --- Executes on button press in button_Save.
function button_Save_Callback(hObject, eventdata, handles)
% hObject    handle to button_Save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global output
file_name = int2str(clock);
file_name(ismember(file_name,' ')) = [];
output(: , 3 : 5) = uint8(output(: , 3 : 5));
save([file_name,'.mat'],'output')

% --- Executes on button press in button_Close.
function button_Close_Callback(hObject, eventdata, handles)
% hObject    handle to button_Close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global output
file_name = int2str(clock);
file_name(ismember(file_name,' ')) = [];
button=questdlg('是否确认关闭','关闭确认','是','否','是');
if strcmp(button,'是')
    close(gcf)
    delete(hObject);
    output(: , 3 : 5) = uint8(output(: , 3 : 5));
    save([file_name,'.mat'],'output')
else
    return;
end



function edit_R_Callback(hObject, eventdata, handles)
% hObject    handle to edit_R (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_R as text
%        str2double(get(hObject,'String')) returns contents of edit_R as a double


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


% --- Executes on button press in button_1.
function button_1_Callback(hObject, eventdata, handles)
% hObject    handle to button_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global status
choice = 1;
status(choice) = 1;
eval(['handles.button_' , num2str(choice) , '.Enable = ''off'';'])




% --- Executes on button press in button_2.
function button_2_Callback(hObject, eventdata, handles)
% hObject    handle to button_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global status
choice = 2;
status(choice) = 1;
eval(['handles.button_' , num2str(choice) , '.Enable = ''off'';'])

% --- Executes on button press in button_3.
function button_3_Callback(hObject, eventdata, handles)
% hObject    handle to button_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global status
choice = 3;
status(choice) = 1;
eval(['handles.button_' , num2str(choice) , '.Enable = ''off'';'])

% --- Executes on button press in button_4.
function button_4_Callback(hObject, eventdata, handles)
% hObject    handle to button_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global status
choice = 4;
status(choice) = 1;
eval(['handles.button_' , num2str(choice) , '.Enable = ''off'';'])

% --- Executes on button press in button_5.
function button_5_Callback(hObject, eventdata, handles)
% hObject    handle to button_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global status
choice = 5;
status(choice) = 1;
eval(['handles.button_' , num2str(choice) , '.Enable = ''off'';'])

% --- Executes on button press in button_6.
function button_6_Callback(hObject, eventdata, handles)
% hObject    handle to button_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global status
choice = 6;
status(choice) = 1;
eval(['handles.button_' , num2str(choice) , '.Enable = ''off'';'])

% --- Executes on button press in button_7.
function button_7_Callback(hObject, eventdata, handles)
% hObject    handle to button_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global status
choice = 7;
status(choice) = 1;
eval(['handles.button_' , num2str(choice) , '.Enable = ''off'';'])

% --- Executes on button press in button_8.
function button_8_Callback(hObject, eventdata, handles)
% hObject    handle to button_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global status
choice = 8;
status(choice) = 1;
eval(['handles.button_' , num2str(choice) , '.Enable = ''off'';'])

% --- Executes on button press in button_9.
function button_9_Callback(hObject, eventdata, handles)
% hObject    handle to button_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global status
choice = 9;
status(choice) = 1;
eval(['handles.button_' , num2str(choice) , '.Enable = ''off'';'])

% --- Executes on button press in button_10.
function button_10_Callback(hObject, eventdata, handles)
% hObject    handle to button_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global status
choice = 10;
status(choice) = 1;
eval(['handles.button_' , num2str(choice) , '.Enable = ''off'';'])

% --- Executes on button press in button_11.
function button_11_Callback(hObject, eventdata, handles)
% hObject    handle to button_11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global status
choice = 11;
status(choice) = 1;
eval(['handles.button_' , num2str(choice) , '.Enable = ''off'';'])

% --- Executes on button press in button_12.
function button_12_Callback(hObject, eventdata, handles)
% hObject    handle to button_12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global status
choice = 12;
status(choice) = 1;
eval(['handles.button_' , num2str(choice) , '.Enable = ''off'';'])

% --- Executes on button press in button_13.
function button_13_Callback(hObject, eventdata, handles)
% hObject    handle to button_13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global status
choice = 13;
status(choice) = 1;
eval(['handles.button_' , num2str(choice) , '.Enable = ''off'';'])

% --- Executes on button press in button_14.
function button_14_Callback(hObject, eventdata, handles)
% hObject    handle to button_14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global status
choice = 14;
status(choice) = 1;
eval(['handles.button_' , num2str(choice) , '.Enable = ''off'';'])

% --- Executes on button press in button_15.
function button_15_Callback(hObject, eventdata, handles)
% hObject    handle to button_15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global status
choice = 15;
status(choice) = 1;
eval(['handles.button_' , num2str(choice) , '.Enable = ''off'';'])

% --- Executes on button press in button_16.
function button_16_Callback(hObject, eventdata, handles)
% hObject    handle to button_16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global status
choice = 16;
status(choice) = 1;
eval(['handles.button_' , num2str(choice) , '.Enable = ''off'';'])

% --- Executes on button press in button_17.
function button_17_Callback(hObject, eventdata, handles)
% hObject    handle to button_17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global status
choice = 17;
status(choice) = 1;
eval(['handles.button_' , num2str(choice) , '.Enable = ''off'';'])

% --- Executes on button press in button_18.
function button_18_Callback(hObject, eventdata, handles)
% hObject    handle to button_18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global status
choice = 18;
status(choice) = 1;
eval(['handles.button_' , num2str(choice) , '.Enable = ''off'';'])

% --- Executes on button press in button_19.
function button_19_Callback(hObject, eventdata, handles)
% hObject    handle to button_19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global status
choice = 19;
status(choice) = 1;
eval(['handles.button_' , num2str(choice) , '.Enable = ''off'';'])

% --- Executes on button press in button_20.
function button_20_Callback(hObject, eventdata, handles)
% hObject    handle to button_20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global status
choice = 20;
status(choice) = 1;
eval(['handles.button_' , num2str(choice) , '.Enable = ''off'';'])

% --- Executes on button press in button_NextTurn.
function button_NextTurn_Callback(hObject, eventdata, handles)
% hObject    handle to button_NextTurn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global st_rgb radius rgb output status step origin_r idx
button=questdlg('是否已结束本轮选择','填写确认','是','否','是');
if strcmp(button,'是')
    [r_new , step_new , origin_r] = change_radius(radius,step,status,origin_r);
    output =[output;[idx * ones(20,1) status' rgb radius * ones(20,1) repmat(st_rgb,20,1)]];
    if (r_new == 1)
        file_name = int2str(clock);
        file_name(ismember(file_name,' ')) = [];
        output(: , 3 : 5) = uint8(output(: , 3 : 5));
        save([file_name,'.mat'],'output')
        errordlg('这波实验可以了1','恭喜')
    else if (r_new == radius)
            file_name = int2str(clock);
            file_name(ismember(file_name,' ')) = [];
            output(: , 3 : 5) = uint8(output(: , 3 : 5));
            save([file_name,'.mat'],'output')
            errordlg('这波实验可以了','恭喜')
        else 
            radius = r_new;
            idx = idx + 1;
            step = step_new;
            st_rgb = [str2double(handles.edit_R.String) str2double(handles.edit_G.String) str2double(handles.edit_B.String)];
            generate_origin_color(st_rgb,handles)
            rgb = generate_compare_rgb(st_rgb , radius);
            generate_compare_color(rgb,handles)
            for i = 1 : 20
                eval(['handles.button_' , num2str(i) , '.Enable = ''on'';'])
            end
            status = zeros(1,20);
            handles.text_radius.String = num2str(radius);
            
            handles.text_step.String = num2str(step);
            
        end
    end
else
    return;
end


% --- change radius and step
function [r_new,s_new,or_new] = change_radius(r,st,sta,o_r)
%sta --- status
%st --- step
%o_r --- origin_r
or_new = o_r;
if (r == o_r)
    if(sum(sta)<=5)
        r_new = 2 * r;
        s_new = 2 * st;
        or_new = o_r * 2;
    else if (sum(sta)<=10)
            r_new = r ;
            s_new = st;
        else 
            r_new = r - st;
            s_new = st;
        end
    end
else  if(sum(sta)<=10)
        r_new = r;
        s_new = st;
    else
        r_new = r - st;
        s_new = st;
    end
end
if r_new < 1
    r_new = 1;
end



function edit_radius_Callback(hObject, eventdata, handles)
% hObject    handle to edit_radius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_radius as text
%        str2double(get(hObject,'String')) returns contents of edit_radius as a double


% --- Executes during object creation, after setting all properties.
function edit_radius_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_radius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_step_Callback(hObject, eventdata, handles)
% hObject    handle to edit_step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_step as text
%        str2double(get(hObject,'String')) returns contents of edit_step as a double


% --- Executes during object creation, after setting all properties.
function edit_step_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
