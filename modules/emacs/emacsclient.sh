#!/bin/sh

_emacsfun()
{
    x=`emacsclient --alternate-editor '' --eval '(> 2 (safe-length (visible-frame-list)))' 2>/dev/null`    

    if [ -z "$x" ] || [ "$x" = "nil" ]; then
	# puth this file on the existing frame
	emacsclient -a '' --no-wait "$@"
    else
	if [ $DISPLAY ]; then
	    # create a frame, but don't wait for it. It'll be X11
	    emacsclient -a '' --no-wait --create-frame "$@"
	else
	    # create an emacs frame interactively
	    emacsclient -a '' --create-frame "$@"
	fi
    fi
}

_emacsfun "$@"

