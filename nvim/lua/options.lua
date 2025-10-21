vim.opt.number = true          -- 显示行号
vim.opt.relativenumber = true  -- 显示相对行号
vim.opt.tabstop = 4            -- Tab 键宽度为 4 个空格
vim.opt.shiftwidth = 4         -- 自动缩进宽度为 4 个空格
vim.opt.expandtab = true       -- 将 Tab 转换为空格
vim.opt.smartindent = true     -- 智能缩进
vim.opt.wrap = false 
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings = { "utf-8", "ucs-bom", "gb18030", "gbk", "gb2312", "cp936" }
vim.opt.termguicolors = true   -- 终端支持真彩色
vim.opt.cursorline = true      -- 高亮当前行

-- 设置字体
vim.opt.guifont = "ComicShannsMono Nerd Font:h15" -- 设置字体和大小

-- 取消欢迎界面
vim.opt.shortmess:append("sI") -- 取消欢迎界面

-- 括号自动匹配
vim.opt.showmatch = true -- 显示匹配的括号
vim.opt.matchtime = 1 -- 匹配括号的时间

vim.opt.mouse = "a" -- 启用鼠标支持

if vim.g.neovide then
  -- 启用抗锯齿
  vim.g.neovide_no_idle = true
  -- 使界面平滑
  vim.g.neovide_cursor_vfx_mode = 'pixiedust' -- 光标特效


end


vim.filetype.add({
    extension = {
        typ = "typst",
    },
})
vim.opt.updatetime = 400 -- 将光标停止后的触发时间降低到 400 毫秒

-- 启用诊断功能
vim.diagnostic.config({
    virtual_text = false, -- 在代码旁边显示诊断信息
    signs = true,        -- 在行号旁显示诊断符号
    underline = true,    -- 下划线标记诊断错误
    update_in_insert = false, -- 插入模式下不更新诊断
    severity_sort = true, -- 按严重性排序诊断
    float = {
        border = "rounded", -- 浮动窗口边框样式
        source = "always",  -- 始终显示源信息
        header = "",        -- 浮动窗口标题
        prefix = "",        -- 浮动窗口前缀
    },
})

-- 自动显示浮动窗口诊断信息
vim.api.nvim_create_autocmd("CursorHold", {
    pattern = "*",
    callback = function()
        vim.diagnostic.open_float(nil, { focusable = false })
    end,
})

