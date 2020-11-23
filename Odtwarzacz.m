function varargout = Odtwarzacz(varargin)
%ODTWARZACZ M-file for Odtwarzacz.fig
%      ODTWARZACZ, by itself, creates a new ODTWARZACZ or raises the existing
%      singleton*.
%
%      H = ODTWARZACZ returns the handle to a new ODTWARZACZ or the handle to
%      the existing singleton*.
%
%      ODTWARZACZ('Property','Value',...) c0reates a new ODTWARZACZ using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Odtwarzacz_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      ODTWARZACZ('CALLBACK') and ODTWARZACZ('CALLBACK',hObject,...) call the
%      local function named CALLBACK in ODTWARZACZ.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Odtwarzacz

% Last Modified by GUIDE v2.5 03-Dec-2018 09:30:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Odtwarzacz_OpeningFcn, ...
                   'gui_OutputFcn',  @Odtwarzacz_OutputFcn, ...
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


% --- Executes just before Odtwarzacz is made visible.
function Odtwarzacz_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Odtwarzacz
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Odtwarzacz wait for user response (see UIRESUME)
% uiwait(handles.figure1);
    global lock;
    global samples1;
    global samples2;
    global player;
    global k;
    
    lock = 1;
    samples1 = 0;
    samples2 = 0;
    player = 0;
    k=2^9;
    x=[-22050,22050];
    y=[0,0];
    plot(x,y,'r','Parent', handles.plot1);
    set(handles.plot1,'XLim', [-22050,22050],'YLim', [-100,100]);
    set(handles.plot1,'Color','k');
    set(handles.plot1,'XGrid','On','YGrid','On');
    set(handles.plot1,'XMinorGrid','On','YMinorGrid','On');
    set(handles.plot1,'XMinorTick','On','YMinorTick','On');
    set(handles.plot1,'XColor',[0 1 1],'YColor',[0 1 1]);
    set(handles.plot1,'XTick',[-20000,-15000,-10000,-5000,0,5000,10000,15000,20000]);
    set(handles.plot1,'XTicklabel',{'-20000','-15000','-10000','-5000','0','5000','10000','15000','20000'});
    set(handles.plot1,'YTick',[-100,-80,-60,-40,-20,0,20,40,60,80,100]);
    set(handles.plot1,'YTicklabel',{'100','80','60','40','20','0','20','40','60','80','100'});
    
%     plot(x,y,'r','Parent', handles.plot1);
%     set(handles.plot1,'XLim', [-22050,22050],'YLim', [-10,100]);
%     set(handles.plot1,'Color','k');
%     set(handles.plot1,'XGrid','On','YGrid','On');
%     set(handles.plot1,'XMinorGrid','On','YMinorGrid','On');
%     set(handles.plot1,'XMinorTick','On','YMinorTick','On');
%     set(handles.plot1,'XColor',[0 1 1],'YColor',[0 1 1]);
%     set(handles.plot1,'XTick',[-20000,-15000,-10000,-5000,0,5000,10000,15000,20000]);
%     set(handles.plot1,'XTicklabel',{'-20000','-15000','-10000','-5000','0','5000','10000','15000','20000'});
%     set(handles.plot1,'YTick',[-100,-80,-60,-40,-20,0,20,40,60,80,100]);
%     set(handles.plot1,'YTicklabel',{'100','80','60','40','20','0','20','40','60','80','100'});
%     
%     plot(x,y,'r','Parent', handles.plot2);
%     set(handles.plot2,'XLim', [-22050,22050],'YLim', [-10,100]);
%     set(handles.plot2,'Color','k');
%     set(handles.plot2,'XGrid','On','YGrid','On');
%     set(handles.plot2,'XMinorGrid','On','YMinorGrid','On');
%     set(handles.plot2,'XMinorTick','On','YMinorTick','On');
%     set(handles.plot2,'XColor',[0 1 1],'YColor',[0 1 1]);
%     set(handles.plot2,'XTick',[-20000,-15000,-10000,-5000,0,5000,10000,15000,20000]);
%     set(handles.plot2,'XTicklabel',{'-20000','-15000','-10000','-5000','0','5000','10000','15000','20000'});
%     set(handles.plot2,'YTick',[-100,-80,-60,-40,-20,0,20,40,60,80,100]);
%     set(handles.plot2,'YTicklabel',{'100','80','60','40','20','0','20','40','60','80','100'});

% --- Outputs from this function are returned to the command line.
function varargout = Odtwarzacz_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
    global player;
    if player ~= 0
        play(player);
        stop(player);
    end
    delete(hObject);



% --- Executes on selection change in audio_label.
function audiolist_Callback(hObject, eventdata, handles)
% hObject    handle to audio_label (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns audio_label contents as cell array
%        contents{get(hObject,'Value')} returns selected item from audio_label



% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global player;
    if player ~= 0
        pause(player);
    end


    
% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global player;
    global lock;
    %handles.t = timer('ExecutionMode', 'fixedRate','TimerFcn',{@moving,handles},'Period',0.5);
    if player ~= 0
        if lock ==1
            handles.t = timer('ExecutionMode', 'fixedDelay','TimerFcn',{@moving,handles},'Period',0.1);
            start(handles.t);
            lock=lock+1;
        end
    resume(player);
    %plotting(handles);
    moving(hObject, eventdata, handles);
    end



%<>-+-<>-+-<>-+-<>-+-<WCZYTYWANIE UTWORU>-+-<>-+-<>-+-<>-+-<>%

% --- Executes on button press in load.
function load_Callback(hObject, eventdata, handles)
% hObject    handle to load (see GCBO)audio
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    global player;      %utwór
    global V;           %obecna próbka
    global samples1;    %kana³ 1
    global samples2;    %kana³ 2
    global f;
    global k;
    [file, path] = uigetfile('*.mp3;*mp4;*m4a;*wav');
    if file == 0
        return;
    end
    
    set(handles.audiolist,'String',file);
    [d, fs] = audioread([path, file]);
    player = audioplayer(d, fs);

    samples1=d(:, 1);                        %podzia³ na kana³y
    %% %%samples2=d(:, 2);                        %
    set(handles.timeslider,'Max',player.TotalSamples);
    V=get(handles.timeslider,'Value');      %obecne po³o¿enie

    f = (0: fs/k: fs-fs/k);
    f = f-fs/2;

    plotting(handles);


    
%<>-+-<>-+-<>-+-<>-+-<RESET UTWORU>-+-<>-+-<>-+-<>-+-<>%

% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global player;
    if player ~= 0
        pause(player);
        play(player);
    end

% --- Executes on slider movement.
function timeslider_Callback(hObject, eventdata, handles)
% hObject    handle to timeslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
    global V;
    V = get(handles.timeslider, 'Value'); %obecne po³o¿enie
    plotting(handles);

    
% --- Executes during object creation, after setting all properties.
function timeslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timeslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
    if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor',[.9 .9 .9]);
    end



%<>-+-<>-+-<>-+-<>-+-<RYSOWANIE PRZEBIEGU>-+-<>-+-<>-+-<>-+-<>%

function plotting(handles)
    global V;
    global samples1;
    global samples2;
    global f;
    global k;
    %wyœwietlamy widmo dla ostatnio ods³uchanych 1024 próbek
    V0 = V-(k-1);
    if V0<1
        V0=1;
    end
    %plot(f/512, -FFTshift(abs(guardian2(samples2(V0:512: V), k))), 'b', f/512,FFTshift(abs(guardian2(samples1(V0:512: V), k))), 'r', 'Parent', handles.plot1);
    %% %%plot(f, -FFTshift(abs(guardian2(samples2(V0: V), k))), 'b', f, FFTshift(abs(guardian2(samples1(V0: V), k))), 'r', 'Parent', handles.plot1);
    plot(f, FFTshift(abs(guardian2(samples1(V0: V), k))), 'r', 'Parent', handles.plot1);
    set(handles.plot1,'XLim', [-22050, 22050],'YLim', [-100, 100]);
    set(handles.plot1,'Color', 'k');
    set(handles.plot1,'XGrid', 'On', 'YGrid', 'On');
    set(handles.plot1,'XMinorGrid', 'On', 'YMinorGrid', 'On');
    set(handles.plot1,'XMinorTick', 'On', 'YMinorTick', 'On');
    set(handles.plot1,'XColor',[0 1 1],'YColor',[0 1 1]);
    set(handles.plot1,'XTick',[-20000, -15000, -10000, -5000, 0, 5000, 10000, 15000, 20000]);
    set(handles.plot1,'XTicklabel',{'-20000', '-15000', '-10000', '-5000', '0', '5000', '10000', '15000', '20000'});
    set(handles.plot1,'YTick',[-100, -80, -60, -40, -20, 0, 20, 40, 60, 80, 100]);
    set(handles.plot1,'YTicklabel',{'100', '80', '60', '40', '20', '0', '20', '40', '60', '80', '100'});

    
    
    
%     plot(f, FFTshift(abs(guardian2(samples1(V0: V), k))), 'r', 'Parent', handles.plot1);
%     set(handles.plot1,'XLim', [-22050, 22050],'YLim', [-10, 100]);
%     set(handles.plot1,'Color', 'k');
%     set(handles.plot1,'XGrid', 'On', 'YGrid', 'On');
%     set(handles.plot1,'XMinorGrid', 'On', 'YMinorGrid', 'On');
%     set(handles.plot1,'XMinorTick', 'On', 'YMinorTick', 'On');
%     set(handles.plot1,'XColor',[0 1 1],'YColor',[0 1 1]);
%     set(handles.plot1,'XTick',[-20000, -15000, -10000, -5000, 0, 5000, 10000, 15000, 20000]);
%     set(handles.plot1,'XTicklabel',{'-20000', '-15000', '-10000', '-5000', '0', '5000', '10000', '15000', '20000'});
%     set(handles.plot1,'YTick',[-100, -80, -60, -40, -20, 0, 20, 40, 60, 80, 100]);
%     set(handles.plot1,'YTicklabel',{'100', '80', '60', '40', '20', '0', '20', '40', '60', '80', '100'});
%
%     plot(f,FFTshift(abs(guardian2(samples2(V0:V),k))),'r','Parent', handles.plot2);
%     set(handles.plot2,'XLim', [-22050,22050],'YLim', [-10,100]);
%     set(handles.plot2,'Color','k');
%     set(handles.plot2,'XGrid','On','YGrid','On');
%     set(handles.plot2,'XMinorGrid','On','YMinorGrid','On');
%     set(handles.plot2,'XMinorTick','On','YMinorTick','On');
%     set(handles.plot2,'XColor',[0 1 1],'YColor',[0 1 1]);
%     set(handles.plot2,'XTick',[-20000, -15000, -10000, -5000, 0, 5000, 10000, 15000, 20000]);
%     set(handles.plot2,'XTicklabel',{'-20000', '-15000', '-10000', '-5000', '0', '5000', '10000', '15000', '20000'});
%     set(handles.plot2,'YTick',[-100, -80, -60, -40, -20, 0, 20, 40, 60, 80, 100]);
%     set(handles.plot2,'YTicklabel',{'100', '80', '60', '40', '20', '0', '20', '40', '60', '80', '100'});

   


%<>-+-<>-+-<>-+-<>-+-<PRZESUWANIE PRZEBIEGU>-+-<>-+-<>-+-<>-+-<>%
function moving(obj, event, handles)
    global player;
    global V;
    V = player.CurrentSample;
    set(handles.timeslider, 'Value', V);
    plotting(handles);

%<>-+-<>-+-<>-+-<>-+-<>-+-<>-+-<>-+-<>-+-<>-+-<>-+-<>-+-<>-+-<>-+-<>-+-<>%
%                                   FFT
%<>-+-<>-+-<>-+-<>-+-<>-+-<>-+-<>-+-<>-+-<>-+-<>-+-<>-+-<>-+-<>-+-<>-+-<>%
%przesuniêcie po³owy widma na ujemn¹ czêstotliwoœæ
function [x] = FFTshift(x)
    K = length(x);
    X2 = x(1:K/2);
    x(1:K/2) = x(K/2+1:K);
    x(K/2+1:K) = X2;



%Odpowiednie przygotowanie iloœci próbek
function [X] = guardian2(x, N)   %x=próbki, N=ilosc probek FFT 
    N2 = 1;
    X = 0;
    
    while N2<N
       N2 = N2*2;
    end
    
    if abs(N2-N)<=abs(N2/2-N)   %N musi byæ potêg¹ liczby 2
        N = N2;
    else
        N = N2/2;
    end          
        
    if length(x)>N          %sprawdzanie czy liczba probek jest wiêksza od N2
        X = x(1: N);           %jeœli jest to ucinamy iloœæ próbek
    else
        X = zeros(1, N);    %jeœli nie jest to uzupe³niamy zerami
        X(1: length(x)) = x(1: length(x));
    end
    X = FFT2(X(1: N), N);     %FFT
        
        
        
%eveny i oddy :sk³adnik 1 to próbka 0, sk³adnik 2 to próbka 1 itd.
%eveny to sk³adniki 1,3,5,7... czyli próbki 0,2,4,6 itd.
%oddy  to sk³adniki 2,4,6,8... czyli próbki 1,3,5,7 itd.
function [X] = evenodd(x, N)       %x=coraz mniejszy DFT, N=ilosc skladnikow w x
    temp = zeros(1, N/2);
    for i = 1:(N/2)
        temp(i) = x(2*i);
    end
    for i = 1:N/2
        X(i) = x(2*i-1);
    end
    for i = 1:N/2
        X(i+N/2) = temp(i);
    end

    
%W³aœciwe FFT
function[X] = FFT2(x, N)
    if N < 2
        X = x;
        return
    else
        X = evenodd(x, N);
        X(1:N/2)   = FFT2(X(1:N/2), N/2);   %podzia³ na eveny
        X(N/2+1:N) = FFT2(X(N/2+1:N), N/2); %podzia³ na oddy
        for k = 1:N/2                       %motylek <3
            even = complex(X(k));
            odd  = complex(X(k+N/2));
            Wn   = complex(exp(complex(0, -2*pi*(k-1)/N)));
            X(k)    = even + Wn*odd;
            X(k+N/2)= even - Wn*odd;
        end
        return
    end
    
%<>-+-<>-+-<>-+-<>-+-<>-+-<>-+-<>-+-<>-+-<>-+-<>-+-<>-+-<>-+-<>-+-<>-+-<>%
%                                   FFT
%<>-+-<>-+-<>-+-<>-+-<>-+-<>-+-<>-+-<>-+-<>-+-<>-+-<>-+-<>-+-<>-+-<>-+-<>%
