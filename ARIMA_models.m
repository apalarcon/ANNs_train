clear
%Seasonal ARIMA Model .

% Cargando los datos de las estaciones pluviometricas INRH 
% cuenca Almendares - Vento

% 1- hasta 2014
A12=funp12(1); 
A12a=A12(1:12,1:43);
A12b=A12(1:12,1:44);
A12c=A12(1:12,1:45);
A12d=A12(1:12,1:46);
A12e=A12(1:12,1:47);
A12f=A12(1:12,1:48);

A15=funp15(1); 
A15a=A15(1:12,1:108);
A15b=A15(1:12,1:109);
A15c=A15(1:12,1:110);
A15d=A15(1:12,1:111);
A15e=A15(1:12,1:112);
A15f=A15(1:12,1:113);

A166=funp166(1); 
A166a=A166(1:12,1:33);
A166b=A166(1:12,1:34);
A166c=A166(1:12,1:35);
A166d=A166(1:12,1:36);
A166e=A166(1:12,1:37);
A166f=A166(1:12,1:38);

A284=funp284(1); 
A284a=A284(1:12,1:14);
A284b=A284(1:12,1:15);
A284c=A284(1:12,1:16);
A284d=A284(1:12,1:17);
A284e=A284(1:12,1:18);
A284f=A284(1:12,1:19);


%A285=funp285(1); 
%A293=funp293(1); 
%A303=funp303(1); 

A338=funp338(1); 
A338a=A338(1:12,1:36);
A338b=A338(1:12,1:37);
A338c=A338(1:12,1:38);
A338d=A338(1:12,1:39);
A338e=A338(1:12,1:40);
A338f=A338(1:12,1:41);

%A340=funp340(1); 
%A341=funp341(1); 

A343=funp343(1); 
A343a=A343(1:12,1:33);
A343b=A343(1:12,1:34);
A343c=A343(1:12,1:35);
A343d=A343(1:12,1:36);
A343e=A343(1:12,1:37);
A343f=A343(1:12,1:38);

A441=funp441(1); 
A441a=A441(1:12,1:17);
A441b=A441(1:12,1:18);
A441c=A441(1:12,1:19);
A441d=A441(1:12,1:20);
A441e=A441(1:12,1:21);
A441f=A441(1:12,1:22);

A451=funp451(1); 
A451a=A451(1:12,1:19);
A451b=A451(1:12,1:20);
A451c=A451(1:12,1:21);
A451d=A451(1:12,1:22);
A451e=A451(1:12,1:23);
A451f=A451(1:12,1:24);
%A456=funp456(1); 

%Apmedia=funpmedia(1); 

% Transformando la matriz de datos en un vector
y12a=reshape(A12a,[12*length(A12a),1]); %hasta 2013
y12b=reshape(A12b,[12*length(A12b),1]); %hasta 2014
y12c=reshape(A12c,[12*length(A12c),1]); %hasta 2015
y12d=reshape(A12d,[12*length(A12d),1]); %hasta 2016
y12e=reshape(A12e,[12*length(A12e),1]); %hasta 2017
y12f=reshape(A12f,[12*length(A12f),1]); %hasta 2018

y15a=reshape(A15a,[12*length(A15a),1]);
y15b=reshape(A15b,[12*length(A15b),1]);
y15c=reshape(A15c,[12*length(A15c),1]);
y15d=reshape(A15d,[12*length(A15d),1]);
y15e=reshape(A15e,[12*length(A15e),1]);
y15f=reshape(A15f,[12*length(A15f),1]);

y166a=reshape(A166a,[12*length(A166a),1]);
y166b=reshape(A166b,[12*length(A166b),1]);
y166c=reshape(A166c,[12*length(A166c),1]);
y166d=reshape(A166d,[12*length(A166d),1]);
y166e=reshape(A166e,[12*length(A166e),1]);
y166f=reshape(A166f,[12*length(A166f),1]);

y284a=reshape(A284a,[12*length(A284a),1]);
y284b=reshape(A284b,[12*length(A284b),1]);
y284c=reshape(A284c,[12*length(A284c),1]);
y284d=reshape(A284d,[12*length(A284d),1]);
y284e=reshape(A284e,[12*length(A284e),1]);
y284f=reshape(A284f,[12*length(A284f),1]);

%y285=reshape(A285,[12*length(A285),1]);
% y293a=reshape(A293,[12*length(A293)-72,1]);
% y293b=reshape(A293,[12*length(A293)-60,1]);
% y293c=reshape(A293,[12*length(A293)-48,1]);
% y293d=reshape(A293,[12*length(A293)-36,1]);
% y293e=reshape(A293,[12*length(A293)-24,1]);
% y293f=reshape(A293,[12*length(A293)-12,1]);

%y303=reshape(A303,[12*length(A303),1]);
y338a=reshape(A338a,[12*length(A338a),1]);
y338b=reshape(A338b,[12*length(A338b),1]);
y338c=reshape(A338c,[12*length(A338c),1]);
y338d=reshape(A338d,[12*length(A338d),1]);
y338e=reshape(A338e,[12*length(A338e),1]);
y338f=reshape(A338f,[12*length(A338f),1]);

%y340=reshape(A340,[12*length(A340),1]);
%y341=reshape(A341,[12*length(A341),1]);

y343a=reshape(A343a,[12*length(A343a),1]);
y343b=reshape(A343b,[12*length(A343b),1]);
y343c=reshape(A343c,[12*length(A343c),1]);
y343d=reshape(A343d,[12*length(A343d),1]);
y343e=reshape(A343e,[12*length(A343e),1]);
y343f=reshape(A343f,[12*length(A343f),1]);

y441a=reshape(A441a,[12*length(A441a),1]);
y441b=reshape(A441b,[12*length(A441b),1]);
y441c=reshape(A441c,[12*length(A441c),1]);
y441d=reshape(A441d,[12*length(A441d),1]);
y441e=reshape(A441e,[12*length(A441e),1]);
y441f=reshape(A441f,[12*length(A441f),1]);

y451a=reshape(A451a,[12*length(A451a),1]);
y451b=reshape(A451b,[12*length(A451b),1]);
y451c=reshape(A451c,[12*length(A451c),1]);
y451d=reshape(A451d,[12*length(A451d),1]);
y451e=reshape(A451e,[12*length(A451e),1]);
y451f=reshape(A451f,[12*length(A451f),1]);

%y456=reshape(A456,[12*length(A456),1]);
% ypmedia=reshape(Apmedia,[12*length(Apmedia)-48,1]);
% ypmedia=reshape(Apmedia,[12*length(Apmedia)-36,1]);
% ypmedia=reshape(Apmedia,[12*length(Apmedia)-24,1]);
% ypmedia=reshape(Apmedia,[12*length(Apmedia)-12,1]);


T12a=length(y12a);T12b=length(y12b);T12c=length(y12c);T12d=length(y12d);T12e=length(y12e);T12f=length(y12f);
T15a=length(y15a);T15b=length(y15b);T15c=length(y15c);T15d=length(y15d);T15e=length(y15e);T15f=length(y15f);
T166a=length(y166a);T166b=length(y166b);T166c=length(y166c);T166d=length(y166d);T166e=length(y166e);T166f=length(y166f);
T284a=length(y284a);T284b=length(y284b);T284c=length(y284c);T284d=length(y284d);T284e=length(y284e);T284f=length(y284f);
T338a=length(y338a);T338b=length(y338b);T338c=length(y338c);T338d=length(y338d);T338e=length(y338e);T338f=length(y338f);
%T340=length(y340);T341=length(y341);
T343a=length(y343a);T343b=length(y343b);T343c=length(y343c);T343d=length(y343d);T343e=length(y343e);T343f=length(y343f);
T441a=length(y441a);T441b=length(y441b);T441c=length(y441c);T441d=length(y441d);T441e=length(y441e);T441f=length(y441f);
T451a=length(y451a);T451b=length(y451b);T451c=length(y451c);T451d=length(y451d);T451e=length(y451e);T451f=length(y451f);

%Tpmedia=length(ypmedia);

paso=1;
dates12a=1:paso:T12a;dates12b=1:paso:T12b;dates12c=1:paso:T12c;dates12d=1:paso:T12d;dates12e=1:paso:T12e;dates12f=1:paso:T12f;
dates15a=1:paso:T15a;dates15b=1:paso:T15b;dates15c=1:paso:T15c;dates15d=1:paso:T15d;dates15e=1:paso:T15e;dates15f=1:paso:T15f;
dates166a=1:paso:T166a;dates166b=1:paso:T166b;dates166c=1:paso:T166c;dates166d=1:paso:T166d;dates166e=1:paso:T166e;dates166f=1:paso:T166f;
dates284a=1:paso:T284a;dates284b=1:paso:T284b;dates284c=1:paso:T284c;dates284d=1:paso:T284d;dates284e=1:paso:T284e;dates284f=1:paso:T284f;
dates338a=1:paso:T338a;dates338b=1:paso:T338b;dates338c=1:paso:T338c;dates338d=1:paso:T338d;dates338e=1:paso:T338e;dates338f=1:paso:T338f;
dates343a=1:paso:T343a;dates343b=1:paso:T343b;dates343c=1:paso:T343c;dates343d=1:paso:T343d;dates343e=1:paso:T343e;dates343f=1:paso:T343f;
dates441a=1:paso:T441a;dates441b=1:paso:T441b;dates441c=1:paso:T441c;dates441d=1:paso:T441d;dates441e=1:paso:T441e;dates441f=1:paso:T441f;
dates451a=1:paso:T451a;dates451b=1:paso:T451b;dates451c=1:paso:T451c;dates451d=1:paso:T451d;dates451e=1:paso:T451e;dates451f=1:paso:T451f;

%dates293=1:paso:T293;
%dates340=1:paso:T340;dates341=1:paso:T341;
%datespmedia=1:paso:Tpmedia;

nSim = 12; % Forecast period
estInds12a = 1:(T12a-nSim);estInds12b = 1:(T12b-nSim);estInds12c = 1:(T12c-nSim);estInds12d = 1:(T12d-nSim);estInds12e = 1:(T12e-nSim);estInds12f = 1:(T12f-nSim);
estInds15a = 1:(T15a-nSim);estInds15b = 1:(T15b-nSim);estInds15c = 1:(T15c-nSim);estInds15d = 1:(T15d-nSim);estInds15e = 1:(T15e-nSim);estInds15f = 1:(T15f-nSim);
estInds166a = 1:(T166a-nSim);estInds166b = 1:(T166b-nSim);estInds166c = 1:(T166c-nSim);estInds166d = 1:(T166d-nSim);estInds166e = 1:(T166e-nSim);estInds166f = 1:(T166f-nSim);
estInds284a = 1:(T284a-nSim);estInds284b = 1:(T284b-nSim);estInds284c = 1:(T284c-nSim);estInds284d = 1:(T284d-nSim);estInds284e = 1:(T284e-nSim);estInds284f = 1:(T284f-nSim);
estInds338a = 1:(T338a-nSim);estInds338b = 1:(T338b-nSim);estInds338c = 1:(T338c-nSim);estInds338d = 1:(T338d-nSim);estInds338e = 1:(T338e-nSim);estInds338f = 1:(T338f-nSim);
estInds343a = 1:(T343a-nSim);estInds343b = 1:(T343b-nSim);estInds343c = 1:(T343c-nSim);estInds343d = 1:(T343d-nSim);estInds343e = 1:(T343e-nSim);estInds343f = 1:(T343f-nSim);
estInds441a = 1:(T441a-nSim);estInds441b = 1:(T441b-nSim);estInds441c = 1:(T441c-nSim);estInds441d = 1:(T441d-nSim);estInds441e = 1:(T441e-nSim);estInds441f = 1:(T441f-nSim);
estInds451a = 1:(T451a-nSim);estInds451b = 1:(T451b-nSim);estInds451c = 1:(T451c-nSim);estInds451d = 1:(T451d-nSim);estInds451e = 1:(T451e-nSim);estInds451f = 1:(T451f-nSim);

%estInds293 = 1:(T293-nSim);
%estInds340 = 1:(T340-nSim);estInds341 = 1:(T341-nSim);
%estIndspmedia = 1:(Tpmedia-nSim);

% foreInds12 = (T12-nSim+1):T12;foreInds15 = (T15-nSim+1):T15;foreInds166 = (T166-nSim+1):T166;
% foreInds284 = (T284-nSim+1):T284;foreInds293 = (T293-nSim+1):T293;foreInds338 = (T338-nSim+1):T338;
% %foreInds340 = (T340-nSim+1):T340;foreInds341 = (T341-nSim+1):T341;
% foreInds343 = (T343-nSim+1):T343;
% foreInds441 = (T441-nSim+1):T441;foreInds451 = (T451-nSim+1):T451;
% foreIndspmedia = (Tpmedia-nSim+1):Tpmedia;

Mdl = regARIMA('D',1,'Seasonality',48,'MALags',[1,2,3,4,5,6,7,8,9,10,11,12],'SMALags',48,...
    'Intercept',0);


EstMdl12a = estimate(Mdl,y12a(estInds12a));
EstMdl12b = estimate(Mdl,y12b(estInds12b));
EstMdl12c = estimate(Mdl,y12c(estInds12c));
EstMdl12d = estimate(Mdl,y12d(estInds12d));
EstMdl12e = estimate(Mdl,y12e(estInds12e));
EstMdl12f = estimate(Mdl,y12f(estInds12f));

EstMdl15a = estimate(Mdl,y15a(estInds15a));
EstMdl15b= estimate(Mdl,y15b(estInds15b));
EstMdl15c = estimate(Mdl,y15c(estInds15c));
EstMdl15d = estimate(Mdl,y15d(estInds15d));
EstMdl15e = estimate(Mdl,y15e(estInds15e));
EstMdl15f = estimate(Mdl,y15f(estInds15f));

EstMdl166a = estimate(Mdl,y166a(estInds166a));
EstMdl166b = estimate(Mdl,y166b(estInds166b));
EstMdl166c = estimate(Mdl,y166c(estInds166c));
EstMdl166d = estimate(Mdl,y166d(estInds166d));
EstMdl166e = estimate(Mdl,y166e(estInds166e));
EstMdl166f = estimate(Mdl,y166f(estInds166f));

EstMdl284a = estimate(Mdl,y284a(estInds284a));
EstMdl284b = estimate(Mdl,y284b(estInds284b));
EstMdl284c = estimate(Mdl,y284c(estInds284c));
EstMdl284d = estimate(Mdl,y284d(estInds284d));
EstMdl284e = estimate(Mdl,y284e(estInds284e));
EstMdl284f = estimate(Mdl,y284f(estInds284f));

EstMdl338a = estimate(Mdl,y338a(estInds338a));
EstMdl338b = estimate(Mdl,y338b(estInds338b));
EstMdl338c = estimate(Mdl,y338c(estInds338c));
EstMdl338d = estimate(Mdl,y338d(estInds338d));
EstMdl338e = estimate(Mdl,y338e(estInds338e));
EstMdl338f = estimate(Mdl,y338f(estInds338f));

EstMdl343a = estimate(Mdl,y343a(estInds343a));
EstMdl343b = estimate(Mdl,y343b(estInds343b));
EstMdl343c = estimate(Mdl,y343c(estInds343c));
EstMdl343d = estimate(Mdl,y343d(estInds343d));
EstMdl343e = estimate(Mdl,y343e(estInds343e));
EstMdl343f = estimate(Mdl,y343f(estInds343f));

EstMdl441a = estimate(Mdl,y441a(estInds441a));
EstMdl441b = estimate(Mdl,y441b(estInds441b));
EstMdl441c = estimate(Mdl,y441c(estInds441c));
EstMdl441d = estimate(Mdl,y441d(estInds441d));
EstMdl441e = estimate(Mdl,y441e(estInds441e));
EstMdl441f = estimate(Mdl,y441f(estInds441f));

EstMdl451a = estimate(Mdl,y451a(estInds451a));
EstMdl451b = estimate(Mdl,y451b(estInds451b));
EstMdl451c = estimate(Mdl,y451c(estInds451c));
EstMdl451d = estimate(Mdl,y451d(estInds451d));
EstMdl451e = estimate(Mdl,y451e(estInds451e));
EstMdl451f = estimate(Mdl,y451f(estInds451f));

%EstMdl293 = estimate(Mdl,y293(estInds293));
%EstMdl340 = estimate(Mdl,y340(estInds340));
%EstMdl341 = estimate(Mdl,y341(estInds341));
%EstMdlpmedia = estimate(Mdl,ypmedia(estIndspmedia));

[YF12a] = forecast(EstMdl12a,nSim,'Y0',y12a(estInds12a));
[YF12b] = forecast(EstMdl12b,nSim,'Y0',y12b(estInds12b));
[YF12c] = forecast(EstMdl12c,nSim,'Y0',y12c(estInds12c));
[YF12d] = forecast(EstMdl12d,nSim,'Y0',y12d(estInds12d));
[YF12e] = forecast(EstMdl12e,nSim,'Y0',y12e(estInds12e));
[YF12f] = forecast(EstMdl12f,nSim,'Y0',y12f(estInds12f));

[YF15a] = forecast(EstMdl15a,nSim,'Y0',y15a(estInds15a));
[YF15b] = forecast(EstMdl15b,nSim,'Y0',y15b(estInds15b));
[YF15c] = forecast(EstMdl15c,nSim,'Y0',y15c(estInds15c));
[YF15d] = forecast(EstMdl15d,nSim,'Y0',y15d(estInds15d));
[YF15e] = forecast(EstMdl15e,nSim,'Y0',y15e(estInds15e));
[YF15f] = forecast(EstMdl15f,nSim,'Y0',y15f(estInds15f));

[YF166a] = forecast(EstMdl166a,nSim,'Y0',y166a(estInds166a));
[YF166b] = forecast(EstMdl166b,nSim,'Y0',y166b(estInds166b));
[YF166c] = forecast(EstMdl166c,nSim,'Y0',y166c(estInds166c));
[YF166d] = forecast(EstMdl166d,nSim,'Y0',y166d(estInds166d));
[YF166e] = forecast(EstMdl166e,nSim,'Y0',y166e(estInds166e));
[YF166f] = forecast(EstMdl166f,nSim,'Y0',y166f(estInds166f));

[YF284a] = forecast(EstMdl284a,nSim,'Y0',y284a(estInds284a));
[YF284b] = forecast(EstMdl284b,nSim,'Y0',y284b(estInds284b));
[YF284c] = forecast(EstMdl284c,nSim,'Y0',y284c(estInds284c));
[YF284d] = forecast(EstMdl284d,nSim,'Y0',y284d(estInds284d));
[YF284e] = forecast(EstMdl284e,nSim,'Y0',y284e(estInds284e));
[YF284f] = forecast(EstMdl284f,nSim,'Y0',y284f(estInds284f));

[YF338a] = forecast(EstMdl338a,nSim,'Y0',y338a(estInds338a));
[YF338b] = forecast(EstMdl338b,nSim,'Y0',y338b(estInds338b));
[YF338c] = forecast(EstMdl338c,nSim,'Y0',y338c(estInds338c));
[YF338d] = forecast(EstMdl338d,nSim,'Y0',y338d(estInds338d));
[YF338e] = forecast(EstMdl338e,nSim,'Y0',y338e(estInds338e));
[YF338f] = forecast(EstMdl338f,nSim,'Y0',y338f(estInds338f));

[YF343a] = forecast(EstMdl343a,nSim,'Y0',y343a(estInds343a));
[YF343b] = forecast(EstMdl343b,nSim,'Y0',y343b(estInds343b));
[YF343c] = forecast(EstMdl343c,nSim,'Y0',y343c(estInds343c));
[YF343d] = forecast(EstMdl343d,nSim,'Y0',y343d(estInds343d));
[YF343e] = forecast(EstMdl343e,nSim,'Y0',y343e(estInds343e));
[YF343f] = forecast(EstMdl343f,nSim,'Y0',y343f(estInds343f));

[YF441a] = forecast(EstMdl441a,nSim,'Y0',y441a(estInds441a));
[YF441b] = forecast(EstMdl441b,nSim,'Y0',y441b(estInds441b));
[YF441c] = forecast(EstMdl441c,nSim,'Y0',y441c(estInds441c));
[YF441d] = forecast(EstMdl441d,nSim,'Y0',y441d(estInds441d));
[YF441e] = forecast(EstMdl441e,nSim,'Y0',y441e(estInds441e));
[YF441f] = forecast(EstMdl441c,nSim,'Y0',y441f(estInds441f));

[YF451a] = forecast(EstMdl451a,nSim,'Y0',y451a(estInds451a));
[YF451b] = forecast(EstMdl451b,nSim,'Y0',y451b(estInds451b));
[YF451c] = forecast(EstMdl451c,nSim,'Y0',y451c(estInds451c));
[YF451d] = forecast(EstMdl451d,nSim,'Y0',y451d(estInds451d));
[YF451e] = forecast(EstMdl451e,nSim,'Y0',y451e(estInds451e));
[YF451f] = forecast(EstMdl451f,nSim,'Y0',y451f(estInds451f));

%[YF293] = forecast(EstMdl293,nSim,'Y0',y293(estInds293));
%[YF340] = forecast(EstMdl340,nSim,'Y0',y340(estInds340));
%[YF341] = forecast(EstMdl341,nSim,'Y0',y341(estInds341));

%[YFpmedia] = forecast(EstMdlpmedia,nSim,'Y0',ypmedia(estIndspmedia));
P12=[YF12a,YF12b,YF12c,YF12d,YF12e,YF12f];%P12=P12'
V12=reshape(P12,[12*6,1]); 

P15=[YF15a,YF15b,YF15c,YF15d,YF15e,YF15f];%P15=P15'
V15=reshape(P15,[12*6,1]); 

P166=[YF166a,YF166b,YF166c,YF166d,YF166e,YF166f];%P166=P166'
V166=reshape(P166,[12*6,1]);

P284=[YF284a,YF284b,YF284c,YF284d,YF284e,YF284f];P284=P284'
V284=reshape(P284,[12*6,1]);

P338=[YF338a,YF338b,YF338c,YF338d,YF338e,YF338f];%P338=P338'
V338=reshape(P338,[12*6,1]);

P343=[YF343a,YF343b,YF343c,YF343d,YF343e,YF343f];%P343=P343'
V343=reshape(P343,[12*6,1]);

P441=[YF441a,YF441b,YF441c,YF441d,YF441e,YF441f];%P441=P441'
V441=reshape(P441,[12*6,1]);

P451=[YF451a,YF451b,YF451c,YF451d,YF451e,YF451f];%P451=P451'
V451=reshape(P451,[12*6,1]);

R12=[y12a(T12a+1-nSim:T12a),y12b(T12b+1-nSim:T12b),...
    y12c(T12c+1-nSim:T12c),y12d(T12d+1-nSim:T12d),...
    y12e(T12e+1-nSim:T12e),y12f(T12f+1-nSim:T12f)];
D12=reshape(R12,[12*6,1]); 

R15=[y15a(T15a+1-nSim:T15a),y15b(T15b+1-nSim:T15b),...
    y15c(T15c+1-nSim:T15c),y15d(T15d+1-nSim:T15d),...
    y15e(T15e+1-nSim:T15e),y15f(T15f+1-nSim:T15f)];
D15=reshape(R15,[12*6,1]); 

R166=[y166a(T166a+1-nSim:T166a),y166b(T166b+1-nSim:T166b),...
    y166c(T166c+1-nSim:T166c),y166d(T166d+1-nSim:T166d),...
    y166e(T166e+1-nSim:T166e),y166f(T166f+1-nSim:T166f)];
D166=reshape(R166,[12*6,1]); 

R284=[y284a(T284a+1-nSim:T284a),y284b(T284b+1-nSim:T284b),...
    y284c(T284c+1-nSim:T284c),y284d(T284d+1-nSim:T284d),...
    y284e(T284e+1-nSim:T284e),y284f(T284f+1-nSim:T284f)];
D284=reshape(R284,[12*6,1]); 

R338=[y338a(T338a+1-nSim:T338a),y338b(T338b+1-nSim:T338b),...
    y338c(T338c+1-nSim:T338c),y338d(T338d+1-nSim:T338d),...
    y338e(T338e+1-nSim:T338e),y338f(T338f+1-nSim:T338f)];
D338=reshape(R338,[12*6,1]); 

R343=[y343a(T343a+1-nSim:T343a),y343b(T343b+1-nSim:T343b),...
    y343c(T343c+1-nSim:T343c),y343d(T343d+1-nSim:T343d),...
    y343e(T343e+1-nSim:T343e),y343f(T343f+1-nSim:T343f)];
D343=reshape(R343,[12*6,1]); 

R441=[y441a(T441a+1-nSim:T441a),y441b(T441b+1-nSim:T441b),...
    y441c(T441c+1-nSim:T441c),y441d(T441d+1-nSim:T441d),...
    y441e(T441e+1-nSim:T441e),y441f(T441f+1-nSim:T441f)];
D441=reshape(R441,[12*6,1]); 

R451=[y451a(T451a+1-nSim:T451a),y451b(T451b+1-nSim:T451b),...
    y451c(T451c+1-nSim:T451c),y451d(T451d+1-nSim:T451d),...
    y451e(T451e+1-nSim:T451e),y451f(T451f+1-nSim:T451f)];
D451=reshape(R451,[12*6,1]); 

corr12=corr(V12,D12);
corr15=corr(V15,D15);
corr166=corr(V166,D166);
corr284=corr(V284,D284);
corr338=corr(V338,D338);
corr343=corr(V343,D343);
corr441=corr(V441,D441);
corr451=corr(V451,D451);

corrglobal=[corr12 corr15 corr166 corr284 corr338 corr343 corr441 corr451];
pluviometros=[12;15;166;284;338;343;441;451];
for i = 1:length(pluviometros)
    rcritp(i)=0.497; %r critico de Pearson para 10 % de significancia y 10 grados de nivertad
end;

figure
hold on
h1=plot(pluviometros,rcritp,'b--')
h2=plot(pluviometros,corrglobal,'mo-')
title('Correlación global de cada estacion - Periodo Ene/2014-Dic/2019')
xlabel ('Equipo')
ylabel ('Coeficiente de correlación')
legend([h1,h2],' rcrit 10% ','r equipos','Location','NorthWest')


correl12a=corr(YF12a,y12a(T12a+1-nSim:T12a));
correl12b=corr(YF12b,y12b(T12b+1-nSim:T12b));
correl12c=corr(YF12c,y12c(T12c+1-nSim:T12c));
correl12d=corr(YF12d,y12d(T12d+1-nSim:T12d));
correl12e=corr(YF12e,y12e(T12e+1-nSim:T12e));
correl12f=corr(YF12f,y12f(T12f+1-nSim:T12f));



anhos=2014:2019;
for i = 1:length(anhos)
    rcrit(i)=0.497; %r critico de Pearson para 10 % de significancia y 10 grados de libertad
end;

vector12=[correl12a,correl12b,correl12c,correl12d,correl12e,correl12f];
figure
hold on
h1=plot(anhos,rcrit,'b--');
h2=plot(anhos,vector12,'ro-');
title('P - 12')
xlabel ('Años')
ylabel ('Coeficiente de correlación')
legend([h1,h2],'rcrit 10% ','r pronóstico','Location','NorthWest')

correl15a=corr(YF15a,y15a(T15a+1-nSim:T15a));
correl15b=corr(YF15b,y15b(T15a+1-nSim:T15a));
correl15c=corr(YF15c,y15c(T15a+1-nSim:T15a));
correl15d=corr(YF15d,y15d(T15a+1-nSim:T15a));
correl15e=corr(YF15e,y15e(T15a+1-nSim:T15a));
correl15f=corr(YF15f,y15f(T15a+1-nSim:T15a));

vector15=[correl15a,correl15b,correl15c,correl15d,correl15e,correl15f];
figure
hold on
h1=plot(anhos,rcrit,'b--');
h2=plot(anhos,vector15,'ro-');
title('P - 15')
xlabel ('Años')
ylabel ('Coeficiente de correlación')
legend([h1,h2],' rcrit 10% ','r pronóstico','Location','NorthWest')

correl166a=corr(YF166a,y166a(T166a+1-nSim:T166a));
correl166b=corr(YF166b,y166b(T166b+1-nSim:T166b));
correl166c=corr(YF166c,y166c(T166c+1-nSim:T166c));
correl166d=corr(YF166d,y166d(T166d+1-nSim:T166d));
correl166e=corr(YF166e,y166e(T166e+1-nSim:T166e));
correl166f=corr(YF166f,y166f(T166f+1-nSim:T166f));

vector166=[correl166a,correl166b,correl166c,correl166d,correl166e,correl166f];
figure
hold on
h1=plot(anhos,rcrit,'b--')
h2=plot(anhos,vector166,'ro-')
title('P - 166')
xlabel ('Años')
ylabel ('Coeficiente de correlación')
legend([h1,h2],' rcrit 10% ','r pronóstico','Location','NorthWest')


correl284a=corr(YF284a,y284a(T284a+1-nSim:T284a));
correl284b=corr(YF284b,y284b(T284b+1-nSim:T284b));
correl284c=corr(YF284c,y284c(T284c+1-nSim:T284c));
correl284d=corr(YF284d,y284d(T284d+1-nSim:T284d));
correl284e=corr(YF284e,y284e(T284e+1-nSim:T284e));
correl284f=corr(YF284f,y284f(T284f+1-nSim:T284f));

vector284=[correl284a,correl284b,correl284c,correl284d,correl284e,correl284f];
figure
hold on
h1=plot(anhos,rcrit,'b--')
h2=plot(anhos,vector284,'ro-')
title('P - 284')
xlabel ('Años')
ylabel ('Coeficiente de correlación')
legend([h1,h2],' rcrit 10% ','r pronóstico','Location','NorthWest')


correl338a=corr(YF338a,y338a(T338a+1-nSim:T338a));
correl338b=corr(YF338b,y338b(T338b+1-nSim:T338b));
correl338c=corr(YF338c,y338c(T338c+1-nSim:T338c));
correl338d=corr(YF338d,y338d(T338d+1-nSim:T338d));
correl338e=corr(YF338e,y338e(T338e+1-nSim:T338e));
correl338f=corr(YF338f,y338f(T338f+1-nSim:T338f));

vector338=[correl338a,correl338b,correl338c,correl338d,correl338e,correl338f];
figure
hold on
h1=plot(anhos,rcrit,'b--')
h2=plot(anhos,vector338,'ro-')
title('P - 338')
xlabel ('Años')
ylabel ('Coeficiente de correlación')
legend([h1,h2],' rcrit 10% ','r pronóstico','Location','NorthWest')

correl343a=corr(YF343a,y343a(T343a+1-nSim:T343a));
correl343b=corr(YF343b,y343b(T343b+1-nSim:T343b));
correl343c=corr(YF343c,y343c(T343c+1-nSim:T343c));
correl343d=corr(YF343d,y343d(T343d+1-nSim:T343d));
correl343e=corr(YF343e,y343e(T343e+1-nSim:T343e));
correl343f=corr(YF343f,y343f(T343f+1-nSim:T343f));

vector343=[correl343a,correl343b,correl343c,correl343d,correl343e,correl343f];
figure
hold on
h1=plot(anhos,rcrit,'b--')
h2=plot(anhos,vector343,'ro-')
title('P - 343')
xlabel ('Años')
ylabel ('Coeficiente de correlación')
legend([h1,h2],' rcrit 10% ','r pronóstico','Location','NorthWest')

correl441a=corr(YF441a,y441a(T441a+1-nSim:T441a));
correl441b=corr(YF441b,y441b(T441b+1-nSim:T441b));
correl441c=corr(YF441c,y441c(T441c+1-nSim:T441c));
correl441d=corr(YF441d,y441d(T441d+1-nSim:T441d));
correl441e=corr(YF441e,y441e(T441e+1-nSim:T441e));
correl441f=corr(YF441f,y441f(T441f+1-nSim:T441f));

vector441=[correl441a,correl441b,correl441c,correl441d,correl441e,correl441f];
figure
hold on
h1=plot(anhos,rcrit,'b--')
h2=plot(anhos,vector441,'ro-')
title('P - 441')
xlabel ('Años')
ylabel ('Coeficiente de correlación')
legend([h1,h2],' rcrit 10% ','r pronóstico','Location','NorthWest')

correl451a=corr(YF451a,y451a(T451a+1-nSim:T451a));
correl451b=corr(YF451b,y451b(T451b+1-nSim:T451b));
correl451c=corr(YF451c,y451c(T451c+1-nSim:T451c));
correl451d=corr(YF451d,y451d(T451d+1-nSim:T451d));
correl451e=corr(YF451e,y451e(T451e+1-nSim:T451e));
correl451f=corr(YF451f,y451f(T451f+1-nSim:T451f));

vector451=[correl451a,correl451b,correl451c,correl451d,correl451e,correl451f];

figure
hold on
h1=plot(anhos,rcrit,'b--')
h2=plot(anhos,vector451,'ro-')
title('P - 451')
xlabel ('Años')
ylabel ('Coeficiente de correlación')
legend([h1,h2],' rcrit 10% ','r pronóstico','Location','NorthWest')


%correlpmedia=corr(YFpmedia,ypmedia_1(1:nSim))

figure
title('P - 12 Jan/2014-Dec/2019')
hold on
h1 = plot(V12,'Color','k','LineWidth',1);
h2 = plot(D12,'m-','LineWidth',1);
legend([h1,h2],' ARIMA Forecast ','Observations','Location','NorthWest')
axis tight
hold off

figure
title('P - 15 Jan/2014-Dec/2019')
hold on
h1 = plot(V15,'Color','k','LineWidth',1);
h2 = plot(D15,'m-','LineWidth',1);
legend([h1,h2],' ARIMA Forecast ','Observations','Location','NorthWest')
axis tight
hold off

figure
title('P - 166 Jan/2014-Dec/2019')
hold on
h1 = plot(V166,'Color','k','LineWidth',1);
h2 = plot(D166,'m-','LineWidth',1);
legend([h1,h2],' ARIMA Forecast ','Observations','Location','NorthWest')
axis tight
hold off

figure
title('P - 284 Jan/2014-Dec/2019')
hold on
h1 = plot(V284,'Color','k','LineWidth',1);
h2 = plot(D284,'m-','LineWidth',1);
legend([h1,h2],' ARIMA Forecast ','Observations','Location','NorthWest')
axis tight
hold off

figure
title('P - 338 Jan/2014-Dec/2019')
hold on
h1 = plot(V338,'Color','k','LineWidth',1);
h2 = plot(D338,'m-','LineWidth',1);
legend([h1,h2],' ARIMA Forecast ','Observations','Location','NorthWest')
axis tight
hold off


figure
title('P - 343 Jan/2014-Dec/2019')
hold on
h1 = plot(V343,'Color','k','LineWidth',1);
h2 = plot(D343,'m-','LineWidth',1);
legend([h1,h2],' ARIMA Forecast ','Observations','Location','NorthWest')
axis tight
hold off

figure
title('P - 441 Jan/2014-Dec/2019')
hold on
h1 = plot(V441,'Color','k','LineWidth',1);
h2 = plot(D441,'m-','LineWidth',1);
legend([h1,h2],' ARIMA Forecast ','Observations','Location','NorthWest')
axis tight
hold off

figure
title('P - 451 Jan/2014-Dec/2019')
hold on
h1 = plot(V451,'Color','k','LineWidth',1);
h2 = plot(D451,'m-','LineWidth',1);
legend([h1,h2],' ARIMA Forecast ','Observations','Location','NorthWest')
axis tight
hold off