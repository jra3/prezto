#!/bin/sh

_emacsfun()
{
    x=`emacsclient --alternate-editor '' --eval '(> 2 (safe-length (visible-frame-list)))' 2>/dev/null`    

    if [ -z "$x" ] || [ "$x" = "nil" ]; then
	# puth this file on the existing frame
	emacsclient -a '' --no-wait "$@"
    else
	if [ $DIPLAY ]; then
	    # create a frame, but don't wait for it. It'll be X11
	    emacsclient -a '' --no-wait --create-frame "$@"
	else
	    # create an emacs frame interactively
	    echo -e '\033kemacs\033\\'
	    emacsclient -a '' --create-frame "$@"
	    echo -e '\033kohno\033\\'
	fi
    fi
}

_emacsfun "$@"

