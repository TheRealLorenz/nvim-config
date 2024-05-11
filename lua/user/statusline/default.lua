local Mode = require 'user.statusline.modules.mode'
local Position = require 'user.statusline.modules.position'
local Filename = require 'user.statusline.modules.filename'
local FileInfo = require 'user.statusline.modules.fileinfo'
local Git = require 'user.statusline.modules.git'
local Diagnostics = require 'user.statusline.modules.diagnostics'
local CMake = require 'user.statusline.modules.cmake'

local Align = { provider = '%=' }
local Space = { provider = ' ' }

local Statusline = {
  Mode,
  Space,
  Git,
  Diagnostics,
  Filename,
  Align,

  CMake,
  FileInfo,
  Position,
}

return Statusline
