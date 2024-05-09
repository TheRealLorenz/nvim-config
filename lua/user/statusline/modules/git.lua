local Git = {
  condition = function()
    return vim.bo.buftype == '' and vim.b.gitsigns_head
  end,

  provider = function()
    local s = ' ' .. vim.b.gitsigns_head
    if vim.b.gitsigns_status then
      s = s .. ' ' .. vim.b.gitsigns_status
    end
    return s .. ' '
  end,
}

return Git
