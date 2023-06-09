%kkappend 'Append (or Prepend) Input Objects to Base Object'
% This MatLab function was automatically generated by a converter (KhorosToMatLab) from the Khoros kappend.pane file
%
% Parameters: 
% InputFile: i1 'Input 1 (Base)', required: 'Base Input data object (input 1)'
% InputFile: i2 'Input 2', optional: 'input file 2'
% InputFile: i3 'Input 3', optional: 'input file 3'
% InputFile: i4 'Input 4', optional: 'input file 4'
% InputFile: i5 'Input 5', optional: 'input file 5'
% InputFile: i6 'Input 6', optional: 'input file 6'
% InputFile: i7 'Input 7', optional: 'input file 7'
% InputFile: i8 'Input 8', optional: 'input file 8'
% InputFile: i9 'Input 9', optional: 'input file 9'
% InputFile: i10 'Input 10', optional: 'input file 10'
% OutputFile: o 'Output', required: 'Resulting output data object'
% Toggle: w 'Width', default: 0: 'Stack objects along width dimension'
% Toggle: h 'Height', default: 0: 'Stack objects along height dimension'
% Toggle: d 'Depth', default: 0: 'Stack objects along depth dimension'
% Toggle: t 'Time', default: 0: 'Stack objects along time dimension'
% Toggle: e 'Elements', default: 0: 'Stack objects along elements dimension'
%
% Example: o = kkappend({i1, i2, i3, i4, i5, i6, i7, i8, i9, i10}, {'i1','';'i2','';'i3','';'i4','';'i5','';'i6','';'i7','';'i8','';'i9','';'i10','';'o','';'w',0;'h',0;'d',0;'t',0;'e',0})
%
% Khoros helpfile follows below:
%
%  PROGRAM
% kappend - Append (or Prepend) Input Objects to Base Object
%
%  DESCRIPTION
% The "Append" operator (kappend) combines all input data objects
% (i1 to i10) into a single output object (o).
% The objects are combined in order from Input 1 to Input 10.  If the
% user specifies placement as "Prepend Objects to Base Object" (-append 0), 
% then the first input will be the last appended to the output object.
% The dimension flags Width (w_flag), Height (h_flag), Depth (d_flag), 
% Time (t_flag), and Elements (e_flag), specify which dimension the objects 
% will be stacked along.  For example, stacking two images along width
% would produce an output with the images side by side.  One and only one 
% of the dimension flags can be true.  
% 
%  "Value Data" 5
% All input objects must have value data.  The value size of each input 
% object will be zero-padded to the maximum of all sizes, except in the 
% stacking dimension.  The output size in the stacking dimension will 
% be the sum of that dimension across all input objects.  The output object 
% data type will be the highest data type of the input data objects.
% 
%  "Map Data" 5
% When some or all of the input objects have map data, the treatment of the 
% maps, and how the data is represented in the output object, depends on the 
% mapping option (mapping) specified by the user.
% Possible mapping options are:  (0) Map Data Thru Maps, (1) Use First Map Only,
% and (2) Create a Map for Each Input.
% If no input objects have maps, the mapping option is ignored.
% If there are doubts about which 
% mapping option to use, the safest bet is to map the data thru the maps.
% 	
% 	
%  "Map Data Thru Maps:" 5
% 	All data will be mapped before the data objects are combined.  The output
% 	object will not have a map.
% 	
%  "Use First Map Only:" 5
% 	In this case, the map data and color attributes of the first input 
% 	object that has a map are directly transferred to the output object. 
% 	The depth, time, and elements dimensions of that map must be 1, otherwise 
% 	this mapping option will fail.  Note that by selecting this mapping 
% 	option, you are assuming that the value segments of all objects being 
% 	appended have valid indices into that map.  
% 	
%  "Create a Map for Each Input:" 5
% 	(All input objects may have maps.)
% 	For each input object that does not have a map, one will be created for it.  
% 	The the output object color attributes will be copied from the first 
% 	input object that has a map.  New map values will be assigned using the 
% 	autocolor attribute.  
% 	
% 
% 	The map dimension corresponding to the stacking dimension (Depth, Time, 
% 	or Elements) will reflect the new size of the value data in that dimension, 
% 	and the maps from each object will be appended accordingly.  
% 	The maximum width and height of all maps will be propagated to the output,
% 	with zero-padding being applied where necessary.
% 	Padding in the other map dimensions may occur as well.
% 	For example, if objects with the following map and value 
% 	Depth sizes are being stacked along the Depth dimension,
% 	
% 			obj1  DEP=3  MAP_DEP = 3
% 			obj2  DEP=4  MAP_DEP = 1
% 			obj2  DEP=2  MAP_DEP = 2
% 	
% 	the resulting value data will have a depth of 9, so the map depth will be 9 
% 	too.  In this example, the second object's map will be zero-padded to have 
% 	a map depth of four.
% 	
% 
% 	If the objects are being combined along the width or 
% 	height dimensions, this mapping option will fail.
% 
% 
% 
% The output object map data type will be the highest of the input object map
% data types.
% 
%  "Mask Data" 5
% If any input object has mask data, then the output 
% object will also have mask data.  The mask data will be resized
% in the same manner as value data is resized.  The mask will be padded
% as valid (1). The highest 
% data type of input masks will be propagated to the output mask.
% 
%  "Location and Time Data" 5
% In all cases, the time and location data and/or attributes 
% of the first input object will transferred to the output 
% object.  If location or time data is propagated, data values
% along the stacking dimension will not be changed, and 
% therefore, the location or time data may become invalid.
%
%  
%
%  EXAMPLES
%
%  "SEE ALSO"
% DATAMANIP::kinset
%
%  RESTRICTIONS 
%
%  REFERENCES 
%
%  COPYRIGHT
% Copyright (C) 1993 - 1997, Khoral Research, Inc. ("KRI")  All rights reserved.
% 


function varargout = kkappend(varargin)
if nargin ==0
  Inputs={};arglist={'',''};
elseif nargin ==1
  Inputs=varargin{1};arglist={'',''};
elseif nargin ==2
  Inputs=varargin{1}; arglist=varargin{2};
else error('Usage: [out1,..] = kkappend(Inputs,arglist).');
end
if size(arglist,2)~=2
  error('arglist must be of form {''ParameterTag1'',value1;''ParameterTag2'',value2}')
 end
narglist={'i1', '__input';'i2', '__input';'i3', '__input';'i4', '__input';'i5', '__input';'i6', '__input';'i7', '__input';'i8', '__input';'i9', '__input';'i10', '__input';'o', '__output';'w', 0;'h', 0;'d', 0;'t', 0;'e', 0};
maxval={0,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0};
minval={0,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0};
istoggle=[0,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1];
was_set=istoggle * 0;
paramtype={'InputFile','InputFile','InputFile','InputFile','InputFile','InputFile','InputFile','InputFile','InputFile','InputFile','OutputFile','Toggle','Toggle','Toggle','Toggle','Toggle'};
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
[varargout{:}]=callKhoros([w 'kappend"  '],Inputs,narglist);
