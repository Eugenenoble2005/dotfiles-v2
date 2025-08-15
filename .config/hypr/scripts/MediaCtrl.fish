function next
    playerctl next
end

function prev
    playerctl previous
end

function toggle_play_pause
    playerctl play-pause
end

function stop
    playerctl stop
end

switch $argv[1]
    case next
        next
    case prev
        prev
    case pause
        toggle_play_pause
    case stop
        stop
end
