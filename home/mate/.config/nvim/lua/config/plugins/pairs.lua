return {
    "echasnovski/mini.pairs",
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {
        modes = { insert = true, command = true },
        skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
        skip_ts = { "string" },
        skip_unbalanced = true,
        markdown = true,
    },
}
