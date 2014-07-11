function csv2struct(filename,output)
% filename = 'apogeevisit.csv';
% output = 'apogeevisit';


%%
data = importdata(filename,',',1);
[len collen] = size(data.textdata);
[len2 collen2] = size(data.data);
cols = data.textdata(1,:);

if len>1;
    test = data.textdata(2,:);
    empty = zeros(collen,1);
    for i=1:collen;
        empty(i) = isempty(test{i});
    end

    col1 = find(empty,1,'first')-1;
    filln = zeros(len-1,1);
    for j = 1:col1-1;
            fill = (data.textdata(2:end,j));
            for m = 1:len-1;
                filln(m) = str2double(cell2mat(fill(m)));
            end
            S = [output,'.',cols(j),'=','filln'];
            eval(cell2mat(S));
    end

    fill = data.textdata(2:end,col1);
    S = [output,'.',cols(col1),'=','fill'];
    eval(cell2mat(S));
else
    col1 = 0;
end




for j = 1:collen2;
    fill = data.data(:,j);
    S = [output,'.',cols(j+col1),'=','fill'];
    eval(cell2mat(S));
end

SS = ['save ',output,'.mat ',output];
eval(SS)
