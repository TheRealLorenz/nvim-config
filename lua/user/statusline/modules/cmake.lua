local ok, cmake = pcall(require, 'cmake-tools')

local Space = { provider = ' ' }

local CMakeBuildTarget = {
  init = function(self)
    self.buildTarget = cmake.get_build_target() or 'unselected'
  end,

  provider = function(self)
    return ' ' .. self.buildTarget
  end,
}

local CMakeLaunchTarget = {
  init = function(self)
    self.launchTarget = cmake.get_launch_target() or 'unselected'
  end,

  provider = function(self)
    return ' ' .. self.launchTarget
  end,
}

local CMakeBlock = {
  condition = function()
    return ok and cmake.is_cmake_project()
  end,

  CMakeBuildTarget,
  Space,
  CMakeLaunchTarget,
  Space,
}

return CMakeBlock
