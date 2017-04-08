#!/bin/sh

_emacsfun()
{
    # get list of available X windows.
    x=`emacsclient --alternate-editor '' --eval '(> 2 (safe-length (visible-frame-list)))' 2>/dev/null`
    
    if [ -z "$x" ] || [ "$x" = "nil" ] ;then
	emacsclient -a emacs --no-wait "$@"
    else
	emacsclient -a emacs --no-wait --create-frame "$@"
    fi
}

_emacsfun "$@"

