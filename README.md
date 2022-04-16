
== Install

Drop the scripts in your `$PATH`
and make sure i3 and xmacro are installed.

== Configure

At the top of the `genmacro` script is a mapping of characters to keysym sequences.
These need to be adjusted to match your keyboard.
You can use `xev` and press a key to see its keysym.

The `macro` script relies on these i3 modes:

    # record/loop modes
    set $rmacromode (Esc) Stop Recording
    set $lmacromode (Esc) Stop Macro
    mode "$rmacromode" {
        # cancel
        bindsym Escape mode "default"
    }
    mode "$lmacromode" {
        # cancel
        bindsym Escape $exec macro kill; mode "default"
    }

Example config for [blezz](https://github.com/Blezzing/blezz)
or [rofi-blezz](https://github.com/davatorium/rofi-blezz):

    Macro:
    act(r,Record, macro record)
    act(e,Edit, urxvt -e macro edit)
    act(p,Play, macro play)
    act(l,Loop, macro loop)

