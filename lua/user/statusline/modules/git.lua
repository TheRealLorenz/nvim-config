local Git = {
  condition = function()
    return vim.bo.buftype == ''
      and vim.b.gitsigns_head
      and vim.b.gitsigns_status
  end,

  init = function(self)
    self.head = vim.b.gitsigns_head
    self.status = vim.b.gitsigns_status ~= '' and ' ' .. vim.b.gitsigns_status
      or ''
  end,

  provider = function(self)
    return string.format(' %s%s ', self.head, self.status)
  end,
}

return Git
