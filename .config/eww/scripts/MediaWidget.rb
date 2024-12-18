isSpotify = `playerctl metadata`.split(" ")[0] == "spotify";
if ARGV[0] == "--is-spotify"
    puts isSpotify
end

case ARGV[0]
when "--artist"
    puts `playerctl metadata xesam:artist`
when "--title"
    puts `playerctl metadata xesam:title`
when "--arturl"
    remote_art_url = `playerctl metadata mpris:artUrl`
    #check if internet is reachable
    if(`curl -s head www.google.com -m 1`.empty?)
    puts "No internet connection"

    else
      puts remote_art_url
    end
end
