#!/bin/bash
i3-msg "workspace 4:media; append_layout ~/.i3/layouts/video-learning.json"

(smplayer &)
(emacs &)
(urxvt &)
