local command = vim.api.nvim_create_user_command

command("Q", "q", {})
command("W", "w", {})
command("Qa", "qa", {})
command("Wqa", "wqa", {})
command("Wq", "wq", {})
