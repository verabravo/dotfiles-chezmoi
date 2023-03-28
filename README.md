# dotfiles

My Personal dotfiles managed by [Chezmoi](https://www.chezmoi.io) ([GitHub repo](https://github.com/twpayne/chezmoi)).


## How to make the setup

### Ubuntu

#### Pre install

Run the next commands:

```
sudo apt install -y curl git
```

Copy the `chezmoi.toml.dist` file in `$HOME\.config\chezmoi.toml` and fill it with the correct information

Download and install [Meslo Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Meslo.zip)



#### After install

Run `zsh ${ZIM_HOME}/zimfw.zsh init -q`

Run `chezmoi -v apply`

For Rofi and flameshot correct working, you have to desactivate Wayland
`sudo nano /etc/gdm3/custom.conf`

Search the WaylandEnable and uncomment or add:
`WaylandEnable=false`

Restart GDM
`sudo systemctl restart gdm3`