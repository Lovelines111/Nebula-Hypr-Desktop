# Overview

Macfiles are dotfiles made for my `MacBook Air 6,2`.  
You can however use them on other devices as well.  
I tried to make them as reproducible as possible.

The theme here is all pastel pink.
![image](https://github.com/user-attachments/assets/c8b081ac-628f-4ad4-8a82-01877f68a550)
![image](https://github.com/user-attachments/assets/3eaa1d47-41e2-4055-a5e7-27a9d2595f18)

There is a lot more to theme and declare so I might very muc hupdate this repo in the future.

# Installation

I recommend installing macfiles on a freshly installed NixOS with Gnome.  
If you have your own configuration set up, I'd highly recommend carefully modifying your own configuration with parts of my own. Loading my entire config at once may break things.  
This guide will assume you have a clean install.

1. Install necessary tools:

    ```bash
    nix-shell -p git file home-manager
    ```

2. Clone the repository:

    ```bash
    git clone https://github.com/Lovelines111/macfiles.git
    ```

3. Navigate to the cloned directory:

    ```bash
    cd macfiles
    ```

4. Copy the hardware configuration:

    ```bash
    cp /etc/nixos/hardware-configuration.nix .
    ```

5. Make the script executable:

    ```bash
    chmod +x replace-user.sh
    ```

Now we'll replace my username with your own. This is very important because if done incorrectly, it will prevent you from logging in.

6. Run the replacement script:

    ```bash
    ./replace-user . luvelyne "$(whoami)"
    ```

It should output something like this:

    ```
    Modifying: ./configuration.nix
    Modifying: ./.git/logs/refs/heads/main
    Modifying: ./.git/logs/refs/remotes/origin/HEAD
    Modifying: ./.git/logs/HEAD
    Modifying: ./install.sh
    Modifying: ./flake.nix
    Modifying: ./modules/v2rayA.nix
    Modifying: ./dconf/gnome-settings.dconf
    Modifying: ./dconf/openbar.conf
    Modifying: ./home.nix
    Replacement complete.
    ```

If everything is in order, proceed to the system installation:

7. Rebuild your system:

    ```bash
    sudo nixos-rebuild switch --flake .#maxos
    ```

8. Run Home Manager:

    ```bash
    home-manager switch --flake .
    ```

9. Apply the GNOME configuration:

    ```bash
    cat dconf/gnome-settings.dconf | dconf load /
    ```

10. Restart the computer to apply all kernel changes:

    ```bash
    reboot
    ```

---

/*Done!*/

---
Now for the part I couldn't configure decleratively.
For telegram I use this theme:


![image](https://github.com/user-attachments/assets/3933fcb0-3741-412c-82fc-8bf140b78f76)



For Vesktop I use this plugin:


![image](https://github.com/user-attachments/assets/53164307-29ad-47bc-b4fb-65a69d323197)

With this color:**#7c2a43**

For Librewolf I use this one:
https://addons.mozilla.org/en-US/firefox/addon/classicpink/

**Enjoy! :3**

