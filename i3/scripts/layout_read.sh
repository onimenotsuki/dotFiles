#!/bin/bash
i3-msg "workspace 8:read; append_layout ~/.i3/layouts/read-learning.json"

(emacs &)
(urxvt &)
