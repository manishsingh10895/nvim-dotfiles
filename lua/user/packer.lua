local fn = vim.fn
local install_path = fn.stdpath("data") .. "\\site\\pack\\packer\\start\\packer.nvim"

-- print(install_path)

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
  vim.cmd [[packadd packer.nvim]]
end

if fn.empty(fn.glob(install_path)) > 0 then
  print("bootstrapping")
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer, close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end



-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

-- Protected call to make sure that packer is installed
local status_ok, packer = pcall(require, "packer")

if not status_ok then
  print("not ok")
  return
end

print(status_ok)
