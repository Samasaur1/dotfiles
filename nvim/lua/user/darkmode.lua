-- vim.cmd('set background=light')
local f = io.popen("uname", "r")
local s = f:read("*a")
f:close()
if s == "Darwin\n" then
  local handle = io.popen("defaults read -globalDomain AppleInterfaceStyle &> /dev/null && printf dark || printf light")
  local result = handle:read("*a")
  handle:close()
  vim.o.bg=result
else
  local dm = os.getenv("DARKMODE")
  if dm == "NO" then
    vim.o.bg="light"
  else
    vim.o.bg="dark"
  end
end
