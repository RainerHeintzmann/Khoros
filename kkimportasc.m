%kkimportasc 'Import ASCII Data File to Data Segment'
% This MatLab function was automatically generated by a converter (KhorosToMatLab) from the Khoros kimportasc.pane file
%
% Parameters: 
% InputFile: i1 'ASCII Input File', required: 'ASCII input data file containing new data segment'
% InputFile: i2 'Data Object Input', optional: 'data object input to insert the new segment into'
% Integer: so 'Start Offset ', default: 0: 'starting point in ASCII input file to start importing at'
% Integer: sf 'Skip Factor ', default: 0: 'number of points in ASCII file to skip between reads'
% Integer: nr 'Number of Reads ', default: 1: 'number of points in ASCII file to read between skips'
% Integer: dim 'Segment Dimension ', default: 5: 'dimension of the segment'
% OutputFile: o 'Output Object', required: 'output data object'
% Integer: wsize 'WIDTH ', default: 1: 'size of width dimension in index specified'
% Integer: hsize 'HEIGHT ', default: 1: 'size of height dimension in index specified'
% Integer: dsize 'DEPTH ', default: 1: 'size of depth dimension in index specified'
% Integer: tsize 'TIME ', default: 1: 'size of time dimension in index specified'
% Integer: esize 'ELEMENTS ', default: 1: 'size of elements dimension in index specified'
%
% Example: o = kkimportasc({i1, i2}, {'i1','';'i2','';'so',0;'sf',0;'nr',1;'dim',5;'o','';'wsize',1;'hsize',1;'dsize',1;'tsize',1;'esize',1})
%
% Khoros helpfile follows below:
%
%  PROGRAM
% kimportasc - Import ASCII Data File to Data Segment
%
%  DESCRIPTION
% This routine will import an ASCII data file and insert it into a
% specified data object.  The new segment will be inserted into this
% data object.  If a source object was specified, then all of its data
% segments and the global object attributes will be copied to the
% destination.  If no source object was specified, then the resulting
% output object will contain only the imported segment.
% There are four attributes of the new segment that can be specified:
% dimension, index order, size and data type.  The number of indices
% and sizes specified must be equal to the dimension.
% The parameter dimension must be greater than 0 and and less than or
% equal to 5. 
% The segment size is an optional argument specified by five different
% size variables: 'wsize', 'hsize', 'dsize', 'tsize', and 'esize'.  Each size
% variable must be >= to 1.  Note that although the size variables are
% optional, if no size variables are specified, the output will be of 
% size 1.
% The index order is also specified by five different variables: 
% 'windex', 'hindex', 'dindex', 'tindex', and 'eindex'.  The value for each 
% index variable must be unique and range from 1 to 5.  Note that the index
% order dictates how data is stored and retrieved.  For example if the
% index order is specified as windex 1, hindex 2, dindex 3, tindex 4,
% eindex 5 then data will be accessed along width first, followed by height, 
% depth, time, and elements.  If, however the index order is specified as 
% eindex 1, windex 2, hindex 3, dindex 4, tindex 5 then data will be accessed 
% along elements first, followed by width, height, depth, and time.
% The start offset specifies the point in the ASCII data from which to 
% start importing in the data into the specified segment.  All points before 
% the start offset are ignored.
% The skip factor specifies the number of points to skip in the ASCII data
% between reads.  
% The number of reads specifies the number of points to read before skipping.
% For example, if the number of reads is 2 and the skip factor is 3, two
% values will be read, three will be skipped, followed by two more reads,
% three skips, etc. until all the data has been read.
% If the segment_name is one of the Polymorphic segments, the correct
% dimensionality must be provided :
% 
%          Segment Name               Dimension
%        ---------------------------------------------------
%              KDA_SEGMENT_VALUE         5
%              KDA_SEGMENT_MAP           5
%              KDA_SEGMENT_MASK          5
%              KDA_SEGMENT_LOCATION      4
%              KDA_SEGMENT_TIME          1
% 
% When importing ASCII data to either the value, map, or mask segment, all
% five size variables (wsize, hsize, dsize, tsize, and esize) may be specified
% since these segments are five dimensional.  Likewise, a five dimensional
% index order may be provided. 
% When importing ASCII data to the locations segment, only four size variables
% (wsize, hsize, dsize, and esize) may be specified since the location segment
% is four dimensional.  Likewise only a four dimensional index order (windex,
% hindex, dindex, eindex) may be provided.
% When importing ASCII data to the time segment, only one size variable
% (tsize) may be specified since the location segment is one dimensional.
% Likewise only a one dimensional index order (tindex) may be provided.
% Complex values in ASCII are represented by number pairs, surrounded
% by parenthesis and separated by a comma.  These numbered pairs correspond
% to the real and imaginary values respectively.  For example, (8, 3) represents
% the complex number 8+3i.
%
%  
%
%  EXAMPLES
% Consider a simple ASCII input file which looks as follows:
% 
% 	file:  "ascii_data"
% 	1 2 3 4
% 	1 2 3 4
% 	1 2 3 4
% 	1 2 3 4
% 	1 2 3 4
% 
% This data can be imported into the 'value' segment in any number of ways which
% is illustrated in the following four examples.
% .I 
% Value Segment Example 1
% % kimportasc -i1 ascii_data -o output -wsize 2 -hsize 5 -dsize 1 -tsize 1 -esize 1 -so 0 -sf 1 -nr 1 -windex 1 -hindex 2 -dindex 3 -tindex 4 -eindex 5 -segment value -type 6
% This will import the above ASCII data into the value segment of a polymorphic 
% data object such that the size is "2x5x1x1x1", index order is "w,h,d,t,e", 
% and data type is integer.  The output from kimportasc would conceptually
% look as follows:
% 
% 	1 3
% 	1 3
% 	1 3
% 	1 3
% 	1 3
% 
% .I 
% Value Segment Example 2
% % kimportasc -i1 ascii_data -o output -wsize 1 -hsize 5 -dsize 1 -tsize 1 -esize 1 -so 1 -sf 3 -nr 1 -windex 1 -hindex 2 -dindex 3 -tindex 4 -eindex 5 -segment value -type 4
% This will import the above ASCII data into the value segment of a polymorphic 
% data object such that the size is "1x5x1x1x1", index order is "w,h,d,t,e", 
% and data type is short.  The output from kimportasc would conceptually 
% look as follows:
% 
% 	2
% 	2
% 	2
% 	2
% 	2
% 
% .I 
% Value Segment Example 3
% % kimportasc -i1 ascii_data -o output -wsize 3 -hsize 5 -dsize 1 -tsize 1 -esize 1 -so 1 -sf 1 -nr 3 -windex 1 -hindex 2 -dindex 3 -tindex 4 -eindex 5 -segment value -type 10
% This will import the above ASCII data into the value segment of a polymorphic
% data object such that the size is "3x5x1x1x1", index order is "w,h,d,t,e",
% and data type is float.  The output from kimportasc would conceptually 
% look as follows:
% 
% 	2 3 4
% 	2 3 4
% 	2 3 4
% 	2 3 4
% 	2 3 4
% 
% .I 
% Value Segment Example 4
% % kimportasc -i1 ascii_data -o output -wsize 5 -hsize 4 -dsize 1 -tsize 1 -esize
%  1 -so 0 -sf 0 -nr 20 -segment value -type 8
% This will import the above ASCII data into the value segment of a polymorphic
% data object such that the size is "4x5x1x1x1", index order is "w,h,d,t,e",
% and data type is long.  The output from kimportasc would conceptually look
% as follows:
% 
% 	1 2 3 4 1 
% 	2 3 4 1 2 
% 	3 4 1 2 3 
% 	4 1 2 3 4
% 
% The same input data can be imported into the 'map' segment which is 
% illustrated in the following example.
% .I 
% Map Segment Example
% % kimportasc -i1 ascii_data -i2 data_without_map -o output -wsize 4 -hsize 5 -dsize 1 -tsize 1 -esize 1 -so 0 -sf 0 -nr 1 -windex 1 -hindex 2 -dindex 3 -tindex 4 -eindex 5 -segment map -type 6
% This will import the above ASCII data into the map segment of the polymorphic 
% data object specified by the input file "data_without_map" such that the size 
% of the map is "4x5x1x1x1", index order is "mw,mh,md,mt,me", and data type is 
% integer, where "mw,mh,md,mt,me" coorespond to map width, map height, map depth,
% map time, and map elements respectively.  The map segment output from 
% kimportasc would conceptually look like the input ASCII data.
% 
% 	1 2 3 4
% 	1 2 3 4
% 	1 2 3 4
% 	1 2 3 4
% 	1 2 3 4
% 
% .I 
% Mask Segment Example
% The following input data can be imported into the 'mask' segment which is
% illustrated in the following example.
% 
% 	file:  "map_ascii_data"
% 	1 0 0 1
% 	0 0 1 0
% 	1 1 0 0
% 	1 1 1 1
% 	1 0 1 0
% 
% % kimportasc -i1 map_ascii_data -i2 data_without_mask -o output -wsize 4 -hsize 5 -dsize 1 -tsize 1 -esize 1 -so 0 -sf 0 -nr 1 -windex 1 -hindex 2 -dindex 3 -tindex 4 -eindex 5 -segment mask -type 6
% This will import the above ASCII data into the mask segment of the polymorphic
% data object specified by the input file "data_without_mask" such that the size
% of the mask is "4x5x1x1x1", index order is "w,h,d,t,e" and data type is
% integer.  The mask segment output from kimportasc would conceptually look 
% like the ASCII input.
% .I 
% Time Segment Example
% The following input data can be imported into the 'time' segment which is
% illustrated in the following example.
% 
% 	file: "time_ascii_data"
% 	1 5 10 15 19 36 40 52
% 
% % kimportasc -i1 time_ascii_data -i2 data_with_time_series -o output -tsize 8 -so 0 -sf 0 -nr 1 -tindex 1 -segment time -type 6 -dim 1
% This will import the above ASCII data into the time segment of the polymorphic
% data object specified by the input file "data_with_time_series" such that the
% size of the explicit time segment is "8", index order is "t", and data type is
% integer.  The time segment output from kimportasc would conceptually look
% like the ASCII input.
% .I 
% Location Segment Example
% The following input data can be imported into the 'location'segment which
% is illustrated in the following example.
% 
% 	file:  "location_ascii_data"
% 	1  3  5  7
% 	9  11 13 15
% 	17 19 21 23
% 	25 27 29 31
% 	33 35 37 39
% 
% % kimportasc -i1 location_ascii_data -i2 data_without_locations -o output -wsize 4 -hsize 5 -dsize 1 -esize 1 -so 0 -sf 0 -nr 1 -windex 1 -hindex 2 -dindex 3 -eindex 4 -segment location -type 6 -dim 4
% This will import the above ASCII data into the location segment of the 
% polymorphic data object specified by the input file "data_without_locations"
% such that the size of the explicit location segment is "4x5x1x1", index
% order is "w,h,d,e", and data type is integer.  The location segment output 
% from kimportasc would conceptually look like the ASCII input.
%
%  "SEE ALSO"
% kasc2val, kasc2mask, kasc2loc, kasc2time, kasc2map
%
%  RESTRICTIONS 
% If no size variables are specified (wsize, hsize, dsize, tsize, or esize),
% the output data object will be of size 1.
%
%  REFERENCES 
%
%  COPYRIGHT
% Copyright (C) 1993 - 1997, Khoral Research, Inc. ("KRI")  All rights reserved.
% 


function varargout = kkimportasc(varargin)
if nargin ==0
  Inputs={};arglist={'',''};
elseif nargin ==1
  Inputs=varargin{1};arglist={'',''};
elseif nargin ==2
  Inputs=varargin{1}; arglist=varargin{2};
else error('Usage: [out1,..] = kkimportasc(Inputs,arglist).');
end
if size(arglist,2)~=2
  error('arglist must be of form {''ParameterTag1'',value1;''ParameterTag2'',value2}')
 end
narglist={'i1', '__input';'i2', '__input';'so', 0;'sf', 0;'nr', 1;'dim', 5;'o', '__output';'wsize', 1;'hsize', 1;'dsize', 1;'tsize', 1;'esize', 1};
maxval={0,1,1,1,2,2,0,2,2,2,2,2};
minval={0,1,1,1,2,2,0,2,2,2,2,2};
istoggle=[0,1,1,1,1,1,0,1,1,1,1,1];
was_set=istoggle * 0;
paramtype={'InputFile','InputFile','Integer','Integer','Integer','Integer','OutputFile','Integer','Integer','Integer','Integer','Integer'};
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
[varargout{:}]=callKhoros([w 'kimportasc"  '],Inputs,narglist);
