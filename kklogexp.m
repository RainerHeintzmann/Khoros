%kklogexp 'Compute Logarithm and Exponential (Antilogarithm)'
% This MatLab function was automatically generated by a converter (KhorosToMatLab) from the Khoros klogexp.pane file
%
% Parameters: 
% InputFile: i 'Input ', required: 'input data object'
% Toggle: inv 'Compute inverse logarithm (exp)', default: 0: 'Compute inverse logarithm (exp)'
% OutputFile: o 'Output', required: 'resulting output data object'
% Toggle: be 'Base e (2.71828...)', default: 0: 'Compute using base e (2.71828...)'
% Toggle: b10 'Base 10', default: 0: 'Compute using base 10'
% Toggle: b2 'Base 2', default: 0: 'Compute using base 2'
%
% Example: o = kklogexp(i, {'i','';'inv',0;'o','';'be',0;'b10',0;'b2',0})
%
% Khoros helpfile follows below:
%
%  PROGRAM
% klogexp - Compute Logarithm and Exponential (Antilogarithm)
%
%  DESCRIPTION
% .I klogexp
% computes the log/antilog(exponential) of the data represented in the
% value segment of an object. If the
% object has an associated mask, the operation will be gated so that
% the operation is done only on valid elements (indicated by non-zero 
% mask values).  A zero mask value will cause the value of the corresponding 
% point in the input object to be transferred the output object.
% 
% Three standard-bases are provided, and alternate bases 
% can be specified using the -base option.  
% .I be
% returns the natural logarithm of x, and 
% .I b2
% and 
% .I b10
% return the log/antilog(exponential) to base 2 and  10 respectively.  
% 
% The -offset option can be set to TRUE if the logarithm is to 
% operate on the input value plus 1 (log(x+1) or if the antilog(exponential)
% should return the output with a 1 subtracted from it (base**(x)-1). This
% improves accuracy for very small input values.
% 
% SPECIAL NOTE: The log/antilog(exponential) function is not defined for 
% base values less than or equal to zero. An error is returned if the base
% value is less than or equal to zero.
% 
% If the input object has a map segment, then the values
% in the map segment are modified directly according to the
% requested operation. In this case, the value segment data is not modified or
% referenced.
% 
% The output data type (of the map or value data, depending on which is
% modified) is always KDOUBLE (if the data is real) or KDCOMPLEX (if the data is 
% complex).
%
%  
%
%  EXAMPLES
%
%  "SEE ALSO"
% karith1(1)
%
%  RESTRICTIONS 
% A complex base is not currently supported.
% 
% If the argument to the logarithm is found to be less than or equal to zero,
% a large negative number (-KMAXFLOAT) is returned.
%
%  REFERENCES 
%
%  COPYRIGHT
% Copyright (C) 1993 - 1997, Khoral Research, Inc. ("KRI")  All rights reserved.
% 


function varargout = kklogexp(varargin)
if nargin ==0
  Inputs={};arglist={'',''};
elseif nargin ==1
  Inputs=varargin{1};arglist={'',''};
elseif nargin ==2
  Inputs=varargin{1}; arglist=varargin{2};
else error('Usage: [out1,..] = kklogexp(Inputs,arglist).');
end
if size(arglist,2)~=2
  error('arglist must be of form {''ParameterTag1'',value1;''ParameterTag2'',value2}')
 end
narglist={'i', '__input';'inv', 0;'o', '__output';'be', 0;'b10', 0;'b2', 0};
maxval={0,0,0,0,0,0};
minval={0,0,0,0,0,0};
istoggle=[0,1,0,1,1,1];
was_set=istoggle * 0;
paramtype={'InputFile','Toggle','OutputFile','Toggle','Toggle','Toggle'};
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
[varargout{:}]=callKhoros([w 'klogexp"  '],Inputs,narglist);
