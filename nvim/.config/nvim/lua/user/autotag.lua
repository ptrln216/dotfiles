-- Setup nvim-ts-autotag.
local status_ok, ntag = pcall(require, 'nvim-ts-autotag')
if not status_ok then
  return
end

ntag.setup({
  filetypes = {
    'html', 'javascript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'rescript'
  },
   skip_tags = {
    'area', 'base', 'br', 'col', 'command', 'embed', 'hr', 'img', 'slot',
    'input', 'keygen', 'link', 'meta', 'param', 'source', 'track', 'wbr','menuitem'
  }
})
