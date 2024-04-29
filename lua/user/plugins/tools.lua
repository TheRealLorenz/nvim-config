return {
  {
    'Civitasv/cmake-tools.nvim',
    config = function()
      require('cmake-tools').setup {
        cmake_build_directory = 'cmake-build-${variant:buildType}',
        cmake_soft_link_compile_commands = false,
      }
    end,
    ft = { 'cmake', 'cpp', 'c' },
  },
}
