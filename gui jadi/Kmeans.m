function varargout = Kmeans(varargin)
% KMEANS MATLAB code for Kmeans.fig
%      KMEANS, by itself, creates a new KMEANS or raises the existing
%      singleton*.
%
%      H = KMEANS returns the handle to a new KMEANS or the handle to
%      the existing singleton*.
%
%      KMEANS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KMEANS.M with the given input arguments.
%
%      KMEANS('Property','Value',...) creates a new KMEANS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Kmeans_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Kmeans_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Kmeans

% Last Modified by GUIDE v2.5 02-Jan-2022 06:49:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Kmeans_OpeningFcn, ...
                   'gui_OutputFcn',  @Kmeans_OutputFcn, ...
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


% --- Executes just before Kmeans is made visible.
function Kmeans_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Kmeans (see VARARGIN)

% Choose default command line output for Kmeans
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Kmeans wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Kmeans_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hsv = handles.img;

hue = mean(mean(hsv(:,:,1)));
saturation = mean(mean(hsv(:,:,2)));
value = mean(mean(hsv(:,:,3)));

set(handles.edit1, 'string', hue);
set(handles.edit2, 'string', saturation);
set(handles.edit3, 'string', value);

H = hsv(:,:,1);
S = hsv(:,:,2);
V = hsv(:,:,3);

axes(handles.axes3)
imshow(H)
title('Hue Image')

axes(handles.axes4)
imshow(S)
title('Saturation Image')

axes(handles.axes5)
imshow(V)
title('Value Image')

guidata(hObject,handles);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% menampilkan menu browse image
[nama_file, nama_folder] = uigetfile('*.JPG; *.png');

% Jika ada nama file yang dipilih maka akan mengeksekusi perintah dibawah
% ini
if  ~isequal(nama_file,0)
    % membaca file citra rgb
    img = imread(fullfile(nama_folder, nama_file));
    
    % menampilkan citra rgb yang kita baca pada axes1
    axes(handles.axes2)
    imshow (img)
    title('RGB Image')
    
    % menyimpan variable img pada lokasi handles agar dapat dipanggil oleh
    % push button yang lain
    handles.img = img;
    guidata(hObject, handles)
    
else
    % Jika tidak ada nama file yang dipilih maka akan mengeksekusi perintah
    % dibawah ini
    return 
end

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.axes2)
cla reset
set(gca,'Xtick',[])
set(gca,'Ytick',[])

axes(handles.axes3)
cla reset
set(gca,'Xtick',[])
set(gca,'Ytick',[])

axes(handles.axes4)
cla reset
set(gca,'Xtick',[])
set(gca,'Ytick',[])

axes(handles.axes5)
cla reset
set(gca,'Xtick',[])
set(gca,'Ytick',[])

axes(handles.axes6)
cla reset
set(gca,'Xtick',[])
set(gca,'Ytick',[])

axes(handles.axes9)
cla reset
set(gca,'Xtick',[])
set(gca,'Ytick',[])

set(handles.uitable1,'Data',[])
set(handles.edit4,'String','1')
set(handles.edit1,'String','')
set(handles.edit2,'String','')
set(handles.edit3,'String','')


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% memanggil variabel img yang ada di lokasi handles
img = handles.img;

% mengkonversi citra rgb menjadi grayscale
img_gray = rgb2gray(img);

% menampilkan citra grayscale
axes(handles.axes9)
imshow(img_gray)
title('Grayscale Image')

% membaca pixel distance yang ada pada edit text
pixel_dist = str2double(get(handles.edit4,'String'));

% membentuk matrix kookurensi
GLCM = graycomatrix(img_gray,'Offset',[0 pixel_dist;...
    -pixel_dist pixel_dist; -pixel_dist 0; -pixel_dist -pixel_dist]);
% mengekstrak fitur glcm
stats = graycoprops(GLCM, {'Contrast', 'Correlation', 'Energy', 'Homogeneity'});

% membaca fitur GLCM
Contrast = stats.Contrast;
Correlation = stats.Correlation;
Energy = stats.Energy;
Homogeneity= stats.Homogeneity;

% Menampilkan fitur GLCM Pada Tabel
data = get(handles.uitable1,'Data');
data{1,1} = num2str(Contrast(1));
data{1,2} = num2str(Contrast(2));
data{1,3} = num2str(Contrast(3));
data{1,4} = num2str(Contrast(4));
data{1,5} = num2str(mean(Contrast));

data{2,1} = num2str(Correlation(1));
data{2,2} = num2str(Correlation(2));
data{2,3} = num2str(Correlation(3));
data{2,4} = num2str(Correlation(4));
data{2,5} = num2str(mean(Correlation));

data{3,1} = num2str(Energy(1));
data{3,2} = num2str(Energy(2));
data{3,3} = num2str(Energy(3));
data{3,4} = num2str(Energy(4));
data{3,5} = num2str(mean(Energy));

data{4,1} = num2str(Homogeneity(1));
data{4,2} = num2str(Homogeneity(2));
data{4,3} = num2str(Homogeneity(3));
data{4,4} = num2str(Homogeneity(4));
data{4,5} = num2str(mean(Homogeneity));

set(handles.uitable1,'Data',data)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes6);
gambar = (handles.img);
gambar = im2double(gambar); %agar tidak terjadi error
h = gambar(:,:,1); %kita ambil warnanya
s = gambar(:,:,2);
v = gambar(:,:,3);
[m,n] = size(h); %mengambil ukuran gambar
h = reshape(h,m*n,1); %menjadikan warna dan ukuran gambar menjadi data
s = reshape(s,m*n,1);
v = reshape(v,m*n,1);
hsv = cat(2,h,s,v);
h = kmeans(hsv,3); %angka 3 ini adalah jumlah cluster
h = reshape(h,m,n);
h = h/3;
imshow(h);



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
