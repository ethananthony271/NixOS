{ pkgs, lib, config, ... }: {
  options = {
    foot.enable = lib.mkEnableOption "enables foot";
  };

  config = lib.mkIf config.foot.enable {
    home.file = {
      ".config/foot/foot.ini" = {
        text = ''
          # -*- conf -*-

          # shell=$SHELL (if set, otherwise user's default shell from /etc/passwd)
          # term=foot (or xterm-256color if built with -Dterminfo=disabled)
          # login-shell=no

          # app-id=foot # globally set wayland app-id. Default values are "foot" and "footclient" for desktop and server mode
          title=terminal
          # locked-title=no

          font                                    =IBM Plex Mono:size=12
          font-bold                               =IBM Plex Mono:style=Bold:size=12
          font-italic                             =IBM Plex Mono:style=Italic:size=12
          font-bold-italic                        =IBM Plex Mono:style=Bold:style=Italic:size=12
          font-size-adjustment                    =0.5
          # line-height                           =<font metrics>
          letter-spacing                          =0
          horizontal-letter-offset                =0
          vertical-letter-offset                  =0
          # underline-offset                      =<font metrics>
          # underline-thickness                   =<font underline thickness>
          box-drawings-uses-font-glyphs           =no
          dpi-aware                               =no

          # initial-window-size-pixels=700x500  # Or,
          # initial-window-size-chars=<COLSxROWS>
          # initial-window-mode=windowed
          # pad=0x0                             # optionally append 'center'
          # resize-delay-ms=100

          # notify=notify-send -a $${app-id} -i $${app-id} $${title} $${body}

          # bold-text-in-bright=no
          # word-delimiters=,│`|:"'()[]{}<>
          # selection-target=primary
          # workers=<number of logical CPUs>
          # utmp-helper=/usr/lib/utempter/utempter  # When utmp backend is ‘libutempter’ (Linux)
          # utmp-helper=/usr/libexec/ulog-helper    # When utmp backend is ‘ulog’ (FreeBSD)

          [environment]
          # name=value

          [bell]
          # urgent=no
          # notify=no
          # visual=no
          # command=
          # command-focused=no

          [scrollback]
          # lines=1000
          # multiplier=3.0
          # indicator-position=relative
          # indicator-format=""

          [url]
          # launch=xdg-open $${url}
          # label-letters=sadfjklewcmpgh
          # osc8-underline=url-mode
          # protocols=http, https, ftp, ftps, file, gemini, gopher
          # uri-characters=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_.,~:;/?#@!$&%*+="'()[]

          [cursor]
          # style=block
          # color=<inverse foreground/background>
          # blink=no
          # beam-thickness=1.5
          # underline-thickness=<font underline thickness>

          [mouse]
          hide-when-typing                            =yes
          # alternate-scroll-mode=yes

          [touch]
          # long-press-delay=400

          # [colors]
          # alpha                                       = 1.0
          # background                                  = 282828
          # foreground                                  = F9F5D7
          # flash                                       = 7f7f00
          # flash-alpha                                 = 0.5

          # ## Normal/regular colors (color palette 0-7)
          # regular0                                    = 665c54  # black
          # regular1                                    = cc241d  # red
          # regular2                                    = 98971a  # green
          # regular3                                    = d79921  # yellow
          # regular4                                    = 458588  # blue
          # regular5                                    = b16286  # magenta
          # regular6                                    = 689d6a  # cyan
          # regular7                                    = a89984  # white

          # ## Bright colors (color palette 8-15)
          # bright0                                     = 7c6f64  # bright black
          # bright1                                     = fb4934  # bright red
          # bright2                                     = b8bb26  # bright green
          # bright3                                     = fabd2f  # bright yellow
          # bright4                                     = 83a598  # bright blue
          # bright5                                     = d3869b  # bright magenta
          # bright6                                     = 8ec07c  # bright cyan
          # bright7                                     = bdae93  # bright white

          ## Misc colors
          # selection-foreground                      = <inverse foreground/background>
          # selection-background                      = <inverse foreground/background>
          # jump-labels                               = <regular0> <regular3>          # black-on-yellow
          # scrollback-indicator                      = <regular0> <bright4>  # black-on-bright-blue
          # search-box-no-match                       = <regular0> <regular1>  # black-on-red
          # search-box-match                          = <regular0> <regular3>     # black-on-yellow
          # urls                                      = <regular3>

          [csd]
          # preferred=server
          # size=26
          # font=<primary font>
          # color=<foreground color>
          # hide-when-maximized=no
          # double-click-to-maximize=yes
          # border-width=0
          # border-color=<csd.color>
          # button-width=26
          # button-color=<background color>
          # button-minimize-color=<regular4>
          # button-maximize-color=<regular2>
          # button-close-color=<regular1>

          [key-bindings]
          scrollback-up-page                          = Shift+Page_Up
          scrollback-up-half-page                     = Page_Up
          scrollback-up-line                          = Up
          scrollback-down-page                        = Shift+Page_Down
          scrollback-down-half-page                   = Page_Down
          scrollback-down-line                        = Down
          scrollback-home                             = none
          scrollback-end                              = none
          clipboard-copy                              = Control+Shift+c XF86Copy
          clipboard-paste                             = Control+Shift+v XF86Paste
          primary-paste                               = Shift+Insert
          search-start                                = Control+Shift+r
          font-increase                               = Control+plus Control+KP_Add
          font-decrease                               = Control+minus Control+KP_Subtract
          font-reset                                  = Control+equal Control+KP_Equal
          spawn-terminal                              = Control+Shift+n
          minimize                                    = none
          maximize                                    = none
          fullscreen                                  = none
          pipe-visible                                = [sh -c "xurls | fuzzel | xargs -r firefox"] none
          pipe-scrollback                             = [sh -c "xurls | fuzzel | xargs -r firefox"] none
          pipe-selected                               = [xargs -r firefox] none
          pipe-command-output                         = [wl-copy] none # Copy last command's output to the clipboard
          show-urls-launch                            = Control+Shift+o
          show-urls-copy                              = none
          show-urls-persistent                        = none
          prompt-prev                                 = Control+Shift+z
          prompt-next                                 = Control+Shift+x
          unicode-input                               = Control+Shift+u
          noop                                        = none

          [search-bindings]
          # cancel=Control+g Control+c Escape
          # commit=Return
          # find-prev=Control+r
          # find-next=Control+s
          # cursor-left=Left Control+b
          # cursor-left-word=Control+Left Mod1+b
          # cursor-right=Right Control+f
          # cursor-right-word=Control+Right Mod1+f
          # cursor-home=Home Control+a
          # cursor-end=End Control+e
          # delete-prev=BackSpace
          # delete-prev-word=Mod1+BackSpace Control+BackSpace
          # delete-next=Delete
          # delete-next-word=Mod1+d Control+Delete
          # extend-char=Shift+Right
          # extend-to-word-boundary=Control+w Control+Shift+Right
          # extend-to-next-whitespace=Control+Shift+w
          # extend-line-down=Shift+Down
          # extend-backward-char=Shift+Left
          # extend-backward-to-word-boundary=Control+Shift+Left
          # extend-backward-to-next-whitespace=none
          # extend-line-up=Shift+Up
          # clipboard-paste=Control+v Control+Shift+v Control+y XF86Paste
          # primary-paste=Shift+Insert
          # unicode-input=none
          # quit=none
          # scrollback-up-page=Shift+Page_Up
          # scrollback-up-half-page=none
          # scrollback-up-line=none
          # scrollback-down-page=Shift+Page_Down
          # scrollback-down-half-page=none
          # scrollback-down-line=none
          # scrollback-home=none
          # scrollback-end=none

          [url-bindings]
          # cancel=Control+g Control+c Control+d Escape
          # toggle-url-visible=t

          [text-bindings]
          # \x03=Mod4+c  # Map Super+c -> Ctrl+c

          [mouse-bindings]
          # scrollback-up-mouse=BTN_BACK
          # scrollback-down-mouse=BTN_FORWARD
          # selection-override-modifiers=Shift
          # primary-paste=BTN_MIDDLE
          # select-begin=BTN_LEFT
          # select-begin-block=Control+BTN_LEFT
          # select-extend=BTN_RIGHT
          # select-extend-character-wise=Control+BTN_RIGHT
          # select-word=BTN_LEFT-2
          # select-word-whitespace=Control+BTN_LEFT-2
          # select-quote = BTN_LEFT-3
          # select-row=BTN_LEFT-4

          # vim: ft=dosini
        '';
        executable = true;
      };
    };

    home.packages = with pkgs; [
      foot
    ];
  };
}
