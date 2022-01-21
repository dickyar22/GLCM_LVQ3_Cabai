function varargout = GUIpelatihan(varargin)
% GUIPELATIHAN MATLAB code for GUIpelatihan.fig
%      GUIPELATIHAN, by itself, creates a new GUIPELATIHAN or raises the existing
%      singleton*.
%
%      H = GUIPELATIHAN returns the handle to a new GUIPELATIHAN or the handle to
%      the existing singleton*.
%
%      GUIPELATIHAN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIPELATIHAN.M with the given input arguments.
%
%      GUIPELATIHAN('Property','Value',...) creates a new GUIPELATIHAN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUIpelatihan_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUIpelatihan_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUIpelatihan

% Last Modified by GUIDE v2.5 20-Aug-2019 21:23:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUIpelatihan_OpeningFcn, ...
                   'gui_OutputFcn',  @GUIpelatihan_OutputFcn, ...
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


% --- Executes just before GUIpelatihan is made visible.
function GUIpelatihan_OpeningFcn(hObject, eventdata, handles, varargin)
hback = axes('units','normalized','position',[0 0 1 1]);

uistack(hback,'bottom');

% Load background image and display it

[back map]=imread('bg1.png');

image(back)

colormap(map)

% Turn the handlevisibility off so that we dont inadvertently plot into

% the axes again. Also, make the axes invisible

set(hback,'handlevisibility','off','visible','off')

fx = waitbar(0,'Sedang Load Data','Name','Approximating pi...',...
'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');

load data/data.mat;
load data/kelas.mat;
bnt=[data kelas];
delete(fx);
clear fx;
set( handles.tbl_data, 'Data', bnt)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUIpelatihan (see VARARGIN)

% Choose default command line output for GUIpelatihan
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUIpelatihan wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUIpelatihan_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function mlr_Callback(hObject, eventdata, handles)
% hObject    handle to mlr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mlr as text
%        str2double(get(hObject,'String')) returns contents of mlr as a double


% --- Executes during object creation, after setting all properties.
function mlr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mlr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lr_Callback(hObject, eventdata, handles)
% hObject    handle to lr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lr as text
%        str2double(get(hObject,'String')) returns contents of lr as a double


% --- Executes during object creation, after setting all properties.
function lr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function plr_Callback(hObject, eventdata, handles)
% hObject    handle to plr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of plr as text
%        str2double(get(hObject,'String')) returns contents of plr as a double


% --- Executes during object creation, after setting all properties.
function plr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function win_Callback(hObject, eventdata, handles)
% hObject    handle to win (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of win as text
%        str2double(get(hObject,'String')) returns contents of win as a double


% --- Executes during object creation, after setting all properties.
function win_CreateFcn(hObject, eventdata, handles)
% hObject    handle to win (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global dataLbaru kelasLbaru dataUbaru kelasUbaru Wlvq WlvqC;


ll=str2num(get(handles.lr,'string'));
mll=str2num(get(handles.mlr,'string'));
epoch=str2num(get(handles.epoch,'string'));
pll=str2num(get(handles.plr,'string'));
m=str2num(get(handles.m,'string'));
win=str2num(get(handles.win,'string'));
fold= get(handles.fold,'Value');
if(fold==1)
    
else
    


fx = waitbar(0,'Memproses Data','Name','Approximating pi...',...
'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
if(fold==2)
    jmll = 90;
elseif(fold==3)
    jmll=80;
else
    jmll = 70;
end
bagidata(jmll);

load data/data_latih.mat
load data/target_latih.mat
load data/data_uji.mat
load data/target_uji.mat

dataLbaru = data_latih;
kelasLbaru = target_latih;
kelasUbaru = target_uji;



dataLbaru =  data_latih(:,1:6);
dataUbaru =data_uji(:,1:6);

[ waktu Wlvq WlvqC ep ] = lvq3( dataLbaru,kelasLbaru,ll,pll,mll,win, epoch,m);
save ('data/pengujian.mat','dataLbaru', 'kelasLbaru', 'dataUbaru', 'kelasUbaru', 'Wlvq', 'WlvqC');
dataUbaru =data_uji;
dataLbaru = data_latih;
[ waktu Wlvq WlvqC ep ] = lvq3( dataLbaru,kelasLbaru,ll,pll,mll,win, epoch,m);



delete(fx);
clear fx;
set(findobj(gcf,'Tag','latih'),'Data',[dataLbaru kelasLbaru]);
set(findobj(gcf,'Tag','nilaiw'),'Data',[Wlvq WlvqC]);
set(findobj(gcf,'Tag','uji'),'Data',[dataUbaru kelasUbaru]);
dataLbaru =  data_latih(:,1:6);
dataUbaru =data_uji(:,1:6);

end
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global dataLbaru kelasLbaru dataUbaru kelasUbaru Wlvq WlvqC;
fx = waitbar(0,'Memproses Data','Name','Approximating pi...',...
'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
load data/pengujian;
datahasil=[];
bntuji1=size(dataUbaru);
bntuji2=size(dataLbaru);
bntbenar=0;
for(iU=1:bntuji1(1))
    Wd=[];
    for (jU=1:bntuji1(2))
        Wd(jU)=dataUbaru(iU,jU);
    end
        bntlatih=size(Wlvq);
jarak=10000000000000;
pilih=0;
for i=1:bntlatih(1)
    hlp=0;
    %cari jarak dengan rumus euclidean
    for j=1:bntlatih(2)
        satu=Wlvq(i,j)-Wd(j);
        dua=satu*satu;
        hlp=hlp+dua;   
    end
    hlp2=sqrt(hlp);
    if(hlp2<jarak)
        jarak=hlp2;
        pilih=i;
    end
end
hasil=pilih;


hlpq=WlvqC(hasil);
if(kelasUbaru(iU)==hlpq)
    bntbenar=bntbenar+1;
    datahasil=[datahasil;kelasUbaru(iU) hlpq 1];
else
    datahasil=[datahasil;kelasUbaru(iU) hlpq 0]
end

end
bntAkurasi=bntbenar/bntuji1(1)*100;
delete(fx);
clear fx
jmsalah=bntuji1(1)-bntbenar;
set(findobj(gcf,'Tag','akurasi'),'String',int2str(bntAkurasi));
set(findobj(gcf,'Tag','jsalah'),'String',int2str(jmsalah));
set(findobj(gcf,'Tag','benar'),'String',int2str(bntbenar));
set(findobj(gcf,'Tag','jumlahU'),'String',int2str(bntuji1(1)));
set(findobj(gcf,'Tag','jumlahL'),'String',int2str(bntuji2(1)));
set(findobj(gcf,'Tag','tH'),'Data',datahasil);
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function epoch_Callback(hObject, eventdata, handles)
% hObject    handle to epoch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of epoch as text
%        str2double(get(hObject,'String')) returns contents of epoch as a double


% --- Executes during object creation, after setting all properties.
function epoch_CreateFcn(hObject, eventdata, handles)
% hObject    handle to epoch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in lPP.
function lPP_Callback(hObject, eventdata, handles)
% hObject    handle to lPP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lPP contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lPP


% --- Executes during object creation, after setting all properties.
function lPP_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lPP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jumlahL_Callback(hObject, eventdata, handles)
% hObject    handle to jumlahL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jumlahL as text
%        str2double(get(hObject,'String')) returns contents of jumlahL as a double


% --- Executes during object creation, after setting all properties.
function jumlahL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jumlahL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jumlahU_Callback(hObject, eventdata, handles)
% hObject    handle to jumlahU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jumlahU as text
%        str2double(get(hObject,'String')) returns contents of jumlahU as a double


% --- Executes during object creation, after setting all properties.
function jumlahU_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jumlahU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function benar_Callback(hObject, eventdata, handles)
% hObject    handle to benar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of benar as text
%        str2double(get(hObject,'String')) returns contents of benar as a double


% --- Executes during object creation, after setting all properties.
function benar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to benar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jsalah_Callback(hObject, eventdata, handles)
% hObject    handle to jsalah (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jsalah as text
%        str2double(get(hObject,'String')) returns contents of jsalah as a double


% --- Executes during object creation, after setting all properties.
function jsalah_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jsalah (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function akurasi_Callback(hObject, eventdata, handles)
% hObject    handle to akurasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of akurasi as text
%        str2double(get(hObject,'String')) returns contents of akurasi as a double


% --- Executes during object creation, after setting all properties.
function akurasi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to akurasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
clear all;
close GUIpelatihan;
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
clear all;
close GUIpelatihan;
depan;
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function m_Callback(hObject, eventdata, handles)
% hObject    handle to m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m as text
%        str2double(get(hObject,'String')) returns contents of m as a double


% --- Executes during object creation, after setting all properties.
function m_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in fold.
function fold_Callback(hObject, eventdata, handles)
% hObject    handle to fold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns fold contents as cell array
%        contents{get(hObject,'Value')} returns selected item from fold


% --- Executes during object creation, after setting all properties.
function fold_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
