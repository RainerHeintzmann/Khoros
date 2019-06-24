%kTimer 'Timer Object Menuform'
% This MatLab function was automatically generated by a converter (KhorosToMatLab) from the Khoros Timer.pane file
%
% Parameters: 
%
% Example: kTimer( {})
%
% Khoros helpfile follows below:
% .begin tagged
% 
% .item "The Timer Visual Object"
% The timer object is provided for use as a stopwatch.  It displays the current 
% time (including seconds) according to the system clock of the computer.  It can 
% be started and stopped as desired, and the update time can be specified 
% to fractions of a second.  The timer object is a specialized annotation 
% subclassed from the string visual object.  The (x, y) location of the lower 
% left corner of the timer timer may be specified in device coordinates or 
% world coordinates by the application.  The menuform, however, displays the 
% world coordinate location of the timer, regardless of whether the application 
% used world or device coordinates to specify that location.  Attributes of the 
% timer object that can be interactively specified in addition to its world 
% coordinate placement include its start time, and update time, in addition to 
% its justification, style, font, and colors.
% 
% .item "Update Time"
% This double selection specifies, in fractions of a second, how often
% the timer is updated.  For example, an update time of 5 would cause the timer
% to update every 5 seconds, while an update time of 0.25 would cause the timer
% to update 4 times every second.
% 
% .item "Start Time"
% This double selection gives the start time of the timer.  By default it
% is time = 0.0, but it can be set to any number greater than zero.
% 
% .item "Justification"
% This attribute specifies the justification of the string displaying the
% time "with respect to the width and height of the timer object itself,
% not its parent".  
% Thus, if the timer object is just large enough to accomodate the time, 
% justification will have little (if any) effect, as the time string has no 
% room to "move" within its boundaries.  However, if the width and height are
% set to "larger" than what is necessary to display the time, the 
% justification will take effect.  Justification may be set to "Center", 
% "Top", "Bottom", "Left", "Right", "TopRight", "TopLeft", "BottomRight", 
% or "BottomLeft".
% 
% .item "Fill Background"
% When set to true, this attribute indicates that the background of the timer
% object should appear in the fill color (background color).
% 
% .item "String Style"
% The date can be displayed in one of four styles: plain, emphasized, embossed
% in, or embossed out.  When the "plain" style is used, the date is drawn once,
% in the foreground color. When the date is "emphasized", it is double-drawn
% using both the foreground and highlight colors;  this causes it to have a bold,
% or emphasized, effect. When the "embossed in" style is used, the date will
% appear embossed "into" the background; both the foreground and highlight
% colors are used in embossing.  The "embossed out" style also causes the date
% to appear embossed, but the date will seem to come "out of" rather than
% "into" the background.
% 
% .item "Font"
% Some of the fonts that are most commonly used with the date object are
% available in the stringlist menu;  or, you may provide your own in the text
% parameter box.
% .so  $DESIGN/manual/shared/xvobjects/general/FontName.sec
% 
% .item "Foreground Color"
% This stringlist selection lets you set the foreground color of the timer object.
% The foreground color is always used to draw the time string,
% regardless of the "String Style".
% 
% .item "Background Color"
% This stringlist selection lets you set the background color (fill color) of 
% the timer object.  It is only used when "Fill Background" is set to true.
% 
% .item "Highlight Color"
% This stringlist selection lets you set the highlight color; the highlight
% color is an additional color used in drawing the time string when the 
% "String Style" is set to "Emphasized", "Embossed In", or "Embossed Out".
% 
% .item "X Placement, Y Placement"
% This pair of double values specifies the (x, y) location of the lower left
% hand corner of the timer visual object in world coordinates.
% 
% .end tagged


function varargout = kTimer(varargin)
Inputs={};
if nargin ==0
  arglist={'',''};
elseif nargin ==1
  arglist=varargin{1};
else error('Usage: [out1,..] = kTimer(arglist).');
end
if size(arglist,2)~=2
  error('arglist must be of form {''ParameterTag1'',value1;''ParameterTag2'',value2}')
 end
narglist={};
maxval={};
minval={};
istoggle=[];
was_set=istoggle * 0;
paramtype={};
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
  varargout = cell(0);
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
callKhoros([w 'Timer" '],Inputs,narglist);