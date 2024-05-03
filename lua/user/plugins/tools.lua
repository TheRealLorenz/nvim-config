return {
  {
    'Civitasv/cmake-tools.nvim',
    config = function()
      require('cmake-tools').setup {
        cmake_build_directory = 'cmake-build-${variant:buildType}',
        cmake_soft_link_compile_commands = false,
        cmake_runner = {
          name = 'toggleterm',
          default_opts = {
            toggleterm = {
              direction = 'horizontal',
              singleton = true,
            },
          },
        },
        cmake_executor = {
          name = 'toggleterm',
          default_opts = {
            toggleterm = {
              direction = 'horizontal',
              singleton = true,
            },
          },
        },
      }
    end,
    ft = { 'cmake', 'cpp', 'c' },
  },
}
