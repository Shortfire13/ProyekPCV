function varargout = kmeans(varargin)
% KMEANS MATLAB code for kmeans.fig
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
%      applied to the GUI before kmeans_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to kmeans_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help kmeans

% Last Modified by GUIDE v2.5 29-Nov-2018 20:15:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @kmeans_OpeningFcn, ...
                   'gui_OutputFcn',  @kmeans_OutputFcn, ...
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


% --- Executes just before kmeans is made visible.
function kmeans_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to kmeans (see VARARGIN)

% Choose default command line output for kmeans
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes kmeans wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = kmeans_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
randnumb = str2double(get(handles.edit1,'String'))
popupvalue = get(handles.popupmenu1,'value');

if(popupvalue == 1)
    cla reset
    M = zeros(randnumb,2);
    label = zeros(randnumb,1);

    %buat data random randnumb
    for a=1:randnumb
        M(a,1)=unidrnd(randnumb);
        M(a,2)=unidrnd(randnumb);
    end

    %buat centroid
    c1 = [unidrnd(randnumb) unidrnd(randnumb)];
    c2 = [unidrnd(randnumb) unidrnd(randnumb)];

    c1_temp = -ones(1,2);
    c2_temp = -ones(1,2);

    iterasi = 0;
    while((c1(1,1)~=c1_temp(1,1)) && (c1(1,2)~=c1_temp(1,2)) && (c2(1,1)~=c2_temp(1,1)) && (c2(1,2)~=c2_temp(1,2)))
        iterasi = iterasi+1;
        jum_c1 = 0;
        jum_c2 = 0;
        for a=1:randnumb
            x = M(a,1);
            y = M(a,2);
            c1x = c1(1,1);
            c1y = c1(1,2);
            c2x = c2(1,1);
            c2y = c2(1,2);

            euc1 = sqrt((x - c1x)^2 + (y - c1y)^2);
            euc2 = sqrt((x - c2x)^2 + (y - c2y)^2);

            if(euc1 <= euc2)
                label(a,1)=1;
                jum_c1 = jum_c1+1; %jumlah data pada cluster
                plot(M(a,1),M(a,2),'.b'); hold on
            else
                label(a,1)=2;
                jum_c2 = jum_c2+1;
                plot(M(a,1),M(a,2),'.g'); hold on
            end
        end

        %mencari jumlah data pada cluster dengan kordinat x dan y
        jx_c1 = 0;
        jy_c1 = 0;
        jx_c2 = 0;
        jy_c2 = 0;
        for a=1:randnumb
            if(label(a,1)==1)
                jx_c1 = jx_c1 + M(a,1);
                jy_c1 = jy_c1 + M(a,2);
            else
                jx_c2 = jx_c2 + M(a,1);
                jy_c2 = jy_c2 + M(a,2);
            end
        end

        %mencari rata"
        rx_c1 = jx_c1/jum_c1;
        ry_c1 = jy_c1/jum_c1;
        rx_c2 = jx_c2/jum_c2;
        ry_c2 = jy_c2/jum_c2;

        %pindah letak centroid lama
        c1_temp(1,1) = c1(1,1);
        c1_temp(1,2) = c1(1,2);
        c2_temp(1,1) = c2(1,1);
        c2_temp(1,2) = c2(1,2);

        %titik baru centroid
        c1(1,1) = round(rx_c1);
        c1(1,2) = round(ry_c1);
        c2(1,1) = round(rx_c2);
        c2(1,2) = round(ry_c2);

        disp('centroid baru 1 & 2');
        disp(c1);
        disp(c2);
    end
    disp(iterasi);
    axes(handles.axes1)
    plot(c1(:,1),c1(:,2),'+b','Markersize',12,'LineWidth',2); hold on
    plot(c2(:,1),c2(:,2),'+g','Markersize',12,'LineWidth',2); hold on
    plot(c1(:,1),c1(:,2),'ko','Markersize',12,'LineWidth',2); hold on
    plot(c2(:,1),c2(:,2),'ko','Markersize',12,'LineWidth',2); hold on
    grid on

elseif(popupvalue == 2)
    cla reset
    M = zeros(randnumb,2);
    label = zeros(randnumb,1);

    %buat data random randnumb
    for a=1:randnumb
        M(a,1)=unidrnd(randnumb);
        M(a,2)=unidrnd(randnumb);
    end

    %buat centroid
    c1 = [unidrnd(randnumb) unidrnd(randnumb)];
    c2 = [unidrnd(randnumb) unidrnd(randnumb)];
    c3 = [unidrnd(randnumb) unidrnd(randnumb)];

    c1_temp = -ones(1,2);
    c2_temp = -ones(1,2);
    c3_temp = -ones(1,2);

    iterasi = 0;
    while((c1(1,1)~=c1_temp(1,1)) && (c1(1,2)~=c1_temp(1,2)) && (c2(1,1)~=c2_temp(1,1)) && (c2(1,2)~=c2_temp(1,2)) && (c3(1,1)~=c3_temp(1,1)) && (c3(1,2)~=c3_temp(1,2)))
        iterasi = iterasi+1;
        jum_c1 = 0;
        jum_c2 = 0;
        jum_c3 = 0;
        for a=1:randnumb
            x = M(a,1);
            y = M(a,2);
            c1x = c1(1,1);
            c1y = c1(1,2);
            c2x = c2(1,1);
            c2y = c2(1,2);
            c3x = c3(1,1);
            c3y = c3(1,2);

            euc1 = sqrt((x - c1x)^2 + (y - c1y)^2);
            euc2 = sqrt((x - c2x)^2 + (y - c2y)^2);
            euc3 = sqrt((x - c3x)^2 + (y - c3y)^2);

            if((euc1 <= euc2)  &&  (euc1 <= euc3))
                label(a,1)=1;
                jum_c1 = jum_c1+1; %jumlah data pada cluster
                plot(M(a,1),M(a,2),'.b'); hold on
            elseif(euc2 <= euc3)
                label(a,1)=2;
                jum_c2 = jum_c2+1;
                plot(M(a,1),M(a,2),'.g'); hold on
            else
                label(a,1)=3;
                jum_c3 = jum_c3+1;
                plot(M(a,1),M(a,2),'.r'); hold on
            end
        end

        %mencari jumlah data pada cluster dengan kordinat x dan y
        jx_c1 = 0;
        jy_c1 = 0;
        jx_c2 = 0;
        jy_c2 = 0;
        jx_c3 = 0;
        jy_c3 = 0;
        for a=1:randnumb
            if(label(a,1)==1)
                jx_c1 = jx_c1 + M(a,1);
                jy_c1 = jy_c1 + M(a,2);
            elseif(label(a,1)==2)
                jx_c2 = jx_c2 + M(a,1);
                jy_c2 = jy_c2 + M(a,2);
            else
                jx_c3 = jx_c3 + M(a,1);
                jy_c3 = jy_c3 + M(a,2);
            end    
        end

        %mencari rata"
        rx_c1 = jx_c1/jum_c1;
        ry_c1 = jy_c1/jum_c1;

        rx_c2 = jx_c2/jum_c2;
        ry_c2 = jy_c2/jum_c2;

        rx_c3 = jx_c3/jum_c3;
        ry_c3 = jy_c3/jum_c3;

        %pindah letak centroid lama
        c1_temp(1,1) = c1(1,1);
        c1_temp(1,2) = c1(1,2);
        c2_temp(1,1) = c2(1,1);
        c2_temp(1,2) = c2(1,2);
        c3_temp(1,1) = c3(1,1);
        c3_temp(1,2) = c3(1,2);

        %titik baru centroid
        c1(1,1) = round(rx_c1);
        c1(1,2) = round(ry_c1);
        c2(1,1) = round(rx_c2);
        c2(1,2) = round(ry_c2);
        c3(1,1) = round(rx_c3);
        c3(1,2) = round(ry_c3);

        disp('centroid baru 1 & 2');
        disp(c1);
        disp(c2);
        disp(c3);
    end
    disp(iterasi);
    axes(handles.axes1)
    plot(c1(:,1),c1(:,2),'+b','Markersize',12,'LineWidth',2); hold on
    plot(c2(:,1),c2(:,2),'+g','Markersize',12,'LineWidth',2); hold on
    plot(c3(:,1),c3(:,2),'+r','Markersize',12,'LineWidth',2); hold on
    plot(c1(:,1),c1(:,2),'ko','Markersize',12,'LineWidth',2); hold on
    plot(c2(:,1),c2(:,2),'ko','Markersize',12,'LineWidth',2); hold on
    plot(c3(:,1),c3(:,2),'ko','Markersize',12,'LineWidth',2); hold on
    grid on
    
elseif(popupvalue == 3)
    cla reset
    M = zeros(randnumb,2);
    label = zeros(randnumb,1);

    %buat data random randnumb
    for a=1:randnumb
        M(a,1)=unidrnd(randnumb);
        M(a,2)=unidrnd(randnumb);
    end

    %buat centroid
    c1 = [unidrnd(randnumb) unidrnd(randnumb)];
    c2 = [unidrnd(randnumb) unidrnd(randnumb)];
    c3 = [unidrnd(randnumb) unidrnd(randnumb)];
    c4 = [unidrnd(randnumb) unidrnd(randnumb)];

    c1_temp = -ones(1,2);
    c2_temp = -ones(1,2);
    c3_temp = -ones(1,2);
    c4_temp = -ones(1,2);

    iterasi = 0;
    while((c1(1,1)~=c1_temp(1,1)) && (c1(1,2)~=c1_temp(1,2)) && (c2(1,1)~=c2_temp(1,1)) && (c2(1,2)~=c2_temp(1,2)) && (c3(1,1)~=c3_temp(1,1)) && (c3(1,2)~=c3_temp(1,2)) && (c4(1,1)~=c4_temp(1,1)) && (c4(1,2)~=c4_temp(1,2)))
        iterasi = iterasi+1;
        jum_c1 = 0;
        jum_c2 = 0;
        jum_c3 = 0;
        jum_c4 = 0;
        for a=1:randnumb
            x = M(a,1);
            y = M(a,2);
            c1x = c1(1,1);
            c1y = c1(1,2);
            c2x = c2(1,1);
            c2y = c2(1,2);
            c3x = c3(1,1);
            c3y = c3(1,2);
            c4x = c4(1,1);
            c4y = c4(1,2);

            euc1 = sqrt((x - c1x)^2 + (y - c1y)^2);
            euc2 = sqrt((x - c2x)^2 + (y - c2y)^2);
            euc3 = sqrt((x - c3x)^2 + (y - c3y)^2);
            euc4 = sqrt((x - c4x)^2 + (y - c4y)^2);

            if((euc1 <= euc2)  &&  (euc1 <= euc3) && (euc1 <= euc4))
                label(a,1)=1;
                jum_c1 = jum_c1+1; %jumlah data pada cluster
                plot(M(a,1),M(a,2),'.b'); hold on
            elseif((euc2 <= euc3) && (euc2 <= euc4))
                label(a,1)=2;
                jum_c2 = jum_c2+1;
                plot(M(a,1),M(a,2),'.g'); hold on
            elseif(euc3 <= euc4)
                label(a,1)=3;
                jum_c3 = jum_c3+1;
                plot(M(a,1),M(a,2),'.r'); hold on
            else
                label(a,1)=4;
                jum_c4 = jum_c4+1;
                plot(M(a,1),M(a,2),'.c'); hold on
            end
        end

        %mencari jumlah data pada cluster dengan kordinat x dan y
        jx_c1 = 0;
        jy_c1 = 0;
        jx_c2 = 0;
        jy_c2 = 0;
        jx_c3 = 0;
        jy_c3 = 0;
        jx_c4 = 0;
        jy_c4 = 0;
        for a=1:randnumb
            if(label(a,1)==1)
                jx_c1 = jx_c1 + M(a,1);
                jy_c1 = jy_c1 + M(a,2);
            elseif(label(a,1)==2)
                jx_c2 = jx_c2 + M(a,1);
                jy_c2 = jy_c2 + M(a,2);
            elseif(label(a,1)==3)
                jx_c3 = jx_c3 + M(a,1);
                jy_c3 = jy_c3 + M(a,2);
            else
                jx_c4 = jx_c4 + M(a,1);
                jy_c4 = jy_c4 + M(a,2);
            end
        end

        %mencari rata"
        rx_c1 = jx_c1/jum_c1;
        ry_c1 = jy_c1/jum_c1;
        rx_c2 = jx_c2/jum_c2;
        ry_c2 = jy_c2/jum_c2;
        rx_c3 = jx_c3/jum_c3;
        ry_c3 = jy_c3/jum_c3;
        rx_c4 = jx_c4/jum_c4;
        ry_c4 = jy_c4/jum_c4;

        %pindah letak centroid lama
        c1_temp(1,1) = c1(1,1);
        c1_temp(1,2) = c1(1,2);
        c2_temp(1,1) = c2(1,1);
        c2_temp(1,2) = c2(1,2);
        c3_temp(1,1) = c3(1,1);
        c3_temp(1,2) = c3(1,2);
        c4_temp(1,1) = c4(1,1);
        c4_temp(1,2) = c4(1,2);


        %titik baru centroid
        c1(1,1) = round(rx_c1);
        c1(1,2) = round(ry_c1);
        c2(1,1) = round(rx_c2);
        c2(1,2) = round(ry_c2);
        c3(1,1) = round(rx_c3);
        c3(1,2) = round(ry_c3);
        c4(1,1) = round(rx_c4);
        c4(1,2) = round(ry_c4);


        disp('centroid baru 1 , 2 , 3 , 4');
        disp(c1);
        disp(c2);
        disp(c3);
        disp(c4);
    end
    disp(iterasi);
    axes(handles.axes1)
    plot(c1(:,1),c1(:,2),'+b','Markersize',12,'LineWidth',2); hold on
    plot(c2(:,1),c2(:,2),'+g','Markersize',12,'LineWidth',2); hold on
    plot(c3(:,1),c3(:,2),'+r','Markersize',12,'LineWidth',2); hold on
    plot(c4(:,1),c4(:,2),'+c','Markersize',12,'LineWidth',2); hold on

    plot(c1(:,1),c1(:,2),'ko','Markersize',12,'LineWidth',2); hold on
    plot(c2(:,1),c2(:,2),'ko','Markersize',12,'LineWidth',2); hold on
    plot(c3(:,1),c3(:,2),'ko','Markersize',12,'LineWidth',2); hold on
    plot(c4(:,1),c4(:,2),'ko','Markersize',12,'LineWidth',2); hold on
    grid on
    
elseif(popupvalue == 4)
    cla reset
    M = zeros(randnumb,2);
    label = zeros(randnumb,1);

    %buat data random randnumb
    for a=1:randnumb
        M(a,1)=unidrnd(randnumb);
        M(a,2)=unidrnd(randnumb);
    end

    %buat centroid
    c1 = [unidrnd(randnumb) unidrnd(randnumb)];
    c2 = [unidrnd(randnumb) unidrnd(randnumb)];
    c3 = [unidrnd(randnumb) unidrnd(randnumb)];
    c4 = [unidrnd(randnumb) unidrnd(randnumb)];
    c5 = [unidrnd(randnumb) unidrnd(randnumb)];

    c1_temp = -ones(1,2);
    c2_temp = -ones(1,2);
    c3_temp = -ones(1,2);
    c4_temp = -ones(1,2);
    c5_temp = -ones(1,2);

    iterasi = 0;
    while((c1(1,1)~=c1_temp(1,1)) && (c1(1,2)~=c1_temp(1,2)) && (c2(1,1)~=c2_temp(1,1)) && (c2(1,2)~=c2_temp(1,2)) && (c3(1,1)~=c3_temp(1,1)) && (c3(1,2)~=c3_temp(1,2)) && (c4(1,1)~=c4_temp(1,1)) && (c4(1,2)~=c4_temp(1,2)) && (c5(1,1)~=c5_temp(1,1)) && (c5(1,2)~=c5_temp(1,2)))
        iterasi = iterasi+1;
        jum_c1 = 0;
        jum_c2 = 0;
        jum_c3 = 0;
        jum_c4 = 0;
        jum_c5 = 0;
        for a=1:randnumb
            x = M(a,1);
            y = M(a,2);
            c1x = c1(1,1);
            c1y = c1(1,2);
            c2x = c2(1,1);
            c2y = c2(1,2);
            c3x = c3(1,1);
            c3y = c3(1,2);
            c4x = c4(1,1);
            c4y = c4(1,2);
            c5x = c5(1,1);
            c5y = c5(1,2);

            euc1 = sqrt((x - c1x)^2 + (y - c1y)^2);
            euc2 = sqrt((x - c2x)^2 + (y - c2y)^2);
            euc3 = sqrt((x - c3x)^2 + (y - c3y)^2);
            euc4 = sqrt((x - c4x)^2 + (y - c4y)^2);
            euc5 = sqrt((x - c5x)^2 + (y - c5y)^2);

            if((euc1 <= euc2)  &&  (euc1 <= euc3) && (euc1 <= euc4) && (euc1 <= euc5))
                label(a,1)=1;
                jum_c1 = jum_c1+1; %jumlah data pada cluster
                plot(M(a,1),M(a,2),'.b'); hold on
            elseif((euc2 <= euc3) && (euc2 <= euc4) && (euc2 <= euc5))
                label(a,1)=2;
                jum_c2 = jum_c2+1;
                plot(M(a,1),M(a,2),'.g'); hold on
            elseif((euc3 <= euc4) && (euc3 <= euc5))
                label(a,1)=3;
                jum_c3 = jum_c3+1;
                plot(M(a,1),M(a,2),'.r'); hold on
            elseif(euc4 <= euc5)
                label(a,1)=4;
                jum_c4 = jum_c4+1;
                plot(M(a,1),M(a,2),'.c'); hold on
            else
                label(a,1)=5;
                jum_c5 = jum_c5+1;
                plot(M(a,1),M(a,2),'.y'); hold on
            end
        end

        %mencari jumlah data pada cluster dengan kordinat x dan y
        jx_c1 = 0;
        jy_c1 = 0;
        jx_c2 = 0;
        jy_c2 = 0;
        jx_c3 = 0;
        jy_c3 = 0;
        jx_c4 = 0;
        jy_c4 = 0;
        jx_c5 = 0;
        jy_c5 = 0;

        for a=1:randnumb
            if(label(a,1)==1)
                jx_c1 = jx_c1 + M(a,1);
                jy_c1 = jy_c1 + M(a,2);
            elseif(label(a,1)==2)
                jx_c2 = jx_c2 + M(a,1);
                jy_c2 = jy_c2 + M(a,2);
            elseif(label(a,1)==3)
                jx_c3 = jx_c3 + M(a,1);
                jy_c3 = jy_c3 + M(a,2);
            elseif(label(a,1)==4)
                jx_c4 = jx_c4 + M(a,1);
                jy_c4 = jy_c4 + M(a,2);
            else
                jx_c5 = jx_c5 + M(a,1);
                jy_c5 = jy_c5 + M(a,2);
            end
        end

        %mencari rata"
        rx_c1 = jx_c1/jum_c1;
        ry_c1 = jy_c1/jum_c1;
        rx_c2 = jx_c2/jum_c2;
        ry_c2 = jy_c2/jum_c2;
        rx_c3 = jx_c3/jum_c3;
        ry_c3 = jy_c3/jum_c3;
        rx_c4 = jx_c4/jum_c4;
        ry_c4 = jy_c4/jum_c4;
        rx_c5 = jx_c5/jum_c5;
        ry_c5 = jy_c5/jum_c5;


        %pindah letak centroid lama
        c1_temp(1,1) = c1(1,1);
        c1_temp(1,2) = c1(1,2);
        c2_temp(1,1) = c2(1,1);
        c2_temp(1,2) = c2(1,2);
        c3_temp(1,1) = c3(1,1);
        c3_temp(1,2) = c3(1,2);
        c4_temp(1,1) = c4(1,1);
        c4_temp(1,2) = c4(1,2);
        c5_temp(1,1) = c5(1,1);
        c5_temp(1,2) = c5(1,2);


        %titik baru centroid
        c1(1,1) = round(rx_c1);
        c1(1,2) = round(ry_c1);
        c2(1,1) = round(rx_c2);
        c2(1,2) = round(ry_c2);
        c3(1,1) = round(rx_c3);
        c3(1,2) = round(ry_c3);
        c4(1,1) = round(rx_c4);
        c4(1,2) = round(ry_c4);
        c5(1,1) = round(rx_c5);
        c5(1,2) = round(ry_c5);


        disp('centroid baru 1 , 2 , 3 , 4 , 5');
        disp(c1);
        disp(c2);
        disp(c3);
        disp(c4);
        disp(c5);
    end
    disp(iterasi);
    axes(handles.axes1)
    plot(c1(:,1),c1(:,2),'+b','Markersize',12,'LineWidth',2); hold on
    plot(c2(:,1),c2(:,2),'+g','Markersize',12,'LineWidth',2); hold on
    plot(c3(:,1),c3(:,2),'+r','Markersize',12,'LineWidth',2); hold on
    plot(c4(:,1),c4(:,2),'+c','Markersize',12,'LineWidth',2); hold on
    plot(c5(:,1),c5(:,2),'+y','Markersize',12,'LineWidth',2); hold on

    plot(c1(:,1),c1(:,2),'ko','Markersize',12,'LineWidth',2); hold on
    plot(c2(:,1),c2(:,2),'ko','Markersize',12,'LineWidth',2); hold on
    plot(c3(:,1),c3(:,2),'ko','Markersize',12,'LineWidth',2); hold on
    plot(c4(:,1),c4(:,2),'ko','Markersize',12,'LineWidth',2); hold on
    plot(c5(:,1),c5(:,2),'ko','Markersize',12,'LineWidth',2); hold on
    grid on

end

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
