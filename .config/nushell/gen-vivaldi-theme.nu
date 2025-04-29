def gen-vivaldi-theme [ ] {
  let mat = open ~/.matugen.json | get colors
  let source = $mat | get light | get source_color
  cd ~/Pictures/wallpapers;
  let bg = ls | where name ends-with .png or name ends-with .jpg | sort-by modified | last | get name;
    mkdir ~/staging-area
  let themeconfig = $'
    {
       "accentFromPage": false,
       "accentOnWindow": false,
       "accentSaturationLimit": 1,
       "alpha": 0.85,
       "backgroundImage": "background.($bg | path parse | get extension)",
       "backgroundPosition": "stretch",
       "blur": 6,
       "colorAccentBg": "($source)",
       "colorBg": "($mat | get light | get on_background)",
       "colorFg": "($mat | get dark | get on_surface )",
       "colorHighlightBg": "#9e99ff",
       "colorWindowBg": "#f7f7f7",
       "contrast": 0,
       "dimBlurred": false,
       "engineVersion": 1,
       "id": "d08e9698-4ecd-4d04-8868-09cf06fe4953",
       "name": "Matugen",
       "preferSystemAccent": false,
       "radius": -1,
       "simpleScrollbar": true,
       "transparencyTabBar": true,
       "transparencyTabs": false,
       "url": "https://themes.vivaldi.net/themes/je3lRVxElVG/status.json",
       "version": 1
    }
    ';
    mkdir ~/staging-area;
    let ext = $bg | path parse | get extension;
    $themeconfig | save ~/staging-area/settings.json --force;
    cp $bg $"/home/noble/staging-area/background.($ext)";    
    cd ~/staging-area
    ^zip theme.zip background.jpg background.png settings.json;
    rm ~/staging-area/* 
    echo "Complete"
}
