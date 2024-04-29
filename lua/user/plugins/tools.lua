return {
  {
    'Civitasv/cmake-tools.nvim',
    config = function()
      require('cmake-tools').setup {
        cmake_build_directory = 'cmake-build-${variant:buildType}',
      }
    end,
    ft = { 'cmake', 'cpp', 'c' },
  },
}
