function get_volume
    pamixer --get-volume
end

function inc_volume
    pamixer -i 5 --allow-boost --set-limit 100
    notify
end

function dec_volume
    pamixer -d 5
    notify
end

function notify
    notify-send -e -h int:value:(get_volume) -h string:x-canonical-private-synchronous:volume_notif -u low "Volume:" (get_volume)
end

switch $argv[1]
    case inc
        inc_volume
    case dec
        dec_volume
end
