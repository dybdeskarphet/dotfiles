function notify_long_tasks --on-event fish_postexec
    if test $CMD_DURATION -gt 10000
        set cmd $argv[1]

        # SET EXCEPTIONS
        set exceptions r y htop btop top vim nvim vi todo

        set cmd_name (string split ' ' $cmd)[1]
        if contains -- $cmd_name $exceptions
            return
        end

        set duration_s (math -s 0 "$CMD_DURATION / 1000")
        tput bel
        dunstify -a "$TERM" -i terminal "command took $duration_s seconds to finish." "$cmd"
    end
end
