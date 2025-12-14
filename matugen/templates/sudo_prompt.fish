if test "$COLORTERM" = "truecolor"
    set -gx SUDO_PROMPT (printf '\e[38;2;{{colors.primary.dark.red}};{{colors.primary.dark.green}};{{colors.primary.dark.blue}}m\e[48;2;{{colors.primary.dark.red}};{{colors.primary.dark.green}};{{colors.primary.dark.blue}}m\e[1;38;2;0;0;0msudo\e[0m\e[38;2;{{colors.primary.dark.red}};{{colors.primary.dark.green}};{{colors.primary.dark.blue}}m \e[1;38;2;255;255;255mpassword for %%u: \e[0m')
else
    set -gx SUDO_PROMPT (string join '' \
        (tput bold) (tput setaf 1) 'sudo ' (tput sgr0) \
        (tput setaf 7) 'password for %u: ' (tput sgr0))
end

