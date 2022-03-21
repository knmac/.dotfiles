# Setup

Copy and paste to your `.bashrc` or `.zshrc`

```bash
if type lf &> /dev/null; then
    LF_ICONS=$(sed ~/.config/lf/diricons \
                -e '/^[ \t]*#/d'         \
                -e '/^[ \t]*$/d'         \
                -e 's/[ \t]\+/=/g'       \
                -e 's/$/ /')
    LF_ICONS=${LF_ICONS//$'\n'/:}
    export LF_ICONS
    alias lf="$HOME/.config/lf/lf_launcher.sh"
fi
```
