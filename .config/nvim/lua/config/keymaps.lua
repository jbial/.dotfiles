local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")

map({ "n", "v" }, "H", "^")
map({ "n", "v" }, "L", "$")
map({ "n", "i" }, "<leader>s", function()
  vim.cmd("write") -- Save the file
  if vim.fn.mode() == "i" then
    vim.cmd("stopinsert") -- Exit insert mode
  end
end, { desc = "Save file and exit insert mode" })
