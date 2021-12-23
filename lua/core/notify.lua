local ok, notify = pcall(require, 'notify')

if ok then vim.notify = notify end

function Warn(msg, opts) vim.notify(msg, "warn", opts) end
function Error(msg, opts) vim.notify(msg, "error", opts) end
