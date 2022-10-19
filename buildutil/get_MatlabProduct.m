function product_list = get_MatlabProduct(rootDir)
%This function finds all the matlab products used by the file
% Look for all the files in root directory and add the files to prj object
testFileInfo = dir(fullfile(rootDir,'**',"*.m"));
filesToCheck = fullfile(string({testFileInfo.folder}'),string({testFileInfo.name}'));
testFileInfo = dir(fullfile(rootDir,'**',"*.mlx"));
filesToCheck = [filesToCheck;fullfile(string({testFileInfo.folder}'),string({testFileInfo.name}'))];
S=[];

for i=1:numel(filesToCheck)
    [fList,pList] = matlab.codetools.requiredFilesAndProducts(filesToCheck(i));
    S = [S {pList.Name}];
end
product_list = unique(S);
end
