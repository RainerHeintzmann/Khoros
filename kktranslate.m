%kktranslate 'Translate Data in Object'
% This MatLab function was automatically generated by a converter (KhorosToMatLab) from the Khoros ktranslate.pane file
%
% Parameters: 
% InputFile: i 'Input ', required: 'Input data file'
% Integer: woff 'Width Offset ', default: 0: 'Translate data in width dimension by this amount'
% Integer: hoff 'Height Offset ', default: 0: 'Translate data in height dimension by this amount'
% Integer: doff 'Depth Offset ', default: 0: 'Translate data in depth dimension by this amount'
% Integer: toff 'Time Offset ', default: 0: 'Translate data in time dimension by this amount'
% Integer: eoff 'Element Offset ', default: 0: 'Translate data in elements dimension by this amount'
% Toggle: wrap 'Fill Outside Data Regions by WRAPPING', default: 0: 'fill outside data regions by WRAPPING'
% OutputFile: o 'Output', required: 'Resulting output file'
%
% Example: o = kktranslate(i, {'i','';'woff',0;'hoff',0;'doff',0;'toff',0;'eoff',0;'wrap',0;'o',''})
%
% Khoros helpfile follows below:
%
%  PROGRAM
% ktranslate - Translate Data in Object
%
%  DESCRIPTION
% The "Translate" operator, ktranslate, performs the translation of a 
% data object using the pad values defined by the Real and Imaginary padding 
% value options.  The (0,0,0,0,0) point of the input data will be translated
% to the position specified by the translation offset values.  Values that
% are translated outside of the original data space are truncated.  Wrapping
% is currently not supported, but will be provided in the future.
% 
%  "Size"
% The output data object will be the same as the input data size.
% 
%  "Pad Values"
% The Real Pad Value (real) specifies the pad value that will be assigned
% to the real component of a complex pair, and the Imaginary Pad Value
% (imag) specifies the imaginary component of the pair.
% If the input data object type is not complex, the imaginary pad value
% will be ignored.  For input data objects that are not of type double,
% the specified pad values are cast to the same type as the input data object.
% 
%  "Wrapping"
% The regions outside the original data bounds can be filled also by wrapping
% data from the opposite side of the dataset by specifying the Wrap flag.
% This will override the Pad Value functionality.
% 
%  "Mask Data & Validity Option"
% The validity mask corresponding to padded data will be zero if
% the user specifies that padded data added by this program be marked
% as invalid (valid FALSE).  Likewise, if the user specifies that padded
% data is valid (valid TRUE), the mask corresponding to padded data will
% be non-zero.  In the first case (invalid), if no mask exists in the
% source object, on will be created.  In the valid case, no mask will be
% created.  Validity mask data corresponding to the original source object
% data is transferred to the destination unaltered.
% 
%  "Location & Time Data"
% If curvilinear or rectilinear time or location data
% exist, it is unclear how to alter the dimensionality,
% so the operation will fail.  If uniform location data exist
% translation occurs, but the location information is not altered in
% any way.
% 
%  "Map Data"
% The translate operator does not modify map data.
% 
%  "Failure Modes"
% The input object must contain value or mask data.
% 
% Executing "Translate" runs the program \fIkpad\fP with offsets specified.
%
%  
%
%  EXAMPLES
%
%  "SEE ALSO"
% DATAMANIP::kpad
%
%  RESTRICTIONS 
% The translate operator will fail if the source object contains curvilinear 
% or rectilinear location or time data.  If uniform time or location data 
% exist, it is transferred, but not modified.
% 
% Wrapping is not supported at this time.
%
%  REFERENCES 
%
%  COPYRIGHT
% Copyright (C) 1993 - 1997, Khoral Research, Inc. ("KRI")  All rights reserved.
% 


function varargout = kktranslate(varargin)
if nargin ==0
  Inputs={};arglist={'',''};
elseif nargin ==1
  Inputs=varargin{1};arglist={'',''};
elseif nargin ==2
  Inputs=varargin{1}; arglist=varargin{2};
else error('Usage: [out1,..] = kktranslate(Inputs,arglist).');
end
if size(arglist,2)~=2
  error('arglist must be of form {''ParameterTag1'',value1;''ParameterTag2'',value2}')
 end
narglist={'i', '__input';'woff', 0;'hoff', 0;'doff', 0;'toff', 0;'eoff', 0;'wrap', 0;'o', '__output'};
maxval={0,0,0,0,0,0,0,0};
minval={0,0,0,0,0,0,0,0};
istoggle=[0,1,1,1,1,1,1,0];
was_set=istoggle * 0;
paramtype={'InputFile','Integer','Integer','Integer','Integer','Integer','Toggle','OutputFile'};
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
[varargout{:}]=callKhoros([w 'kpad"  '],Inputs,narglist);
