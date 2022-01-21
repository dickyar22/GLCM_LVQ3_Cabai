function varargout = aplikasi(varargin)
% APLIKASI M-file for aplikasi.fig
%      APLIKASI, by itself, creates a new APLIKASI or raises the existing
%      singleton*.
%
%      H = APLIKASI returns the handle to a new APLIKASI or the handle to
%      the existing singleton*.
%
%      APLIKASI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APLIKASI.M with the given input arguments.
%
%      APLIKASI('Property','Value',...) creates a new APLIKASI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before aplikasi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to aplikasi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help aplikasi

% Last Modified by GUIDE v2.5 07-Jul-2021 00:43:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @aplikasi_OpeningFcn, ...
                   'gui_OutputFcn',  @aplikasi_OutputFcn, ...
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


% --- Executes just before aplikasi is made visible.
function aplikasi_OpeningFcn(hObject, eventdata, handles, varargin)



% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to aplikasi (see VARARGIN)

% Choose default command line output for aplikasi
handles.output = hObject;


% Update handles structure
guidata(hObject, handles);
setappdata(0,'datacontainer',hObject);

% UIWAIT makes aplikasi wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = aplikasi_OutputFcn(hObject, eventdata, handles) 

hback = axes('units','normalized','position',[0 0 1 1]);

uistack(hback,'bottom');

% Load background image and display it

[back map]=imread('bg1.png');

image(back)

colormap(map)

% Turn the handlevisibility off so that we dont inadvertently plot into

% the axes again. Also, make the axes invisible

set(hback,'handlevisibility','off','visible','off')






% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
clear all;
close(aplikasi);
guidata(depan);

% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global datalatih;
[nama_file1,nama_path1]=uigetfile( ...
    {'*.bmp;*.jpg','File Citra (*.bmp,*.jpg)';
    '*.bmp','File Bitmap (*.bmp)';...
    '*.jpg','File jpeg (*.jpg)';
    '*.*','Semua File (*.*)'},...
    'Buka File Citra Asli');

if ~isequal(nama_file1,0)
    datalatih=imread(fullfile(nama_path1,nama_file1));
    handles.data1 = imread(fullfile(nama_path1,nama_file1));
    guidata(hObject,handles);
    axes(handles.file);
    imshow(handles.data1);
    mydatacontainer=getappdata(0,'datacontainer');
else
    return;
end

set (handles.namafile,'String',nama_file1);



% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global datalatih;
global siapa;

klsbr=siapa-1;
if((siapa<2))
            errordlg('Moohon pilih Kelas');
else

bnt22=egnface(datalatih);
bnt23= klsbr;
egnama=[];
load 'hasilegn';



eg=[eg; bnt22]
nama_f1=size(eg);
nama_f2=int2str(nama_f1(1));
nama_f=strcat('gbr/',nama_f2,'.jpg');
imwrite(datalatih,nama_f);

egnama=[egnama;bnt23]
clear bnt22;
clear bnt23;
clear datalatih;
[W rata srt]=egnface2(eg);

save 'hasilegn.mat';
clear all;

close(aplikasi);
guidata(aplikasi);

end
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in siapa.
function siapa_Callback(hObject, eventdata, handles)
global siapa
siapa = get(hObject,'value');
% hObject    handle to siapa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns siapa contents as cell array
%        contents{get(hObject,'Value')} returns selected item from siapa


% --- Executes during object creation, after setting all properties.
function siapa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to siapa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in uji.
function uji_Callback(hObject, eventdata, handles)

global datauji;
[nama_file2,nama_path2]=uigetfile( ...
    {'*.bmp;*.jpg','File Citra (*.bmp,*.jpg)';
    '*.bmp','File Bitmap (*.bmp)';...
    '*.jpg','File jpeg (*.jpg)';
    '*.*','Semua File (*.*)'},...
    'Buka File Citra Asli');

if ~isequal(nama_file2,0)
    datauji=imread(fullfile(nama_path2,nama_file2));
    handles.data2 = imread(fullfile(nama_path2,nama_file2));
    guidata(hObject,handles);
    axes(handles.egfuji);
    imshow(handles.data2);
      axes(handles.egfhasil);
else
    return;
end

% hObject    handle to uji (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
global datauji;
load 'hasilegn';
akhir=egnfaceuji(datauji,rata);
bnthasil1=int2str(akhir);
bnthasil2=strcat('gbr/',bnthasil1,'.jpg');
gbrhlp=imread(bnthasil2);

imshow(gbrhlp);

hlpq=egnama(akhir);
bnthasil3='';
if(hlpq==1)
bnthasil3=strcat('Citra Masukan Mirip Dengan A');
end
if(hlpq==2)
bnthasil3=strcat('Citra Masukan Mirip Dengan B');
end

if(hlpq==3)
bnthasil3=strcat('Citra Masukan Mirip Dengan C');
end
set(findobj(gcf,'Tag','Thasileg'),'String',bnthasil3);


% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.


% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in banding.
function banding_Callback(hObject, eventdata, handles)
global banding
banding = get(hObject,'value');
% hObject    handle to banding (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns banding contents as cell array
%        contents{get(hObject,'Value')} returns selected item from banding


% --- Executes during object creation, after setting all properties.
function banding_CreateFcn(hObject, eventdata, handles)
% hObject    handle to banding (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
global ttg
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

b=get(hObject,'Value');
ttg2=round(b)+1;
ttg=ttg2/100;
set(findobj(gcf,'Tag','LR'),'String',ttg);
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on key press with focus on slider1 and none of its controls.
function slider1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function epoh_Callback(hObject, eventdata, handles)
global ttge
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

b=get(hObject,'Value');
ttge=b;

set(findobj(gcf,'Tag','eph'),'String',ttge);

% hObject    handle to epoh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function epoh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to epoh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
global ttg % learningrate

global minL% minimum learningrate
ttg=str2num(get(handles.ll,'string'));
minL=str2num(get(handles.mll,'string'));

tic;%mulai hitung lama proses
load 'latih.mat';%buka data yang tersimpan
bnt99=size(data);
bnt100=bnt99(1);
Wlvq=[];
Xlvq=[];
WlvqC=[];
XlvqC=[];
sampel=[];
%mulai proses LVQ
%pisahkan W dan X
for i=1:bnt100
    hlpsyb=0;
    for nn=1:length(WlvqC)
        if(kelas(i)==WlvqC(nn))
            hlpsyb=1;
        end
    end
    if(hlpsyb==0)
        wbnt=size(data);
        wbnt2=[];
        for ww=1:wbnt(2)
            wbnt2=[wbnt2 data(i,ww)];
        end
        Wlvq=[Wlvq; wbnt2]
        WlvqC=[WlvqC; kelas(i)]  
        sampel=[sampel; i]
    else
        wbnt=size(data);
        wbnt2=[];
        for ww=1:wbnt(2)
            wbnt2=[wbnt2 data(i,ww)];
        end
        
        
        Xlvq=[Xlvq; wbnt2]
        XlvqC=[XlvqC; kelas(i)]    
    end
    
end


%ditemukan Wlvq sebagai nilai W dan Xlvq sebagai nilai X

bntuj=size(Xlvq);
bntlat=size(Wlvq);
for cq=1:999999 % pengulangan sampai ditemukan min learningrate
    for aa=1:bntuj(1)
        kecilL=10000000000000000;
        plhKecil=0;
        target=0;
        for bb=1:bntlat(1)
            jrjbnt=size(Xlvq);
            jarakL1=0;
            for jrj=1:jrjbnt(2)
                jarakL1=jarakL1+(((Xlvq(aa,jrj)-Wlvq(bb,jrj))*(Xlvq(aa,jrj)-Wlvq(bb,jrj))));%cari jarak antara data X dan data W
            end
            jarakL2=sqrt(jarakL1);
            %cari jarak terpendek
            if(jarakL2<kecilL)
                    kecilL=jarakL2;
                    plhKecil=bb;
                    if(WlvqC(bb)==XlvqC(aa))
                        target=1;% cek class X dan class W sama
                    else
                        target=0;% cek class X dan class W beda
                    end
            end       
        end
        if(target==1)% jka class X dan W sama
            jrjbnt=size(Xlvq);
            jarakL1=0;
            for jrj=1:jrjbnt(2)% hitung nilai W baru
                Wlvq(plhKecil,jrj)=Wlvq(plhKecil, jrj)+(ttg*(Xlvq(aa,jrj)-Wlvq(plhKecil, jrj)));
            end
        else% jka class X dan W berbeda
            jrjbnt=size(Xlvq);
            jarakL1=0;
            for jrj=1:jrjbnt(2)% hitung nilai W baru
                Wlvq(plhKecil,jrj)=Wlvq(plhKecil, jrj)-(ttg*(Xlvq(aa,jrj)-Wlvq(plhKecil, jrj)));
            end

        end
    end
    if(ttg<=minL) % jika sudah sampai minimum learningrate berhenti pengulangan
        break;
    else% jika tidak, hitung learningrate baru
        ttg=ttg-(0.1*ttg);
    end
end
set(findobj(gcf,'Tag','selesaiB'),'String',strcat('Proses Selesai pada epohn ke- ',int2str(cq)));
clear aa bb bnt100 bnt99 bntlat bntuji cq data eventdata handles hlpsyb hObject i jarakL1 jarakL2 jrj jrjbnt kecilL kelas minL namaF nn plhKecil sampel target ttg wbnt wbnt2 ww;
save 'hasillvq.mat';% simpan W hasil pembelajaran
clear all;
toc;
waktu3=toc;% waktu pembelajaran


set(findobj(gcf,'Tag','waktu3'),'String','Selesai');


    % hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
global decL
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

b=get(hObject,'Value');
decL2=round(b)+1;
decL=decL2/100;
set(findobj(gcf,'Tag','dec'),'String',decL);
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
global minL
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

b=get(hObject,'Value');
minL2=round(b)+1;
minL=minL2/100;
set(findobj(gcf,'Tag','min'),'String',minL);

% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)

global dataujiL datates;
[nama_file2,nama_path2]=uigetfile( ...
    {'*.bmp;*.png;*.jpg','File Citra (*.bmp,*.png,*.jpg)';
    '*.bmp','File Bitmap (*.bmp)';...
    '*.jpg','File jpeg (*.jpg)';
    '*.*','Semua File (*.*)'},...
    'Buka File Citra Asli');

if ~isequal(nama_file2,0)
    dataujiL=imread(fullfile(nama_path2,nama_file2));
    handles.data3 = imread(fullfile(nama_path2,nama_file2));
    guidata(hObject,handles);
    axes(handles.lvquji);
    imshow(handles.data3);
      datalatih=dataujiL;
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
        
        datates=[qR qG qB  nASM nCON nCOR nVAR nIDM nENT];
    
else
    return;
end


% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
global dataujiL datates;
tic;
load data/pengujian;

        Wd= datates(:,1:6);

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



%imshow(gbrhlp);
hlpq=WlvqC(hasil);
bnthasil3='';
if(hlpq==1)
bnthasil3=strcat('Citra Masukan Dikenali Sudah Matang');
end
if(hlpq==2)
bnthasil3=strcat('Citra Masukan Dikenali Setengah Matang');
end

if(hlpq==3)
bnthasil3=strcat('Citra Masukan Dikenali Masih Mentah');
end

if(hlpq==4)
bnthasil3=strcat('Citra Masukan Dikenali Busuk');
end

set(findobj(gcf,'Tag','lvqend'),'String',bnthasil3);
toc;
waktu4=jarak;

% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
clear all;
close(aplikasi);

% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
clear all;
close(aplikasi);
guidata(aplikasi);
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
global dataujiL;
faceDetector = vision.CascadeObjectDetector;
bboxes = step(faceDetector, dataujiL);
bntlt=imcrop(dataujiL,bboxes)
dataujiL=bntlt;

    axes(handles.lvquji);
    imshow(dataujiL);
      axes(handles.lvqhasil);
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function ll_Callback(hObject, eventdata, handles)
% hObject    handle to ll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ll as text
%        str2double(get(hObject,'String')) returns contents of ll as a double


% --- Executes during object creation, after setting all properties.
function ll_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function mll_Callback(hObject, eventdata, handles)
% hObject    handle to mll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mll as text
%        str2double(get(hObject,'String')) returns contents of mll as a double


% --- Executes during object creation, after setting all properties.
function mll_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)

disp(get(handles.ll,'string'));
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
global cam;
if(isempty(cam))
cam = webcam(1);
end
axes(handles.lvquji);
 hold off;
  axis auto;  
hImage = findobj(handles.lvquji, 'Type', 'image');


preview(cam);
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
global cam img datates;
img = snapshot(cam);
closePreview(cam)
axes(handles.lvquji);
imshow(img);
      datalatih=img;
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
        
        datates=[qR qG qB  nASM nCON nCOR nVAR nIDM nENT];
        clear cam;
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function uipanel7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
