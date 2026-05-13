# Cmux-Inspired Workspaces

This fork treats Hyprland workspaces as programmable tabs with an explicit network policy.

## Goals

- Workspaces are visible as vertical or horizontal tabs in Waybar.
- Each tab can have a short label controlled from the CLI.
- Apps launched through the workspace CLI run in that workspace's network namespace.
- Workspace network modes are explicit: `host`, `isolated`, or `offline`.

## Commands

```bash
omarchy workspace list
omarchy workspace tabbar left
omarchy workspace rename 2 agents
omarchy workspace network 2 isolated
omarchy workspace launch 2 alacritty
omarchy workspace shell 2
omarchy workspace audit
```

Workspace defaults live in `~/.config/omarchy/workspaces.tsv`:

```text
1	home	isolated
2	code	isolated
3	web	isolated
4	chat	isolated
5	ops	isolated
```

## Isolation Model

Linux network isolation is process-scoped, not compositor-scoped. The fork gives every workspace its own network namespace and launches apps into that namespace with `omarchy workspace launch`.

That means the isolated contract is:

- processes launched through `omarchy workspace launch <workspace> ...` use that workspace's namespace
- `isolated` workspaces get a private veth pair, route, DNS file, NAT egress, and firewall rules blocking traffic to other workspace subnets
- `offline` workspaces get a namespace with loopback only
- `host` workspaces run without a namespace

Apps launched through the default Omarchy application keybindings go through `omarchy workspace launch active ...`, so terminals, browsers, web apps, and common desktop apps inherit the active workspace policy.

Moving an existing window into another workspace does not move the process into another network namespace. Use `omarchy workspace audit` to find windows that are visually on an isolated workspace but running outside its namespace.

## Next Integration Step

To make isolation universal, route the remaining launch surfaces through `omarchy workspace launch active ...`:

- Walker app launches
- Omarchy menu actions that spawn networked apps
- custom user keybindings

After that, the remaining gap is processes spawned outside Omarchy, for example from an already-running app. Those need app-specific policies or a small launcher supervisor.
