local status, git = pcall(require, "git")
if (not status) then return end

git.setup({
  keymaps = {
    -- blame window
    blame = '<Leader>gb',
    quit_blame = 'q',
    -- Open file/folder in git repository
    browse = '<Leader>go',
    -- diff window
    diff = '<Leader>gd',
    diff_close = '<Leader>gD'
  }
})
