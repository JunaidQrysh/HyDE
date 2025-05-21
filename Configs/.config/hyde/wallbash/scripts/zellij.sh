#!/usr/bin/env bash

awk -F '[[:space:]]+' '
    NR == FNR {
        if ($1 == "background") c1 = $2
        if ($1 == "color4") c2 = $2
        if ($1 == "color3") c3 = $2
        if ($1 == "color0") c4 = $2
        if ($1 == "color2") c5 = $2
        if ($1 == "color14") c6 = $2
        if ($1 == "color1") c7 = $2
        next
    }
    {
        gsub("<custom_1>", c1)
        gsub("<custom_2>", c2)
        gsub("<custom_3>", c3)
        gsub("<custom_4>", c4)
        gsub("<custom_5>", c5)
        gsub("<custom_6>", c6)
        gsub("<custom_7>", c7)
        print
    }
' "$HOME/.config/kitty/theme.conf" "$HOME/.config/zellij/layouts/default.kdl" > tmpfile && 
mv tmpfile "$HOME/.config/zellij/layouts/default.kdl"
