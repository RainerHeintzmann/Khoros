%kcfuzzycmeans 'Performs Fuzzy C-Means Clustering '
% This MatLab function was automatically generated by a converter (KhorosToMatLab) from the Khoros cfuzzycmeans.pane file
%
% Parameters: 
% InputFile: i1 'Input data object', required: 'input data object'
% InputFile: i2 'Input initial cluster centers', optional: 'input initial cluster centers'
% InputFile: i3 'Input initial membership functions', optional: 'input initial membership functions'
% InputFile: i4 'Input membership functions biases', optional: 'input membership functions biases'
% Integer: c 'Number of clusters', default: 2: 'number of clusters'
% Integer: n 'Max number of iterations', default: 50000: 'max number of iterations'
% Toggle: map 'Generate output map', default: 0: 'generate output map'
% Toggle: spectrum 'SPECTRUM compatable map segment', default: 0: 'SPECTRUM compatable map segment'
% OutputFile: o1 'Cluster number output object', required: 'Cluster number output object'
% OutputFile: o2 'Cluster center output object', optional: 'Cluster center output object'
% OutputFile: o3 'Cluster variance output object', optional: 'Cluster variance output object'
% OutputFile: o4 'Cluster membership count output', optional: 'Cluster membership count output'
% OutputFile: o5 'Final membership functions', optional: 'Data final membership functions'
% OutputFile: o6 'FCM statistics output (ASCII)', optional: 'FCM statistics output (ASCII)'
%
% Example: [o1, o2, o3, o4, o5, o6] = kcfuzzycmeans({i1, i2, i3, i4}, {'i1','';'i2','';'i3','';'i4','';'c',2;'n',50000;'map',0;'spectrum',0;'o1','';'o2','';'o3','';'o4','';'o5','';'o6',''})
%
% Khoros helpfile follows below:
%
%  PROGRAM
% cfuzzycmeans - Performs Fuzzy C-Means Clustering
%
%  DESCRIPTION
% The "cfuzzycmeans" kroutine will perform Fuzzy C-Means Clustering in all non-masked vectors in the input image passed by the parameter [-i1]. The Fuzzy C-Means clustering algorithm considers that one vector can belong to more than one cluster and belong to clusters to different extents. As an example, the vector X can belong 0.5 to cluster A, 0.3 to cluster B, 0.4 to cluster C and 0.1 to cluster D.
% Fuzzy values are \fBnot" probabilities, so they don't need to sum up to one. To be used as a classifier, the fuzzy membership values must be defuzzified later (the program can also do this), with an alternative minimum membership threshold. This allows possible rejection of pixels which membership functions are too low to be considered really belonging to a cluster.
% The number of clusters must be specified with the parameter [-c]. Initial c cluster centers can be passed to the routine, if cluster centers are not passed, they will be selected randomically unless the parameter [-i4] is used (see below).
% The exponential weight value passed by the parameter [-m] controls the fuzzyness of the clustering: values close to 1 will assign strong membership function values to the points, while values higher will assign smaller membership function values. 
% Clustering is iterated until a maximum number of iterations specified by the parameter [-n] is achieved or until the objective function for the clustering has a difference smaller than the specified by the parameter [-epsilon] from its last iteration.
% At the end of clustering, the membership functions will be scanned for the largest value for defuzzification. Only membership functions over the parameter [-alpha] will be considered, meaning that points which membership functions are all under alpha will be masked since they cannot be assigned to any cluster.
% The user can pass initial cluster centers with the parameter [-i2], as with the "kkmeans" program. If passed, this data must have dimensions Cx1x1x1xE, where C is the number of classes and E is the number of elements in the [-i1] input data. 
% Other optional input data can be passed: initial membership function values with [-i3], with dimensions WxHxDxTxC, where W,H,D,T are the width, height, depth and time dimensions of the input data. If this parameter is not used the initial membership values will be random. This routine also can use biases for the membership functions passed with the [-i4] parameter, with a data object with dimensions WxHxDxTxC. If data is passed by the [-i4] parameter the initial cluster centers and membership functions will be calculated using these biases.
% Most output files for this function are compatible with "kkmeans". The first output [-o1] will contain the clustered output which was defuzzified as described above. If the parameter [-map] is passed, a map will be created using the values from the center of the clusters. If the parameter [-spectrum] is passed, a map compatible with the info spectrum expects will be created.
% If the parameter [-o2] is passed, it will create a file with the cluster centers stored row by row in the value segment. If the parameter [-o3] is passed, it will create a file containing contains cluster variances stored row by row in the value segment. If the parameter [-o4] is passed, it will create a file with the cluster vector counts stored row by row in the value segment. If the parameter [-o5] is passed, it will create a file with the final membership functions in the value segment. The outputs for the parameters [-o2], [-o3] and [-o4] will be created considering the defuzzified output of the routine.
% Please refer to the Classify toolbox manual for more information on the Fuzzy C-Means algorithm.
%
%  
%
%  EXAMPLES
% All examples for the Classify toolbox are listed on the Classify Toolbox Manual. For an example of this routine, please see the Classify:workspaces:FuzzyCMeans example workspace.
%
%  "SEE ALSO"
% kmeans, ckmeans2, the Classify Toolbox Manual.
%
%  RESTRICTIONS 
% Restrictions on the input data dimensions as shown in the Description section above.
%
%  REFERENCES 
% All references for the Classify toolbox are listed on the Classify Toolbox Manual.
%
%  COPYRIGHT
% Copyright (C) 1997 Rafael Santos. Khoros (C) Khoral Research, Inc.
% 


function varargout = kcfuzzycmeans(varargin)
if nargin ==0
  Inputs={};arglist={'',''};
elseif nargin ==1
  Inputs=varargin{1};arglist={'',''};
elseif nargin ==2
  Inputs=varargin{1}; arglist=varargin{2};
else error('Usage: [out1,..] = kcfuzzycmeans(Inputs,arglist).');
end
if size(arglist,2)~=2
  error('arglist must be of form {''ParameterTag1'',value1;''ParameterTag2'',value2}')
 end
narglist={'i1', '__input';'i2', '__input';'i3', '__input';'i4', '__input';'c', 2;'n', 50000;'map', 0;'spectrum', 0;'o1', '__output';'o2', '__output';'o3', '__output';'o4', '__output';'o5', '__output';'o6', '__output'};
maxval={0,1,1,1,2,100000,0,0,0,1,1,1,1,1};
minval={0,1,1,1,2,0,0,0,0,1,1,1,1,1};
istoggle=[0,1,1,1,0,1,1,1,0,1,1,1,1,1];
was_set=istoggle * 0;
paramtype={'InputFile','InputFile','InputFile','InputFile','Integer','Integer','Toggle','Toggle','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile','OutputFile'};
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
[varargout{:}]=callKhoros([w 'cfuzzycmeans"  '],Inputs,narglist);
