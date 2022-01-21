function varargout = latih(varargin)
% LATIH MATLAB code for latih.fig
%      LATIH, by itself, creates a new LATIH or raises the existing
%      singleton*.
%
%      H = LATIH returns the handle to a new LATIH or the handle to
%      the existing singleton*.
%
%      LATIH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LATIH.M with the given input arguments.
%
%      LATIH('Property','Value',...) creates a new LATIH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before latih_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to latih_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help latih

% Last Modified by GUIDE v2.5 17-Apr-2021 23:18:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @latih_OpeningFcn, ...
                   'gui_OutputFcn',  @latih_OutputFcn, ...
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


% --- Executes just before latih is made visible.
function latih_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to latih (see VARARGIN)

% Choose default command line output for latih
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes latih wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = latih_OutputFcn(hObject, eventdata, handles) 
hback = axes('units','normalized','position',[0 0 1 1]);

uistack(hback,'bottom');

% Load background image and display it

[back map]=imread('bg1.png');

image(back)

colormap(map)
set(hback,'handlevisibility','off','visible','off')
load data/data.mat;
load data/kelas.mat;
bnt=[data kelas];
set( handles.tbl_data, 'Data', bnt)
% Get default command line output from handles structure
varargout{1} = handles.output;

% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edV_Callback(hObject, eventdata, handles)
% hObject    handle to edV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edV as text
%        str2double(get(hObject,'String')) returns contents of edV as a double


% --- Executes during object creation, after setting all properties.
function edV_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edS_Callback(hObject, eventdata, handles)
% hObject    handle to edS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edS as text
%        str2double(get(hObject,'String')) returns contents of edS as a double


% --- Executes during object creation, after setting all properties.
function edS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edH_Callback(hObject, eventdata, handles)
% hObject    handle to edH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edH as text
%        str2double(get(hObject,'String')) returns contents of edH as a double


% --- Executes during object creation, after setting all properties.
function edH_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edASM_Callback(hObject, eventdata, handles)
% hObject    handle to edASM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edASM as text
%        str2double(get(hObject,'String')) returns contents of edASM as a double


% --- Executes during object creation, after setting all properties.
function edASM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edASM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edCON_Callback(hObject, eventdata, handles)
% hObject    handle to edCON (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edCON as text
%        str2double(get(hObject,'String')) returns contents of edCON as a double


% --- Executes during object creation, after setting all properties.
function edCON_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edCON (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edCOR_Callback(hObject, eventdata, handles)
% hObject    handle to edCOR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edCOR as text
%        str2double(get(hObject,'String')) returns contents of edCOR as a double


% --- Executes during object creation, after setting all properties.
function edCOR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edCOR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edVAR_Callback(hObject, eventdata, handles)
% hObject    handle to edVAR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edVAR as text
%        str2double(get(hObject,'String')) returns contents of edVAR as a double


% --- Executes during object creation, after setting all properties.
function edVAR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edVAR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edIDM_Callback(hObject, eventdata, handles)
% hObject    handle to edIDM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edIDM as text
%        str2double(get(hObject,'String')) returns contents of edIDM as a double


% --- Executes during object creation, after setting all properties.
function edIDM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edIDM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edENT_Callback(hObject, eventdata, handles)
% hObject    handle to edENT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edENT as text
%        str2double(get(hObject,'String')) returns contents of edENT as a double


% --- Executes during object creation, after setting all properties.
function edENT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edENT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global datalatih;
global qH;
global qS;
global qV;
global qR;
global qG;
global qB;
global nASM nCON nCOR nVAR nIDM nENT;
%Mengambil data foto pada disk. file foto disimpan dalam variabel datalatih
[nama_file1,nama_path1]=uigetfile( ...
    {'*.bmp;*.jpg;*.png','File Citra (*.bmp,*.jpg,*.png)';
    '*.bmp','File Bitmap (*.bmp)';...
    '*.jpg','File jpeg (*.jpg)';
    '*.*','Semua File (*.*)'},...
    'Buka File Citra Asli');

if ~isequal(nama_file1,0)
    % jika foto sudah dipilih, imread foto (membaca foto)
    datalatih1=imread(fullfile(nama_path1,nama_file1));
    handles.data1 = imread(fullfile(nama_path1,nama_file1));
    %menampilkan foto pada tampilan halaman
    guidata(hObject,handles);
   
    datalatih=datalatih1;
     axes(handles.axes1);
    imshow(datalatih);
    RGB = datalatih;
    R = RGB(:,:,1);
        G = RGB(:,:,2);
        B = RGB(:,:,3);
        meanR = mean2(R);
        meanG = mean2(G);
        meanB = mean2(B);
        qR=meanR/(meanR + meanG + meanB); %normalisasi
        qG=meanG/(meanR + meanG + meanB);
        qB=meanB/(meanR + meanG + meanB);
    
      
      
        gray = rgb2gray(datalatih);
        [nASM, nCON, nCOR, nVAR, nIDM, nENT] = glcmdata(gray);
        set(handles.edASM,'String',nASM);
        set(handles.edCON,'String',nCON);
        set(handles.edCOR,'String',nCOR);
        set(handles.edVAR,'String',nVAR);
        set(handles.edIDM,'String',nIDM);
        set(handles.edENT,'String',nENT);

    
    
    mydatacontainer=getappdata(0,'datacontainer');
else
    return;
end

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global datalatih;
global qR;
global qG;
global qB;

global nASM nCON nCOR nVAR nIDM nENT;
global siapa;

if(length(datalatih)>0)


    klsbr=siapa-1;
    disp (siapa);
    if(length(siapa)>0)
    if((siapa<2))% jika kelas belum dipilih
        errordlg('Moohon pilih Kelas');
    else
        bnt23= klsbr;
        load 'data/data.mat';
        load 'data/kelas.mat';

        nama_f1=length(kelas);
        nama_f2=int2str(nama_f1+1);
        
        nama_f=strcat('gbr/',nama_f2,'.png');
        

        kelas=[kelas;bnt23]%simpan kelas foto baru
        data=[data;qR qG qB  nASM nCON nCOR nVAR nIDM nENT];
        
        save data/data.mat data
        save data/kelas.mat kelas
        clear all;
        close(latih);
        guidata(latih);
    end
    else
                errordlg('Moohon pilih Kelas');
    end
else
                    errordlg('Moohon pilih Citra');
end
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
clear all;
close(latih);
guidata(depan);
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
global siapa;
siapa = get(hObject,'value');
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
clear all;
close(latih);
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edB_Callback(hObject, eventdata, handles)
% hObject    handle to edB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edB as text
%        str2double(get(hObject,'String')) returns contents of edB as a double


% --- Executes during object creation, after setting all properties.
function edB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edG_Callback(hObject, eventdata, handles)
% hObject    handle to edG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edG as text
%        str2double(get(hObject,'String')) returns contents of edG as a double


% --- Executes during object creation, after setting all properties.
function edG_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edR_Callback(hObject, eventdata, handles)
% hObject    handle to edR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edR as text
%        str2double(get(hObject,'String')) returns contents of edR as a double


% --- Executes during object creation, after setting all properties.
function edR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
