local dashboard = require('dashboard')

dashboard.setup {
    config = {
        header = {
            '',
            '█████  █████             ███                                          ',
            '░░███  ░░███             ░░░                                          ',
            ' ░███   ░███  ████████   ████   ██████   ██████  ████████  ████████   ',
            ' ░███   ░███ ░░███░░███ ░░███  ███░░███ ███░░███░░███░░███░░███░░███  ',
            ' ░███   ░███  ░███ ░███  ░███ ░███ ░░░ ░███ ░███ ░███ ░░░  ░███ ░███  ',
            ' ░███   ░███  ░███ ░███  ░███ ░███  ███░███ ░███ ░███      ░███ ░███  ',
            ' ░░████████   ████ █████ █████░░██████ ░░██████  █████     ████ █████ ',
            '  ░░░░░░░░   ░░░░ ░░░░░ ░░░░░  ░░░░░░   ░░░░░░  ░░░░░     ░░░░ ░░░░░  ',
            '',
            -- 'Bao Nguyen - Unicorn',
        }, --your header
        center = {
            {
                icon = '',
                icon_hl = 'group',
                desc = 'description',
                desc_hl = 'group',
                key = 'shortcut key in dashboard buffer not keymap !!',
                key_hl = 'group',
                action = '',
            },
        },
        footer = {},
    }
}
