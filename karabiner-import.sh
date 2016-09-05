#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set remap.mouse_button4_5 1
/bin/echo -n .
$cli set repeat.initial_wait 300
/bin/echo -n .
$cli set repeat.wait 33
/bin/echo -n .
/bin/echo
