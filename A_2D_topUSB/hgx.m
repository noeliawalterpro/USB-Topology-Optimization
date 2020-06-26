function hgx(varargin)

%The inputs can either be a figure handle and a file name, or just a file name (string). If only a filename is supplied, the current figure is saved.

% Check all input arguements given
for ai = 1:length(varargin)
    switch class(varargin{ai})
        case 'matlab.ui.Figure'
            % Save any handles to h
            h = varargin{ai};
        case 'char'
            % Save any string to fnG (filename)
            fnG = varargin{ai};
    end
end

%The first block of code checks the inputs, extracts them from varargin (which is a cell array containing each input). If one of the cells contains a figure handles it's assigned to the variable h to use later. The file name is saved in the variable fnG.

% If handle not specified, get current figure
if ~exist('h', 'var')
    figHandles = get(0,'Children');
    h = figHandles(1);
end

%Next, the function checks to see if h exists. If a handle wasn't specified when the function was called, it won't exist yet. If it doesn't exist, the handle for the current figure is found. 

if strcmp(fnG(end-3:end), '.png')
    % Just .png using hgexport
    hgexport(h, fnG, hgexport('factorystyle'), 'Format', 'png');
elseif strcmp(fnG(end-3:end), '.fig') || strcmp(fnG(end-3:end), '.svg')
    % Just .fig/.svg using saveas 
    saveas(h, fnG);
else
    % Assume no extentsion, export .png and .fig
    hgexport(h, [fnG, '.png'], hgexport('factorystyle'), 'Format', 'png');
    saveas(h, [fnG, '.fig']);
    saveas(h, [fnG, '.svg']);
end