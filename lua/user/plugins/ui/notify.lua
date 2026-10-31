return {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    opts = {
        stages = "fade_in_slide_out",
        timeout = 2000
    },
        init = function()
            vim.notify = require("notify")
        end
}
