%kksetdattr 'Modify Data Object Attributes'
% This MatLab function was automatically generated by a converter (KhorosToMatLab) from the Khoros ksetdattr.pane file
%
% Parameters: 
% InputFile: i 'Input ', required: 'First Input data object'
% Integer: wkernel ' ', default: 0: 'integer'
% Integer: tkernel ' ', default: 0: 'integer'
% Integer: hkernel ' ', default: 0: 'integer'
% Integer: ekernel ' ', default: 0: 'integer'
% Integer: dkernel ' ', default: 0: 'integer'
% Integer: wpos ' ', default: 0: 'Sub-object width position with respect to parent object'
% Integer: hpos ' ', default: 0: 'Sub-object height position with respect to parent object'
% Integer: dpos ' ', default: 0: 'Sub-object depth position with respect to parent object'
% Integer: tpos ' ', default: 0: 'Sub-object time position with respect to parent object'
% Integer: epos ' ', default: 0: 'Sub-object elements position with respect to parent object'
% OutputFile: o 'Output', required: 'Resulting output data object'
%
% Example: o = kksetdattr(i, {'i','';'wkernel',0;'tkernel',0;'hkernel',0;'ekernel',0;'dkernel',0;'wpos',0;'hpos',0;'dpos',0;'tpos',0;'epos',0;'o',''})
%
% Khoros helpfile follows below:
%
%  PROGRAM
% ksetdattr - Modify Data Object Attributes
%
%  DESCRIPTION
% The "Set Data Attribute" operator allows the user to modify a 
% subset of the Input (i) data object attributes, and store the result
% to the Output (o).  The following data attributes can be modified by
% this program.  
% 
% Data Object Mask Attributes:
% 	
% 	
%  "Present Masked Data Values As..." 5
% 	This attribute has two possible settings: "Actual Value" and 
% 	"Substitute Value".  When datamanip processing routines operate on 
% 	value data that has a corresponding validity mask, processing speed is
% 	increased by not checking the mask value for each point to gate the
% 	operation based on that value.  Rather, all value data, valid or invalid,
% 	is processed, and the mask, after any necessary modifications, is 
% 	transferred to the output.  For certain operations, data marked as invalid 
% 	may cause mathematical or range errors.  Setting the "Present Masked 
% 	Data Values" attribute to "Substitute Value\fP allows alternate 
% 	values (real, imaginary pair) to be substituted in place of the invalid
% 	data for the operation.  Setting the attribute to "Actual Value" will 
% 	allow the processing routines to operate on the invalid data values.
% 	
%  "Substitution Value for Masked Data"
% 	If Present Masked Data Values is set to "Substitute Value", the 
% 	values used in the substitution, "Real Substitution Value" and 
% 	"Imaginary Substitution Value" can be explicitly set.
% 	If they are not set, the default value is (1,0).
% 
% 
% Data Convolution Kernel Attributes:
% 	
% 	
%  "Kernel Origin Coordinates"
% 	This attribute allows you to specify a "hot spot" in the data set
% 	that is interpreted as the center point of a 5 dimensional convolution
% 	kernel.  When setting this attribute, you must specify the coordinate
% 	of the kernel origin which is a 5-tuple comprised of (w,h,d,t,e).
% 
% 
% Data Object Uniform Location Data Attributes:
% 	
% 	
%  "Begin" 5
% 	The Location "Begin" attribute specifies the explicit coordinate
% 	of the data set that represents the implicit origin of the data model.
% 	When set, explicit uniform location data will be created on the data
% 	object.  If explicit rectilinear or curvilinear location data already
% 	exists on the input, it will be destroyed.  Warning - if the begin
% 	for any dimension is set using this program, the begin for all
% 	dimensions must be set (or the default value of 0 will be applied to
% 	unspecified dimensions).  
% 	
%  "End" 5
% 	The Location "End" attribute specifies the explicit coordinate
% 	of the data set that represents the implicit end of the data model.
% 	When set, explicit uniform location data will be created on the data
% 	object.  If explicit rectilinear or curvilinear location data already
% 	exists on the input, it will be destroyed.  Warning - if the end
% 	for any dimension is set using this program, the end for all
% 	dimensions must be set (or the default value of 0 will be applied to
% 	unspecified dimensions).
% 
% 
%  "Data Object Sub-Object Position" 5
% The "Sub-Object Position" attribute is the offset of the current 
% data object in a parent object.  Typically, the value of this attribute
% will be (0,0,0,0,0), but if this object was extracted from a "parent
% object", via kextract or other means, then this attribute will indicate
% the position in the parent object from which this region was extracted.
% Programs like kinsert can use this attribute to reinsert the subobject
% in the parent object.  Warning - if the sub-object position for any dimension 
% is set using this program, the sub-object position for all dimensions must 
% be set (or the default value of 0 will be applied to unspecified dimensions).
% 
%  "Data Object Point Size" 5
% The "Point Size" attribute indicates the physical dimension in world 
% coordinates of points in the data object.  Unless explicitly set, the data 
% object Point Size is (1,1,1,1,1).  Warning - if the point size for any
% dimension is set using this program, the size for all dimensions must 
% be set (or the default value of 1 will be applied to unspecified dimensions).
% 
%  "Color Attributes:" 5
% The "Colorspace" and \fIHas Alpha\fP attributes can be modified for 
% color interpretation and visualization.  For more information on these 
% attributes and their settings, see the help page for "Change Colorspace" 
% operator (kman icolorspace), and refer to Programming Services, Volume II, 
% Chapter 4, "Color Services". 
% 
% Other attributes that require modification of the data as well as the
% attribute value, such as data type and size, are better set using other
% programs such as the conversion operators (kconvert, kscale, etc.), and 
% the resize operators (kresample, kextract, etc.).
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
% Copyright (C) 1993 - 1997, Khoral Research, Inc. ("KRI")  All rights reserved.
% 


function varargout = kksetdattr(varargin)
if nargin ==0
  Inputs={};arglist={'',''};
elseif nargin ==1
  Inputs=varargin{1};arglist={'',''};
elseif nargin ==2
  Inputs=varargin{1}; arglist=varargin{2};
else error('Usage: [out1,..] = kksetdattr(Inputs,arglist).');
end
if size(arglist,2)~=2
  error('arglist must be of form {''ParameterTag1'',value1;''ParameterTag2'',value2}')
 end
narglist={'i', '__input';'wkernel', 0;'tkernel', 0;'hkernel', 0;'ekernel', 0;'dkernel', 0;'wpos', 0;'hpos', 0;'dpos', 0;'tpos', 0;'epos', 0;'o', '__output'};
maxval={0,0,0,0,0,0,0,0,0,0,0,0};
minval={0,0,0,0,0,0,0,0,0,0,0,0};
istoggle=[0,1,1,1,1,1,1,1,1,1,1,0];
was_set=istoggle * 0;
paramtype={'InputFile','Integer','Integer','Integer','Integer','Integer','Integer','Integer','Integer','Integer','Integer','OutputFile'};
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
[varargout{:}]=callKhoros([w 'ksetdattr"  '],Inputs,narglist);
