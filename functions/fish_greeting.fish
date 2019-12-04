function fish_greeting --description 'Greeting when opening the console'
    #Print user @ machine name (kernel version, arch)
    printf '%s @ %s (%s %s, %s)' (whoami) (uname -n) (uname -o) (uname -r) (arch)
end