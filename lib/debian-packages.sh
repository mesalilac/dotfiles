export APT_PACKAGES=(

# Admin:
	  "software-properties-common"   # Manage The Repositories That You Install Software From (Common)
	  "tmux"                         # Terminal Multiplexer
	  "hwinfo"                       # Hardware Identification System

# Database:
	  "default-libmysqlclient-dev"   # Mysql Database Development Files (Metapackage)
	  "postgresql"                   # Object-Relational Sql Database (Supported Version)
	  "postgresql-client"            # Front-End Programs For Postgresql (Supported Version)

# Devel:
	  "build-essential"              # Informational List Of Build-Essential Packages
	  "ninja-build"                  # Small Build System Closest In Spirit To Make
	  "clang-format"                 # Tool To Format C/C++/Obj-C Code
	  "gettext"                      # Gnu Internationalization Utilities
	  "cmake"                        # Cross-Platform, Open-Source Make System
	  "highlight"                    # Universal Source Code To Formatted Text Converter

# Doc:
	  "postgresql-doc"               # Documentation For The Postgresql Database Management System

# Fonts:
	  "fontforge"                    # Font Editor
	  "fonts-mononoki"               # Font For Programming And Code Review
	  "fonts-liberation"             # Fonts With The Same Metrics As Times, Arial And Courier
	  "fonts-wqy-zenhei"             # "Wenquanyi Zen Hei" A Hei-Ti Style (Sans-Serif) Chinese Font

# Gnome:
	  "gnome-text-editor"            # Simple Text Editor For Gnome
	  "gnome-keyring"                # Gnome Keyring Services (Daemon And Tools)
	  "policykit-1-gnome"            # Authentication Agent For Policykit
	  "seahorse"                     # Gnome Front End For Gnupg
	  "nemo-fileroller"              # File Roller Integration For Nemo
	  "gparted"                      # Gnome Partition Editor
	  "eog"                          # Eye Of Gnome Graphics Viewer Program
	  "network-manager-gnome"        # Network Management Framework (Gnome Frontend)

# Graphics:
	  "flameshot"                    # Powerful Yet Simple-To-Use Screenshot Software
	  "gpick"                        # Advanced Gtk+ Color Picker
	  "font-manager"                 # Font Management Application For The Gnome Desktop
	  "imagemagick"                  # Image Manipulation Programs -- Binaries
	  "feh"                          # Imlib2 Based Image Viewer

# Interpreters:
	  "gawk"                         # Gnu Awk, A Pattern Scanning And Processing Language

# Kde:
	  "ffmpegthumbs"                 # Video Thumbnail Generator Using Ffmpeg

# Libdevel:
	  "libx11-dev"                   # X11 Client-Side Library (Development Headers)
	  "libxft-dev"                   # Freetype-Based Font Drawing Library For X (Development Files)
	  "libcairo2-dev"                # Development Files For The Cairo 2D Graphics Library
	  "libsqlite3-dev"               # Sqlite 3 Development Files
	  "libpq-dev"                    # Header Files For Libpq5 (Postgresql Library)
	  "libxinerama-dev"              # X11 Xinerama Extension Library (Development Headers)
	  "libxcb-xfixes0-dev"           # X C Binding, Xfixes Extension, Development Files
	  "libwebkit2gtk-4.0-dev"        # Web Content Engine Library For Gtk - Development Files
	  "libssl-dev"                   # Secure Sockets Layer Toolkit - Development Files
	  "libgtk-3-dev"                 # Development Files For The Gtk Library
	  "libayatana-appindicator3-dev" # Ayatana Application Indicators (Development Files, Gtk-3+ Version)
	  "librsvg2-dev"                 # Sax-Based Renderer Library For Svg Files (Development)

# Libs:
	  "libcairo2"                    # Cairo 2D Vector Graphics Library
	  "libwacom-bin"                 # Wacom Model Feature Query Library -- Binaries
	  "libcanberra-gtk-module"       # Translates Gtk+ Widgets Signals To Event Sounds

# Math:
	  "gnome-calculator"             # Gnome Desktop Calculator
	  "qalc"                         # Powerful And Easy To Use Command Line Calculator

# Misc:
	  "debian-keyring"               # Gnupg Keys Of Debian Developers And Maintainers
	  "nemo"                         # File Manager And Graphical Shell For Cinnamon
	  "inxi"                         # Full Featured System Information Script

# Net:
	  "rsync"                        # Fast, Versatile, Remote (And Local) File-Copying Tool
	  "transmission-gtk"             # Lightweight Bittorrent Client (Gtk+ Interface)

# Oldlibs:
	  "libgconf-2-4"                 # Gnome Configuration Database System (Shared Libraries)
	  "libgtk2.0-dev"                # Development Files For The Gtk Library
	  "apt-transport-https"          # Transitional Package For Https Support
	  "gnupg2"                       # Gnu Privacy Guard - A Free Pgp Replacement (Dummy Transitional Package)

# Otherosfs:
	  "ntfs-3g"                      # Read/Write Ntfs Driver For Fuse

# Python:
	  "python-is-python3"            # Symlinks /Usr/Bin/Python To Python3
	  "pipx"                         # Execute Binaries From Python Packages In Isolated Environments
	  "python3-pip"                  # Python Package Installer
	  "pipx"                         # Execute Binaries From Python Packages In Isolated Environments

# Ruby:
	  "tmuxinator"                   # Create And Manage Tmux Sessions Easily

# Shells:
	  "zsh"                          # Shell With Lots Of Features

# Sound:
	  "picard"                       # Next-Generation Musicbrainz Audio Files Tagger
	  "playerctl"                    # Utility To Control Media Players Via Mpris
	  "pavucontrol"                  # Pulseaudio Volume Control
	  "cmus"                         # Lightweight Ncurses Audio Player

# Unused:
	  # "nemo-audio-tab"               # Not Found On Debian
	  # "nemo-image-converter"         # Not Found On Debian

# Utils:
	  "smartmontools"                # Control And Monitor Storage Systems Using S.M.A.R.T.
	  "zip"                          # Archiver For .Zip Files
	  "unzip"                        # De-Archiver For .Zip Files
	  "neofetch"                     # Shows Linux System Information With Distribution Logo
	  "udiskie"                      # Automounter For Removable Media For Python
	  "htop"                         # Interactive Processes Viewer
	  "tree"                         # Displays An Indented Directory Tree, In Color
	  "fzf"                          # General-Purpose Command-Line Fuzzy Finder
	  "p7zip"                        # 7Zr File Archiver With High Compression Ratio
	  "jq"                           # Lightweight And Flexible Command-Line Json Processor
	  "yad"                          # Tool For Creating Graphical Dialogs From Shell Scripts
	  "exa"                          # Modern Replacement For Ls
	  "lf"                           # Terminal File Manager Written In Go
	  "smenu"                        # Curse-Based Cli Selection Box

# Video:
	  "ffmpeg"                       # Tools For Transcoding, Streaming And Playing Of Multimedia Files
	  "ffmpegthumbnailer"            # Fast And Lightweight Video Thumbnailer
	  "kdenlive"                     # Non-Linear Video Editor
	  "mpv"                          # Video Player Based On Mplayer/Mplayer2
	  "wireplumber"                  # Modular Session / Policy Manager For Pipewire

# Web:
	  "curl"                         # Command Line Tool For Transferring Data With Url Syntax
	  "firefox-esr"                  # Mozilla Firefox Web Browser - Extended Support Release (Esr)
	  "npm"                          # Package Manager For Node.Js
	  "wget"                         # Retrieves Files From The Web

# X11:
	  "xorg-dev"                     # X.Org X Window System Development Libraries
	  "xorg"                         # X.Org X Window System
	  "alacritty"                    # Fast, Cross-Platform, Opengl Terminal Emulator
	  "xtrlock"                      # Minimal X Display Lock Program
	  "alacritty"                    # Fast, Cross-Platform, Opengl Terminal Emulator
	  "rofi"                         # Window Switcher, Run Dialog And Dmenu Replacement
	  "lxappearance"                 # Lxde Gtk+ Theme Switcher
	  "lxappearance-obconf"          # Lxde Gtk+ Theme Switcher (Plugin)
	  "papirus-icon-theme"           # Papirus Open Source Icon Theme For Linux
	  "docker"                       # Transitional Package
	  "nitrogen"                     # Wallpaper Browser And Changing Utility For X
	  "xclip"                        # Command Line Interface To X Selections
	  "xdotool"                      # Simulate (Generate) X11 Keyboard/Mouse Input Events
	  "picom"                        # Lightweight Compositor For X11
	  "imwheel"                      # Add Support To Non-Standard Buttons On Mouse In Linux
      "awesome"                      # Highly Configurable X Window Manager

)
