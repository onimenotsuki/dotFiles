#!/bin/bash
i3-msg "workspace 3:learn; append_layout ~/.i3/layouts/treehouse.json"

(chromium &)
(emacs &)
(urxvt &)
