export APT_PACKAGES=(
	# libs/build
	"libx11-dev"                   # X11 Client-Side Library (Development Headers)
	"libxft-dev"                   # Freetype-Based Font Drawing Library For X (Development Files)
	"libgconf-2-4"                 # Gnome Configuration Database System (Shared Libraries)
	"libgtk2.0-dev"                # Development Files For The Gtk Library
	"libcairo2"                    # Cairo 2D Vector Graphics Library
	"libcairo2-dev"                # Development Files For The Cairo 2D Graphics Library
	"default-libmysqlclient-dev"   # Mysql Database Development Files (Metapackage)
	"libsqlite3-dev"               # Sqlite 3 Development Files
	"libpq-dev"                    # Header Files For Libpq5 (Postgresql Library)
	"xorg-dev"                     # X.Org X Window System Development Libraries
	"libxinerama-dev"              # X11 Xinerama Extension Library (Development Headers)
	"build-essential"              # Informational List Of Build-Essential Packages
	"ninja-build"                  # Small Build System Closest In Spirit To Make
	"libwacom-bin"                 # Wacom Model Feature Query Library -- Binaries
	"libcanberra-gtk-module"       # Translates Gtk+ Widgets Signals To Event Sounds
	"apt-transport-https"          # Transitional Package For Https Support
	"gnupg2"                       # Gnu Privacy Guard - A Free Pgp Replacement (Dummy Transitional Package)
	"debian-keyring"               # Gnupg Keys Of Debian Developers And Maintainers
	"libxcb-xfixes0-dev"           # X C Binding, Xfixes Extension, Development Files
	"libwebkit2gtk-4.0-dev"        # Web Content Engine Library For Gtk - Development Files
	"libssl-dev"                   # Secure Sockets Layer Toolkit - Development Files
	"libgtk-3-dev"                 # Development Files For The Gtk Library
	"libayatana-appindicator3-dev" # Ayatana Application Indicators (Development Files, Gtk-3+ Version)
	"librsvg2-dev"                 # Sax-Based Renderer Library For Svg Files (Development)

	"smartmontools"                # Control And Monitor Storage Systems Using S.M.A.R.T.
	"software-properties-common"   # Manage The Repositories That You Install Software From (Common)
	"clang-format"                 # Tool To Format C/C++/Obj-C Code
	"picard"                       # Next-Generation Musicbrainz Audio Files Tagger
	"python-is-python3"            # Symlinks /Usr/Bin/Python To Python3
	"pipx"                         # Execute Binaries From Python Packages In Isolated Environments
	"gettext"                      # Gnu Internationalization Utilities
	"cmake"                        # Cross-Platform, Open-Source Make System
	"zip"                          # Archiver For .Zip Files
	"unzip"                        # De-Archiver For .Zip Files
	"curl"                         # Command Line Tool For Transferring Data With Url Syntax
	"xorg"                         # X.Org X Window System
	"rsync"                        # Fast, Versatile, Remote (And Local) File-Copying Tool
	"alacritty"                    # Fast, Cross-Platform, Opengl Terminal Emulator
	"firefox-esr"                  # Mozilla Firefox Web Browser - Extended Support Release (Esr)
	"zsh"                          # Shell With Lots Of Features
	"npm"                          # Package Manager For Node.Js
	"flameshot"                    # Powerful Yet Simple-To-Use Screenshot Software
	"neofetch"                     # Shows Linux System Information With Distribution Logo
	"gnome-text-editor"            # Simple Text Editor For Gnome
	"gnome-keyring"                # Gnome Keyring Services (Daemon And Tools)
	"policykit-1-gnome"            # Authentication Agent For Policykit
	"seahorse"                     # Gnome Front End For Gnupg
	"xtrlock"                      # Minimal X Display Lock Program
	"gpick"                        # Advanced Gtk+ Color Picker
	"playerctl"                    # Utility To Control Media Players Via Mpris
	"fontforge"                    # Font Editor
	"font-manager"                 # Font Management Application For The Gnome Desktop
	"udiskie"                      # Automounter For Removable Media For Python
	"gnome-calculator"             # Gnome Desktop Calculator
	"pavucontrol"                  # Pulseaudio Volume Control
	"alacritty"                    # Fast, Cross-Platform, Opengl Terminal Emulator
	"cmus"                         # Lightweight Ncurses Audio Player
	"htop"                         # Interactive Processes Viewer
	"imagemagick"                  # Image Manipulation Programs -- Binaries
	"ffmpeg"                       # Tools For Transcoding, Streaming And Playing Of Multimedia Files
	"ffmpegthumbnailer"            # Fast And Lightweight Video Thumbnailer
	"ffmpegthumbs"                 # Video Thumbnail Generator Using Ffmpeg
	"nemo"                         # File Manager And Graphical Shell For Cinnamon
	# "nemo-audio-tab"             # Not Found On Debian
	"nemo-fileroller"              # File Roller Integration For Nemo
	# "nemo-image-converter"       # Not Found On Debian
	"rofi"                         # Window Switcher, Run Dialog And Dmenu Replacement
	"qalc"                         # Powerful And Easy To Use Command Line Calculator
	"lxappearance"                 # Lxde Gtk+ Theme Switcher
	"lxappearance-obconf"          # Lxde Gtk+ Theme Switcher (Plugin)
	"papirus-icon-theme"           # Papirus Open Source Icon Theme For Linux
	"kdenlive"                     # Non-Linear Video Editor
	"wget"                         # Retrieves Files From The Web
	"tree"                         # Displays An Indented Directory Tree, In Color
	"tmux"                         # Terminal Multiplexer
	"gparted"                      # Gnome Partition Editor
	"docker"                       # Transitional Package
	"highlight"                    # Universal Source Code To Formatted Text Converter
	"ntfs-3g"                      # Read/Write Ntfs Driver For Fuse
	"hwinfo"                       # Hardware Identification System
	"nitrogen"                     # Wallpaper Browser And Changing Utility For X
	"fzf"                          # General-Purpose Command-Line Fuzzy Finder
	"feh"                          # Imlib2 Based Image Viewer
	"eog"                          # Eye Of Gnome Graphics Viewer Program
	"xclip"                        # Command Line Interface To X Selections
	"xdotool"                      # Simulate (Generate) X11 Keyboard/Mouse Input Events
	"p7zip"                        # 7Zr File Archiver With High Compression Ratio
	"jq"                           # Lightweight And Flexible Command-Line Json Processor
	"yad"                          # Tool For Creating Graphical Dialogs From Shell Scripts
	"mpv"                          # Video Player Based On Mplayer/Mplayer2
	"picom"                        # Lightweight Compositor For X11
	"imwheel"                      # Add Support To Non-Standard Buttons On Mouse In Linux
	"transmission-gtk"             # Lightweight Bittorrent Client (Gtk+ Interface)
	"tmuxinator"                   # Create And Manage Tmux Sessions Easily
	"exa"                          # Modern Replacement For Ls
	"lf"                           # Terminal File Manager Written In Go
	"smenu"                        # Curse-Based Cli Selection Box
	"python3-pip"                  # Python Package Installer
	"pipx"                         # Execute Binaries From Python Packages In Isolated Environments
	"inxi"                         # Full Featured System Information Script
	"gawk"                         # Gnu Awk, A Pattern Scanning And Processing Language
	"network-manager-gnome"        # Network Management Framework (Gnome Frontend)
	"wireplumber"                  # Modular Session / Policy Manager For Pipewire
	"postgresql"                   # Object-Relational Sql Database (Supported Version)
	"postgresql-client"            # Front-End Programs For Postgresql (Supported Version)
	"postgresql-doc"               # Documentation For The Postgresql Database Management System

	# fonts
	"fonts-mononoki"               # Font For Programming And Code Review
	"fonts-liberation"             # Fonts With The Same Metrics As Times, Arial And Courier
	"fonts-wqy-zenhei"             # "Wenquanyi Zen Hei" A Hei-Ti Style (Sans-Serif) Chinese Font
)
