%kDIPImages 'Sample Image Data'
% This MatLab function was automatically generated by a converter (KhorosToMatLab) from the Khoros DIPImages.pane file
%
% Parameters: 
% MultiChoice: image 'List of DIP Course Images:', default: 1: '2dfft.kdf'
% OutputFile: o '2dfft.kdf', optional: 'angio.kdf'
% OutputFile: o 'angio.kdf', optional: 'ball.kdf'
% OutputFile: o 'ball.kdf', optional: 'barcode.kdf'
% OutputFile: o 'barcode.kdf', optional: 'bi24hd.kdf'
% OutputFile: o 'bi24hd.kdf', optional: 'bi24hi.kdf'
% OutputFile: o 'bi24hi.kdf', optional: 'bi24ld.kdf'
% OutputFile: o 'bi24ld.kdf', optional: 'bi24li.kdf'
% OutputFile: o 'bi24li.kdf', optional: 'blobs.kdf'
% OutputFile: o 'blobs.kdf', optional: 'blocks-color.kdf'
% OutputFile: o 'blocks-color.kdf', optional: 'bluntfin.kdf'
% OutputFile: o 'bluntfin.kdf', optional: 'bluntfin.kdfpan'
% OutputFile: o 'bluntfin.kdfpan', optional: 'bridge-toledo.kdf'
% OutputFile: o 'bridge-toledo.kdf', optional: 'cathedral.kdf'
% OutputFile: o 'cathedral.kdf', optional: 'cells-tissue-saturate.kdf'
% OutputFile: o 'cells-tissue-saturate.kdf', optional: 'cies.kdf'
% OutputFile: o 'cies.kdf', optional: 'draw-small.kdf'
% OutputFile: o 'draw-small.kdf', optional: 'drawing.kdf'
% OutputFile: o 'drawing.kdf', optional: 'echo-mask.kdf'
% OutputFile: o 'echo-mask.kdf', optional: 'echo.kdf'
% OutputFile: dummy 'echo.kdf', optional: 'exp-256-lut.kdf'
% OutputFile: dummy 'exp-256-lut.kdf', optional: 'finger-print.kdf'
% OutputFile: dummy 'finger-print.kdf', optional: 'fourier-pulse.kdf'
% OutputFile: dummy 'fourier-pulse.kdf', optional: 'fusca.kdf'
% OutputFile: dummy 'fusca.kdf', optional: 'gull-color.kdf'
% OutputFile: dummy 'gull-color.kdf', optional: 'gull.kdf'
% OutputFile: dummy 'gull.kdf', optional: 'head-slice.kdf'
% OutputFile: dummy 'head-slice.kdf', optional: 'head.kdf'
% OutputFile: dummy 'head.kdf', optional: 'heart-beat-signal.kdf'
% OutputFile: dummy 'heart-beat-signal.kdf', optional: 'heart-beat-signal.kdf2'
% OutputFile: dummy 'heart-beat-signal.kdf2', optional: 'ipanema-leblon.kdf'
% OutputFile: dummy 'ipanema-leblon.kdf', optional: 'istec-map-color.kdf'
% OutputFile: dummy 'istec-map-color.kdf', optional: 'istec-map-color.kdfpa'
% OutputFile: dummy 'istec-map-color.kdfpa', optional: 'la-guardia.kdf'
% OutputFile: dummy 'la-guardia.kdf', optional: 'lenina-blur-float.kdf'
% OutputFile: dummy 'lenina-blur-float.kdf', optional: 'lenina.kdf'
% OutputFile: dummy 'lenina.kdf', optional: 'log-256-lut.kdf'
% OutputFile: dummy 'log-256-lut.kdf', optional: 'log-enhance-problem.kdf'
% OutputFile: dummy 'log-enhance-problem.kdf', optional: 'map-roi.kdf'
% OutputFile: dummy 'map-roi.kdf', optional: 'medruler.kdf'
% OutputFile: dummy 'medruler.kdf', optional: 'moon.kdf'
% OutputFile: dummy 'moon.kdf', optional: 'mpicchu.kdf'
% OutputFile: dummy 'mpicchu.kdf', optional: 'mpicchu.kdfic'
% OutputFile: dummy 'mpicchu.kdfic', optional: 'mpicchu.kdfp'
% OutputFile: dummy 'mpicchu.kdfp', optional: 'musc1.kdf'
% OutputFile: dummy 'musc1.kdf', optional: 'myelin.kdf'
% OutputFile: dummy 'myelin.kdf', optional: 'numbers.pbm'
% OutputFile: dummy 'numbers.pbm', optional: 'pieces.kdf'
% OutputFile: dummy 'pieces.kdf', optional: 'retina.kdf'
% OutputFile: dummy 'retina.kdf', optional: 'ruler.kdf'
% OutputFile: dummy 'ruler.kdf', optional: 'spect-heart.kdf'
% OutputFile: dummy 'spect-heart.kdf', optional: 'spline.kdf'
% OutputFile: dummy 'spline.kdf', optional: 'tools.kdf'
% OutputFile: dummy 'tools.kdf', optional: 'unicamp-logo.kdf'
% OutputFile: dummy 'unicamp-logo.kdf', optional: 'wksp-img.kdf'
% OutputFile: dummy 'wksp-img.kdf', optional: 'lists images'
%    Choices are:
%
% Example: [o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, dummy, dummy, dummy, dummy, dummy, dummy, dummy, dummy, dummy, dummy, dummy, dummy, dummy, dummy, dummy, dummy, dummy, dummy, dummy, dummy, dummy, dummy, dummy, dummy, dummy, dummy, dummy, dummy, dummy, dummy, dummy, dummy, dummy, dummy, dummy, dummy] = kDIPImages( {'image',1;'o','';'o','';'o','';'o','';'o','';'o','';'o','';'o','';'o','';'o','';'o','';'o','';'o','';'o','';'o','';'o','';'o','';'o','';'o','';'dummy','';'dummy','';'dummy','';'dummy','';'dummy','';'dummy','';'dummy','';'dummy','';'dummy','';'dummy','';'dummy','';'dummy','';'dummy','';'dummy','';'dummy','';'dummy','';'dummy','';'dummy','';'dummy','';'dummy','';'dummy','';'dummy','';'dummy','';'dummy','';'dummy','';'dummy','';'dummy','';'dummy','';'dummy','';'dummy','';'dummy','';'dummy','';'dummy','';'dummy','';'dummy','';'dummy',''})
%
% Khoros helpfile follows below:
%
%  PROGRAM
% DIPImages - Sample Image Data
%
%  DESCRIPTION
%
%  
%
%  EXAMPLES
%
%  "SEE ALSO"
%
%  RESTRICTIONS 
%
%  REFERENCES 
%
%  COPYRIGHT
% Copyright (C) 1993 - 1997, Khoral Research, Inc.  All rights reserved.
% 


function varargout = kDIPImages(varargin)
Inputs={};
if nargin ==0
  arglist={'',''};
elseif nargin ==1
  arglist=varargin{1};
else error('Usage: [out1,..] = kDIPImages(arglist).');
end
if size(arglist,2)~=2
  error('arglist must be of form {''ParameterTag1'',value1;''ParameterTag2'',value2}')
 end
narglist={'image', 1;'o', '__output';'o', '__output';'o', '__output';'o', '__output';'o', '__output';'o', '__output';'o', '__output';'o', '__output';'o', '__output';'o', '__output';'o', '__output';'o', '__output';'o', '__output';'o', '__output';'o', '__output';'o', '__output';'o', '__output';'o', '__output';'o', '__output';'dummy', '__output';'dummy', '__output';'dummy', '__output';'dummy', '__output';'dummy', '__output';'dummy', '__output';'dummy', '__output';'dummy', '__output';'dummy', '__output';'dummy', '__output';'dummy', '__output';'dummy', '__output';'dummy', '__output';'dummy', '__output';'dummy', '__output';'dummy', '__output';'dummy', '__output';'dummy', '__output';'dummy', '__output';'dummy', '__output';'dummy', '__output';'dummy', '__output';'dummy', '__output';'dummy', '__output';'dummy', '__output';'dummy', '__output';'dummy', '__output';'dummy', '__output';'dummy', '__output';'dummy', '__output';'dummy', '__output';'dummy', '__output';'dummy', '__output';'dummy', '__output';'dummy', '__output';'dummy', '__output'};
maxval={0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1};
minval={0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1};
istoggle=[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
was_set=istoggle * 0;
paramtype={'MultiChoice','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile'};
% identify the input arrays and assign them to the arguments as stated by the user
if ~iscell(Inputs)
Inputs = {Inputs};
end
NumReqOutputs=0; nextinput=1; nextoutput=1;
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
[varargout{:}]=callKhoros([w 'DIPImages" '],Inputs,narglist);