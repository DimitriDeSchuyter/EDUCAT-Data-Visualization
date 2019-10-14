classdef instrument    properties        id, ...        name, ...        description, ...        data, ...        datatype , ...        length    end    methods        function obj = instrument(id, name, description, datatype)            obj.id = id;            obj.name = name;            obj.description = description;            obj.datatype = datatype;            switch obj.datatype                case 161 % A1                   obj.length = 5;                     obj.data = data.empty(0,obj.length);                   obj.data(1) = data("Actual speed","mm/s","int_16");                   obj.data(2) = data("Turn","?","int_8");                   obj.data(3) = data("Speed","?","int_8");                   obj.data(4) = data("Profile","?","int_8");                                   case 162 % A2                   obj.length = 6;                   obj.data = data.empty(0,obj.length);                   obj.data(1) = data("Actual speed","mm/s","int_16");                   obj.data(2) = data("Turn","?","int_8");                   obj.data(3) = data("Speed","?","int_8");                   obj.data(4) = data("Profile","?","int_8");                        obj.data(5) = data("Mode","?","int_8");                case 163 % A3                   obj.length = 5;                   obj.data = data.empty(0,obj.length);                   obj.data(1) = data("Actual speed","mm/s","int_16");                   obj.data(2) = data("Turn","?","int_8");                   obj.data(3) = data("Speed","?","int_8");                   obj.data(4) = data("Profile","?","int_8");                     case 177 % B1                   obj.length = 26;                   obj.data = data.empty(0,obj.length);                   obj.data(1) = data("ax","cm/s^2","int_16");                   obj.data(2) = data("ay","cm/s^2","int_16");                   obj.data(3) = data("az","cm/s^2","int_16");                   obj.data(4) = data("gx","0.001 degree/s","int_16");                   obj.data(5) = data("gy","0.001 degree/s","int_16");                   obj.data(6) = data("gz","0.001 degree/s","int_16");                   obj.data(7) = data("mx","0.01 �T","int_16");                   obj.data(8) = data("my","0.01 �T","int_16");                   obj.data(9) = data("mz","0.01 �T","int_16");                   obj.data(10) = data("real","0.001","int_16");                   obj.data(11) = data("i","0.001","int_16");                   obj.data(12) = data("j","0.001","int_16");                   obj.data(13) = data("k","0.001","int_16");                case 178 % B2                   obj.length = 12;                   obj.data = data.empty(0,obj.length);                   obj.data(1) = data("ax","cm/s^2","int_16");                   obj.data(2) = data("ay","cm/s^2","int_16");                   obj.data(3) = data("az","cm/s^2","int_16");                   obj.data(4) = data("gx","0.001 degree/s","int_16");                   obj.data(5) = data("gy","0.001 degree/s","int_16");                   obj.data(6) = data("gz","0.001 degree/s","int_16");                case 193 % C1                   obj.length = 17;                   obj.data = data.empty(0,obj.length);                   obj.data(1) = data("longitude","degrees","float_32");                   obj.data(2) = data("latitude","degrees","float_32");                   obj.data(3) = data("hMSL","m","float_32");                   obj.data(4) = data("speed","m/s","float_32");                                      obj.data(5) = data("gnss","m/s","int_8");                case 194 % C2                   error("Datatype unsupported - not yet implemented");                case 195 % C3                   error("Datatype unsupported - not yet implemented");                case 209 % D1                   obj.length = 2;                   obj.data = data.empty(0,obj.length);                   obj.data(1) = data("US","?","int_16");                case 210 % D2                   obj.length = 1;                   obj.data = data.empty(0,obj.length);                   obj.data(1) = data("IR","?","int_8");                case 211 % D3                   obj.length = 5;                   obj.data = data.empty(0,obj.length);                   obj.data(1) = data("Calculated","?","int_16");                   obj.data(2) = data("US","?","int_16");                   obj.data(3) = data("IR","?","int_8");                case 212 % D4                   obj.length = 6;                   obj.data = data.empty(0,obj.length);                   obj.data(1) = data("Calculated","?","int_16");                   obj.data(2) = data("US","?","int_16");                   obj.data(3) = data("IR 1","?","int_8");                   obj.data(4) = data("IR 2","?","int_8");                case 213 % D5                   obj.length = 7;                   obj.data = data.empty(0,obj.length);                   obj.data(1) = data("Calculated","?","int_16");                   obj.data(2) = data("US","?","int_16");                   obj.data(3) = data("IR 1","?","int_8");                   obj.data(4) = data("IR 2","?","int_8");                   obj.data(5) = data("IR 3","?","int_8");                case 214 % D6                   obj.length = 6;                   obj.data = data.empty(0,obj.length);                   obj.data(1) = data("Calculated","?","int_16");                   obj.data(2) = data("IR 1","?","int_8");                   obj.data(3) = data("IR 2","?","int_8");                   obj.data(4) = data("IR 3","?","int_8");                   obj.data(5) = data("IR 4","?","int_8");                case 225 % E1                   obj.length = 8;                   obj.data = data.empty(0,obj.length);                   obj.data(1) = data("unix_epoch_ms","ms","uint_64");                case 241 % F1                   obj.length = 2;                   obj.data = data.empty(0,obj.length);                   obj.data(1) = data("OAS Calculated Value","","uint_8");                   obj.data(2) = data("Booleans","","uint_8");                otherwise                   error("Datatype unsupported");            end        end        function obj = add_data(obj,cyclecounter, blob)            switch obj.datatype                case 161 % A1                   obj.data(1) = obj.data(1).add_value(cyclecounter, blob(1:2));                   obj.data(2) = obj.data(2).add_value(cyclecounter, blob(3));                   obj.data(3) = obj.data(3).add_value(cyclecounter, blob(4));                   obj.data(4) = obj.data(4).add_value(cyclecounter, blob(5));                case 162 % A2                   obj.data(1) = obj.data(1).add_value(cyclecounter, blob(1:2));                   obj.data(2) = obj.data(2).add_value(cyclecounter, blob(3));                   obj.data(3) = obj.data(3).add_value(cyclecounter, blob(4));                   obj.data(4) = obj.data(4).add_value(cyclecounter, blob(5));                   obj.data(5) = obj.data(4).add_value(cyclecounter, blob(6));                case 163 % A3                   obj.data(1) = obj.data(1).add_value(cyclecounter, blob(1:2));                   obj.data(2) = obj.data(2).add_value(cyclecounter, blob(3));                   obj.data(3) = obj.data(3).add_value(cyclecounter, blob(4));                   obj.data(4) = obj.data(4).add_value(cyclecounter, blob(5));                case 177 % B1                   obj.data(1) = obj.data(1).add_value(cyclecounter, blob(1:2));                   obj.data(2) = obj.data(2).add_value(cyclecounter, blob(3:4));                   obj.data(3) = obj.data(3).add_value(cyclecounter, blob(5:6));                   obj.data(4) = obj.data(4).add_value(cyclecounter, blob(7:8));                   obj.data(5) = obj.data(5).add_value(cyclecounter, blob(9:10));                   obj.data(6) = obj.data(6).add_value(cyclecounter, blob(11:12));                   obj.data(7) = obj.data(7).add_value(cyclecounter, blob(13:14));                   obj.data(8) = obj.data(8).add_value(cyclecounter, blob(15:16));                   obj.data(9) = obj.data(9).add_value(cyclecounter, blob(17:18));                   obj.data(10) = obj.data(10).add_value(cyclecounter, blob(19:20));                   obj.data(11) = obj.data(11).add_value(cyclecounter, blob(21:22));                   obj.data(12) = obj.data(12).add_value(cyclecounter, blob(23:24));                   obj.data(13) = obj.data(13).add_value(cyclecounter, blob(25:26));                case 178 % B2                   obj.data(1) = obj.data(1).add_value(cyclecounter, blob(1:2));                   obj.data(2) = obj.data(2).add_value(cyclecounter, blob(3:4));                   obj.data(3) = obj.data(3).add_value(cyclecounter, blob(5:6));                   obj.data(4) = obj.data(4).add_value(cyclecounter, blob(7:8));                   obj.data(5) = obj.data(5).add_value(cyclecounter, blob(9:10));                   obj.data(6) = obj.data(6).add_value(cyclecounter, blob(11:12));                case 193 % C1                   obj.data(1) = obj.data(1).add_value(cyclecounter, blob(1:4));                   obj.data(2) = obj.data(2).add_value(cyclecounter, blob(5:8));                   obj.data(3) = obj.data(3).add_value(cyclecounter, blob(9:12));                   obj.data(4) = obj.data(4).add_value(cyclecounter, blob(13:16));                   obj.data(5) = obj.data(5).add_value(cyclecounter, blob(17));                case 194 % C2                case 195 % C3                case 209 % D1                   obj.data(1) = obj.data(1).add_value(cyclecounter, blob(1:2));                case 210 % D2                   obj.data(1) = obj.data(1).add_value(cyclecounter, blob(1));                case 211 % D3                   obj.data(1) = obj.data(1).add_value(cyclecounter, blob(1:2));                   obj.data(2) = obj.data(2).add_value(cyclecounter, blob(3:4));                   obj.data(3) = obj.data(3).add_value(cyclecounter, blob(5));                case 212 % D4                   obj.data(1) = obj.data(1).add_value(cyclecounter, blob(1:2));                   obj.data(2) = obj.data(2).add_value(cyclecounter, blob(3:4));                   obj.data(3) = obj.data(3).add_value(cyclecounter, blob(5));                                      obj.data(4) = obj.data(4).add_value(cyclecounter, blob(6));                case 213 % D5                   obj.data(1) = obj.data(1).add_value(cyclecounter, blob(1:2));                   obj.data(2) = obj.data(2).add_value(cyclecounter, blob(3:4));                   obj.data(3) = obj.data(3).add_value(cyclecounter, blob(5));                                      obj.data(4) = obj.data(4).add_value(cyclecounter, blob(6));                                     obj.data(5) = obj.data(5).add_value(cyclecounter, blob(7));                case 214 % D6                   obj.data(1) = obj.data(1).add_value(cyclecounter, blob(1:2));                   obj.data(2) = obj.data(2).add_value(cyclecounter, blob(3));                   obj.data(3) = obj.data(3).add_value(cyclecounter, blob(4));                                      obj.data(4) = obj.data(4).add_value(cyclecounter, blob(5));                                     obj.data(5) = obj.data(5).add_value(cyclecounter, blob(6));                case 225 % E1                   obj.data(1) = obj.data(1).add_value(cyclecounter, blob(1:8));                case 241 % F1                   obj.data(1) = obj.data(1).add_value(cyclecounter, blob(1));                   obj.data(2) = obj.data(1).add_value(cyclecounter, blob(2));            end        end        function obj = plot_all(obj)            figure();            suptitle(obj.name);                   switch obj.datatype                case 161 % A1                   subplot(2,3,1:3)                   obj.data(1).plot();                   subplot(2,3,4)                   obj.data(2).plot();                   subplot(2,3,5)                   obj.data(3).plot();                   subplot(2,3,6)                   obj.data(4).plot();                case 162 % A2                   subplot(3,2,1:2)                   obj.data(1).plot();                   subplot(2,3,3)                   obj.data(2).plot();                   subplot(2,3,4)                   obj.data(3).plot();                   subplot(2,3,5)                   obj.data(4).plot();                                      subplot(2,3,6)                   obj.data(4).plot();                case 163 % A3                   subplot(2,3,1:3)                   obj.data(1).plot();                   subplot(2,3,4)                   obj.data(2).plot();                   subplot(2,3,5)                   obj.data(3).plot();                   subplot(2,3,6)                   obj.data(4).plot();                case 177 % B1                   subplot(3,1,1)                   obj.data(1).plot();                   subplot(3,1,2)                   obj.data(2).plot();                   subplot(3,1,3)                   obj.data(3).plot();                   figure();                   suptitle(obj.name);                    subplot(3,1,1)                   obj.data(4).plot();                   subplot(3,1,2)                   obj.data(5).plot();                   subplot(3,1,3)                   obj.data(6).plot();                case 178 % B2                   subplot(3,1,1)                   obj.data(1).plot();                   subplot(3,1,2)                   obj.data(2).plot();                   subplot(3,1,3)                   obj.data(3).plot();                   figure();                   subplot(3,1,1)                   obj.data(4).plot();                   subplot(3,1,2)                   obj.data(5).plot();                   subplot(3,1,3)                   obj.data(6).plot();                case 193 % C1                   obj.data(1).plot();                case 194 % C2                case 195 % C3                case 209 % D1                   obj.data(1).plot();                case 210 % D2                   obj.data(1).plot();                case 211 % D3                   subplot(2,2,1:2)                   obj.data(1).plot();                   subplot(2,2,3)                   obj.data(2).plot();                   subplot(2,2,4)                   obj.data(3).plot();                case 212 % D4                   subplot(2,3,1:3)                   obj.data(1).plot();                   subplot(2,3,4)                   obj.data(2).plot();                   subplot(2,3,5)                   obj.data(3).plot();                   subplot(2,3,5)                   obj.data(4).plot();                case 213 % D5                   subplot(2,4,1:4)                   obj.data(1).plot();                   subplot(2,4,5)                   obj.data(2).plot();                   subplot(2,4,6)                   obj.data(3).plot();                   subplot(2,4,7)                   obj.data(4).plot();                   subplot(2,4,8)                   obj.data(5).plot();                case 214 % D6                   subplot(2,4,1:4)                   obj.data(1).plot();                   subplot(2,4,5)                   obj.data(2).plot();                   subplot(2,4,6)                   obj.data(3).plot();                   subplot(2,4,7)                   obj.data(4).plot();                   subplot(2,4,8)                   obj.data(5).plot();                case 225 % E1                case 241 % F1            end        end    endend