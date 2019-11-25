#!/bin/sh

_emacsfun()
{
    x=`emacsclient --alternate-editor '' --eval '(> 2 (safe-length (visible-frame-list)))' 2>/dev/null`

    if [ -z "$x" ] || [ "$x" = "nil" ]; then
        # puth this file on the existing frame
        emacsclient -a '' --no-wait "$@"
    else
	emacsclient -a emacs --no-wait --create-frame "$@"
    fi
}

_emacsfun "$@"
