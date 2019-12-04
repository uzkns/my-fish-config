function fish_greeting --description 'Greeting when opening the console'
    #get distro name and save it as a variable
    if not set -q __os_name
        set -g __os_name (cat /etc/os-release | grep NAME= | head -n 1 | cut -d= -f2 | tr -d '"')
    end

    #Print user @ machine name (distro arch, kernel version)
    printf '%s@%s (%s %s, %s %s)\f\r' (whoami) (uname -n) "$__os_name" (arch) (uname -o) (uname -r)
end