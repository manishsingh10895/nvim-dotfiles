local keymap = vim.keymap

-- Recognize HCL and terraform files

vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])

-- automatically format on save ---
vim.cmd([[let g:terraform_fmt_on_save=1]])
vim.cmd([[let g:terraform_align=1]])
--


-- KEY bindings for calling terraform commands -- 
keymap.set("n", "<leader>ti", ":!terraform init<CR>")
keymap.set("n", "<leader>tv", ":!terraform validate<CR>")
keymap.set("n", "<leader>tp", ":!terraform plan<CR>")
keymap.set("n", "<leader>taa", ":!terraform apply -auto-approve<CR>")


