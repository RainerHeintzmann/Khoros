%kcROIfromcoords 'Extract rectangular ROIs from an image using coordinates'
% This MatLab function was automatically generated by a converter (KhorosToMatLab) from the Khoros cROIfromcoords.pane file
%
% Parameters: 
% InputFile: i 'Input image file', required: 'Input file with the image to be used for ROI extraction'
% InputFile: icoords 'Input Coord file', required: 'input Coord file with coordinates for ROI extraction'
% MultiChoice: setwhat 'ROIs will be everything', default: 1: 'flag for setting if ROIs are inside or outside coords'
%    Choices are:
%   1: 'Inside coords'
%   2: 'Outside coords'
% Toggle: autocrop 'Auto-crop image (extract minimum area)', default: 0: 'if set will reduce image dimensions to bounding box'
% OutputFile: o 'Output', required: 'output image with the ROIs masked or set to values'
% Toggle: masknonROIs 'Masked as 0 (non-valid)', default: 0: 'if set will mask all non-ROIs pixels in the image'
% Toggle: assignnonROIs 'Assigned to value:', default: 0: 'if set will assign a value to the non-ROI pixels in the image'
%
% Example: o = kcROIfromcoords({i, icoords}, {'i','';'icoords','';'setwhat',1;'autocrop',0;'o','';'masknonROIs',0;'assignnonROIs',0})
%
% Khoros helpfile follows below:
%
%  PROGRAM
% cROIfromcoords - Extract rectangular ROIs from an image using coordinates
%
%  DESCRIPTION
% Read a file with 4 integers as coordinates specifying a rectangle and set the value or mask regions of the input object to be considered as \fBR"egions \fBO\fPf \fBI\fPnterest depending on the parameters.
% The Coords file is an ASCII file that specifies the rectangles. Its format is very simple: 
% * lines starting with # or / are considered as comments
% * lines with less than 7 characters on it are ignored
% * each line should have 4 coordinates: start column, start row, width, height.
% ROIs can be specified as being masked (with the [-masknonROIs] flag) or set to a value (with the [-assignnonROIs] flag and specifying real and complex values with [-valuei] and [-valuej]), and being the regions inside or outside the coordinates with the [-setwhat] toggle.
% \fBImportant:" the optional argument [-autocrop] should be used only when the ROIs are \fBnot\fP going to be joined later by "kappend\fP or a similar routine because there is the possibility that the different objects created by this routine with [-autocrop] will have different sizes and then joining them with \fIkappend\fP will create padding areas with values 0, which surely is not a good idea for some classification methods which will consider all those padding points as valid samples.
%
%  
%
%  EXAMPLES
% All examples for the Classify toolbox are listed on the Classify Toolbox Manual. For an example of usage of the cROIfromcoords kroutine for ROI extraction, see the example workspace Classify:workspaces:KNN.
%
%  "SEE ALSO"
% cROIfrommcoords, lcROIfromcoords, Coord file format in the Classify Toolbox Manual.
%
%  RESTRICTIONS 
% The coordinates specified in the file must be inside the range of the image file, i.e. they must contain valid coordinates.
% \fBImportant:" Workspaces that were created with the version 1.0 of this program must be checked - the regions outside the ROIs will be by default set to 0, which will create errors in the signatures.
%
%  REFERENCES 
% All references for the Classify toolbox are listed on the Classify Toolbox Manual.
%
%  COPYRIGHT
% Copyright (C) 1997 Rafael Santos. Khoros (C) Khoral Research, Inc.
% 


function varargout = kcROIfromcoords(varargin)
if nargin ==0
  Inputs={};arglist={'',''};
elseif nargin ==1
  Inputs=varargin{1};arglist={'',''};
elseif nargin ==2
  Inputs=varargin{1}; arglist=varargin{2};
else error('Usage: [out1,..] = kcROIfromcoords(Inputs,arglist).');
end
if size(arglist,2)~=2
  error('arglist must be of form {''ParameterTag1'',value1;''ParameterTag2'',value2}')
 end
narglist={'i', '__input';'icoords', '__input';'setwhat', 1;'autocrop', 0;'o', '__output';'masknonROIs', 0;'assignnonROIs', 0};
maxval={0,0,0,0,0,0,0};
minval={0,0,0,0,0,0,0};
istoggle=[0,0,0,1,0,1,1];
was_set=istoggle * 0;
paramtype={'InputFile','InputFile','MultiChoice','Toggle','OutputFile','Toggle','Toggle'};
% identify the input arrays and assign them to the arguments as stated by the user
if ~iscell(Inputs)
Inputs = {Inputs};
end
NumReqOutputs=1; nextinput=1; nextoutput=1;
  for ii=1:size(arglist,1)
  wasmatched=0;
  for jj=1:size(narglist,1)
   if strcmp(arglist{ii,1},narglist{jj,1})  % a given argument was matched to the possible arguments
     wasmatched = 1;
     was_set(jj) = 1;
     if strcmp(narglist{jj,2}, '__input')
      if (nextinput > length(Inputs)) 
        error(['Input ' narglist{jj,1} ' has no corresponding input!']); 
      end
      narglist{jj,2} = 'OK_in';
      nextinput = nextinput + 1;
     elseif strcmp(narglist{jj,2}, '__output')
      if (nextoutput > nargout) 
        error(['Output nr. ' narglist{jj,1} ' is not present in the assignment list of outputs !']); 
      end
      if (isempty(arglist{ii,2}))
        narglist{jj,2} = 'OK_out';
      else
        narglist{jj,2} = arglist{ii,2};
      end

      nextoutput = nextoutput + 1;
      if (minval{jj} == 0)  
         NumReqOutputs = NumReqOutputs - 1;
      end
     elseif isstr(arglist{ii,2})
      narglist{jj,2} = arglist{ii,2};
     else
        if strcmp(paramtype{jj}, 'Integer') & (round(arglist{ii,2}) ~= arglist{ii,2})
            error(['Argument ' arglist{ii,1} ' is of integer type but non-integer number ' arglist{ii,2} ' was supplied']);
        end
        if (minval{jj} ~= 0 | maxval{jj} ~= 0)
          if (minval{jj} == 1 & maxval{jj} == 1 & arglist{ii,2} < 0)
            error(['Argument ' arglist{ii,1} ' must be bigger or equal to zero!']);
          elseif (minval{jj} == -1 & maxval{jj} == -1 & arglist{ii,2} > 0)
            error(['Argument ' arglist{ii,1} ' must be smaller or equal to zero!']);
          elseif (minval{jj} == 2 & maxval{jj} == 2 & arglist{ii,2} <= 0)
            error(['Argument ' arglist{ii,1} ' must be bigger than zero!']);
          elseif (minval{jj} == -2 & maxval{jj} == -2 & arglist{ii,2} >= 0)
            error(['Argument ' arglist{ii,1} ' must be smaller than zero!']);
          elseif (minval{jj} ~= maxval{jj} & arglist{ii,2} < minval{jj})
            error(['Argument ' arglist{ii,1} ' must be bigger than ' num2str(minval{jj})]);
          elseif (minval{jj} ~= maxval{jj} & arglist{ii,2} > maxval{jj})
            error(['Argument ' arglist{ii,1} ' must be smaller than ' num2str(maxval{jj})]);
          end
        end
     end
     if ~strcmp(narglist{jj,2},'OK_out') &  ~strcmp(narglist{jj,2},'OK_in') 
       narglist{jj,2} = arglist{ii,2};
     end
   end
   end
   if (wasmatched == 0 & ~strcmp(arglist{ii,1},''))
        error(['Argument ' arglist{ii,1} ' is not a valid argument for this function']);
   end
end
% match the remaining inputs/outputs to the unused arguments and test for missing required inputs
 for jj=1:size(narglist,1)
     if  strcmp(paramtype{jj}, 'Toggle')
        if (narglist{jj,2} ==0)
          narglist{jj,1} = ''; 
        end;
        narglist{jj,2} = ''; 
     end;
     if  ~strcmp(narglist{jj,2},'__input') && ~strcmp(narglist{jj,2},'__output') && istoggle(jj) && ~ was_set(jj)
          narglist{jj,1} = ''; 
          narglist{jj,2} = ''; 
     end;
     if strcmp(narglist{jj,2}, '__input')
      if (minval{jj} == 0)  % meaning this input is required
        if (nextinput > size(Inputs)) 
           error(['Required input ' narglist{jj,1} ' has no corresponding input in the list!']); 
        else
          narglist{jj,2} = 'OK_in';
          nextinput = nextinput + 1;
        end
      else  % this is an optional input
        if (nextinput <= length(Inputs)) 
          narglist{jj,2} = 'OK_in';
          nextinput = nextinput + 1;
        else 
          narglist{jj,1} = '';
          narglist{jj,2} = '';
        end;
      end;
     else 
     if strcmp(narglist{jj,2}, '__output')
      if (minval{jj} == 0) % this is a required output
        if (nextoutput > nargout & nargout > 1) 
           error(['Required output ' narglist{jj,1} ' is not stated in the assignment list!']); 
        else
          narglist{jj,2} = 'OK_out';
          nextoutput = nextoutput + 1;
          NumReqOutputs = NumReqOutputs-1;
        end
      else % this is an optional output
        if (nargout - nextoutput >= NumReqOutputs) 
          narglist{jj,2} = 'OK_out';
          nextoutput = nextoutput + 1;
        else 
          narglist{jj,1} = '';
          narglist{jj,2} = '';
        end;
      end
     end
  end
end
if nargout
   varargout = cell(1,nargout);
else
  varargout = cell(1,1);
end
if ispc
  w='"C:\Program Files\dip\khorosBin\';
else
[s,w] = system('which cantata');
w=['"' w(1:end-8)];
end
global KhorosRoot
if exist('KhorosRoot')
if ~isempty(KhorosRoot)
w=['"' KhorosRoot];
end
end
[varargout{:}]=callKhoros([w 'cROIfromcoords"  '],Inputs,narglist);
