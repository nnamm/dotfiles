require('base')
require('highlights')
require('maps')
require('plugins')

local has = function(x)
  return vim.fn.has(x) == 1
end
local is_mac = has "macunix"
local is_unix = has "unix"

if is_mac then
  require('macos')
end
if is_unix then
  require('unix')
end
