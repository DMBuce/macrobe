
## Install

Drop the scripts in your `$PATH`,
make them executable,
and make sure [xmacro](http://xmacro.sourceforge.net/)
and [i3](https://i3wm.org/) are installed.

## Configure

At the top of the `genmacro` script is a mapping of characters to keysym sequences.
If you wish to use `macro gen` or `genmacro` to generate an xmacro script from text,
these need to be adjusted to match your keyboard layout.
You can use `xev` and press a key to see its keysym.

The `macro rec` and `macro loop` commands rely on these i3 modes:

    # record/loop modes
    set $rmacromode (Esc) Stop Recording
    set $lmacromode (Esc) Stop Macro
    mode "$rmacromode" {
        # cancel
        bindsym Escape mode "default"
    }
    mode "$lmacromode" {
        # cancel
        bindsym Escape exec macro kill; mode "default"
    }

For users who want a simple GUI,
here is an example config for [blezz](https://github.com/Blezzing/blezz)
or [rofi-blezz](https://github.com/davatorium/rofi-blezz):

    Macro:
    act(r,Record, macro record)
    act(e,Edit, urxvt -e macro edit)
    act(p,Play, macro play)
    act(l,Loop, macro loop)
    act(c,Custom, macro my-custom-macro)

Macros are stored in `~/.config/macro/`.

## Usage

    $ macro
    Syntax: macro list|record|edit|play|loop|kill|gen
            macro <macro>
    
    Manage xmacro macros.

Record a macro to `~/.config/macro/tmp.XXXXXX`:

    macro rec

List all macros:

    macro list

Edit the most recent macro with your `$EDITOR` (`vi` by default):

    macro edit

Play the most recent macro:

    macro play

Play the most recent macro on repeat:

    macro loop

Kill all macro and xmacroplay processes:

    macro kill

Rename a macro:

    mv ~/.config/macro/tmp.XXXXXX ~/.config/macro/my-custom-macro

Convert a text file to a macro:

    genmacro file.txt > ~/.config/macro/my-custom-macro

Play a specific macro:

    macro my-custom-macro

