%kmgdiag 'Generate a Diagonal Matrix'
% This MatLab function was automatically generated by a converter (KhorosToMatLab) from the Khoros mgdiag.pane file
%
% Parameters: 
% InputFile: i 'Diagonal vector ', optional: 'Vector of diagonal elements'
% OutputFile: o 'Output', required: 'Resulting output data object'
% Integer: r 'Rows ', default: 1: 'Number of rows'
% Integer: c 'Columns ', default: 1: 'Number of columns'
%
% Example: o = kmgdiag(i, {'i','';'o','';'r',1;'c',1})
%
% Khoros helpfile follows below:
%
%  PROGRAM
% mgdiag - Generate a Diagonal Matrix
%
%  DESCRIPTION
% .I mgdiag
% is used to generate matrices with all elements zero except along the
% diagonal. There are several "modes" of behavior that can be obtained:
% 
%  "1. Constant diagonal values"
% Here, the constant value is suppled by selecting and setting the "Constant"
% selections. The size of the matrix is controlled by selecting and setting the
% Rows and Columns as desired. If the matrix is not square, the diagonal
% will be carried as far as possible before hitting the boundary of the matrix.
% The matrix data type is controlled by the setting of the output data type
% list selector. If a complex data type is selected but the constant is 
% underspecified (meaning that either the real or imaginary part was not
% specified) then the unspecified part is assumed to be zero. If a complex
% value is specified, but a real data type is selected for output, then the
% imaginary part is ignored.
% 
% 
% This will generate a matrix with a single plane of data, i.e. DxTxE=1.
% 
%  "2. Non-constant diagonal values"
% Here, the diagonal values are read from the given vector of values. If the
% matrix size is not specified explicitly, then it is set to a square matrix
% with dimensions equal to the length of the data vector. If the matrix size
% is explicitly specified, then the vector element values are inserted into the
% diagonal matrix until either the matrix boundary is hit or there are no
% more values in the vector (in this case the remaining diagonal values will
% be zero). If the vector is complex but the output type is real then the
% imaginary part is ignored. If the vector is real but the output type is
% complex, then the imaginary part will be assumed to be zero.
% 
% 
% If the vector has DxTxE>1, then the output matrix will have the same
% dimensions along the D,T, and E axes as the vector, with the diagonal
% values in each plane taking on the values present in the corresponding 
% WxH plane in the vector.
% 
% In all cases, the output data type is ultimately controlled by the
% Output Data Type selector list setting, and the matrix size by the
% Row and Column selections if set.
%
%  
%
%  EXAMPLES
%
%  "SEE ALSO"
% mextract_diag(1)
%
%  RESTRICTIONS 
% This is a messy interface and could be improved.
%
%  REFERENCES 
%
%  COPYRIGHT
% Copyright (C) 1993 - 1997, Khoral Research, Inc. ("KRI")  All rights reserved.
% 


function varargout = kmgdiag(varargin)
if nargin ==0
  Inputs={};arglist={'',''};
elseif nargin ==1
  Inputs=varargin{1};arglist={'',''};
elseif nargin ==2
  Inputs=varargin{1}; arglist=varargin{2};
else error('Usage: [out1,..] = kmgdiag(Inputs,arglist).');
end
if size(arglist,2)~=2
  error('arglist must be of form {''ParameterTag1'',value1;''ParameterTag2'',value2}')
 end
narglist={'i', '__input';'o', '__output';'r', 1;'c', 1};
maxval={1,0,2,2};
minval={1,0,2,2};
istoggle=[1,0,1,1];
was_set=istoggle * 0;
paramtype={'InputFile','OutputFile','Integer','Integer'};
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
[varargout{:}]=callKhoros([w 'mgdiag"  '],Inputs,narglist);
