
make-backup-files 0
display-help-mode 0

#set-default-mode notab indent cmode

set-tab-width 4
 
#auto-execute "*.cpp" c-mode

global-set-key "\^h" delete-backward-char
global-set-key "\^[h" backward-kill-word
global-set-key "\^[o" mark-paragraph
global-set-key "\^[g" goto-line
#global-set-key "\^u" kill-line-backward
global-set-key "\^[u" kill-paragraph
global-set-key "\^[p" scroll-one-line-down
global-set-key "\^[n" scroll-one-line-up
global-set-key "\^[e" forward-paragraph
global-set-key "\^[a" backward-paragraph
global-set-key "\^t" switch-to-buffer
#global-set-key "\^c\^j" list-buffers
global-set-key "\^c\^j" list-buffers
global-set-key "\^x\^r" revert-buffer
local-set-key "^x\^j" dired-up-directory
global-set-key "\^[s" start-kbd-macro
global-set-key "\^[r" end-kbd-macro
global-set-key "\^[i" call-last-kbd-macro
global-set-key "\^[," pop-tag-mark
#global-set-key "\^[," sy
global-set-key "\^x\^k" kill-buffer
global-set-key "\^[a" beg-of-block
global-set-key "\^[e" end-of-block

