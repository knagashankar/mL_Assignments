## Copyright (C) 2016 user
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} alphaiterPlot (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: user <user@DESKTOP>
## Created: 2016-09-19

function [retval] = alphaiterPlot (alphas)
  
  % loading data from file and initialising required variables
  data = load('ex1data2.txt');
  
  X = data(:, 1:2); % input values of learning data
  y = data(:, 3); %output values of learning data
  m = length(y); % number of learning examples
  
  % normalising the data to the range 0 < values < 1
  [X mu sigma] = featureNormalize(X);
  % Add intercept term to X, x0
  X = [ones(m, 1) X];
  
  color = ["k", "r", "g", "b", "m", "c", "w"]; % initiating color vector
  figure;
  
  for i = 1:length(alphas)
  
    alpha = alphas(i);
    num_iters = 600;
    
    % Init Theta and Run Gradient Descent 
    theta = zeros(3, 1);
    [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);
    
    % cycling through the color list for plotting in graph
    if i == 7
      cnum = 1;
    else
      cnum = mod(i,7);
    end
    
    %plotting J_history vs number of iterations
    plot(1:numel(J_history), J_history, 'color', color(cnum),'DisplayName', num2str(alpha), 'LineWidth', 2 );
    xlabel('Number of iterations');
    ylabel('Cost J');
    hold on;
   
  end
  legend('show');
  hold off;
  
endfunction
