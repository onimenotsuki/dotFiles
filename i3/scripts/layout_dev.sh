#!/bin/bash
i3-msg "workspace 2:dev; append_layout ~/.i3/layouts/development.json"

(chromium &)
(chromium &)
(emacs &)
(urxvt &)
