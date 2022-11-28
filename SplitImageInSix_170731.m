
clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
workspace;  % Make sure the workspace panel is showing.
fontSize = 20;
cd('/Users/mathfr/Desktop/Neg/Neg Occludin DSC2/')
tifFiles = dir('/Users/mathfr/Desktop/Neg/Neg Occludin DSC2/*.tif') 
numfiles = length(tifFiles);
mydata = cell(1, numfiles);

for k = 1:numfiles 
  mydata{k} = imread(tifFiles(k).name); 
end
%cd('/Volumes/tank-1/groups/broliden/HIV group/Gabriella/GRIFFITHSIN/Exported QGRFT files/35023')
for p = 1:numfiles
    [rows, columns, numberOfColorBands] = size(mydata{p});
   
if rows>=columns
        R=floor(rows/3);
        C=floor(columns/2);
        Rrest=rows-R-R;
        Crest=columns-C;
        ca = mat2cell(mydata{p}, [R, R, Rrest], [C, Crest], numberOfColorBands);
else
      R=floor(rows/2);
      C=floor(columns/3);
      Rrest=rows-R;
      Crest=columns-C-C;
      ca = mat2cell(mydata{p}, [R, Rrest], [C, C, Crest], numberOfColorBands);

end

    for v=1:6
        name = [num2str(v),'_',tifFiles(p).name];
        imwrite(ca{v} , name);
        
    end
   
end

