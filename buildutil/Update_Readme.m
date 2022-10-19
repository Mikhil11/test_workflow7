function Update_Readme(rootDir)
    arguments
        rootDir (1,1) string  = pwd();
    end
    testFileInfo = fullfile(rootDir,"README.md");
    testFolderInfo = dir(fullfile(rootDir,"code"));
    tline = readlines(testFileInfo);
    k = strfind(tline,"## Prerequisites");
    k1 = strfind(tline,"## Installation");
    b=find(~cellfun(@isempty,k));
    b1=find(~cellfun(@isempty,k1));
    %file_path = "C:\Users\mikhils\OneDrive - MathWorks\Desktop\Files\Climate_Tool_Box\MATLAB_dirc\CDT_functions_test\main\cdt_updated\cdt";
    st = get_MatlabProduct(testFolderInfo(1).folder);
    
    fid = fopen('README.md','w');
    i=1;
    while i<=numel(tline)
        fprintf(fid,"%s\n",string(tline(i)));
        if i == (b+1)
            fprintf(fid,"\n");
            for j=1:numel(st)
                fprintf(fid,"* [%s](https://in.mathworks.com/help/index.html)\n",string(st{j}));
            end
        fprintf(fid,"\n");
        i=b1-1;
        end
    i=i+1;
    end
    fclose(fid);
end
