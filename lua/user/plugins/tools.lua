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
              single_terminal_per_instance = true,
            },
          },
        },
        cmake_executor = {
          name = 'toggleterm',
          default_opts = {
            toggleterm = {
              direction = 'horizontal',
              single_terminal_per_instance = true,
            },
          },
        },
      }
    end,
    ft = { 'cmake', 'cpp', 'c' },
  },
}
