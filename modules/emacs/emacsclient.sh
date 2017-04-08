#!/bin/sh

# get list of available X windows.
x=`emacsclient --alternate-editor '' --eval '(> 2 (safe-length (visible-frame-list)))' 2>/dev/null`

if [ -z "$x" ] || [ "$x" = "nil" ] ;then
    emacsclient --alternate-editor "" --no-wait "$@"
else
    emacsclient --alternate-editor "" --create-frame "$@"
fi

# #!/bin/sh
# emacsclient --no-wait "$@" 2> /dev/null
# if [ $? -ne 0 ]; then
#    emacs "$@"
# fi
