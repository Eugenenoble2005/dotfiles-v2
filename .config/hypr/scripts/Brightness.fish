function get_backlight
    brightnessctl | string match -r "brightness: .* \(([0-9]+)" -g
end

function brightness
    echo hello world
end

function notify
    notify-send -e -h string:x-canonical-private-synchronous:brightness_notif -h int:value:(get_backlight) -u low Screen "Brightness:$(get_backlight)%"
end

function change_brightness
    set func $argv[1]
    set current_brightness (get_backlight)
    if test $func = inc
        set new_brightness (math $current_brightness + 3)
    else
        set new_brightness (math $current_brightness -3)
    end
    if test $new_brightness -lt 1
        set new_brightness 1
    end
    echo brightness is $new_brightness
    brightnessctl set $new_brightness%
    notify
end

function main
    switch $argv[1]
        case inc
            change_brightness inc
        case dec
            change_brightness dec
    end
end

main $argv
