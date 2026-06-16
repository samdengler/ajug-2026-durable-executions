# tmux Cheatsheet

Layout and keybindings configured by `bin/demo.sh`. Prefix is the default **`Ctrl+b`** (written `C-b` below).

## Custom bindings

| Keys | Action |
|------|--------|
| `C-b` `0` | Select **pane 0** in current window |
| `C-b` `1` | Select **pane 1** in current window |
| `C-b` `2` | Select pane 2 *(no-op — these windows only have 2 panes)* |
| `C-b` `3` | Select pane 3 *(no-op)* |
| `C-b` `X` or `x` | **Kill the `ajug` session** — sends `Ctrl+C` to both Services panes, waits 1s, then exits (asks `y/n` first) |
| Mouse click | Select pane / window |
| Mouse drag | Select text → auto-copies to clipboard (`pbcopy`) |

## Pane map

```
Window 0 "Demo"            Window 1 "Services"
┌──────────────────┐       ┌──────────────────┐
│ pane 0: Code(bat)│       │ pane 0: Restate  │
├──────────────────┤       │         Server   │
│ pane 1: Commands │       ├──────────────────┤
└──────────────────┘       │ pane 1: Service  │
                           └──────────────────┘
```

So `C-b 0` / `C-b 1` mean **Code/Commands** in the Demo window, and **Server/Service-logs** in the Services window.

## ⚠️ Gotcha

`C-b 0`/`1`/`2`/`3` are rebound to select **panes**, overriding tmux's default of those keys selecting **windows**. To switch between the Demo and Services windows, use the still-intact defaults:

| Keys | Action |
|------|--------|
| `C-b` `n` | **Next** window (Demo → Services) |
| `C-b` `p` | **Previous** window (Services → Demo) |
| `C-b` `w` | Window picker (interactive list) |
| `C-b` `l` | Last (toggle between the two) |

## Other handy defaults

| Keys | Action |
|------|--------|
| `C-b` `q` | Flash pane **numbers** (stays 5s — `display-panes-time 5000`) |
| `C-b` `o` | Cycle to next pane |
| `C-b` `↑↓←→` | Move between panes by direction |
| `C-b` `z` | Zoom/unzoom current pane (fullscreen toggle) |
| `C-b` `d` | **Detach** (leaves everything running) |

## Session control (from a normal shell)

```bash
./bin/demo.sh              # start everything + attach
tmux attach -t ajug        # re-attach after detaching
./bin/cleanup.sh           # nuke session + free ports 8080/9080/9070
```
