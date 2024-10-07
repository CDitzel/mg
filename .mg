 
make-backup-files 0
display-help-mode 0

auto-indent-mode 1
#auto-fill-mode 1
set-tab-width 4
 
auto-indent-mode 1
#auto-fill-mode 1
make-backup-files 0
#set-fill-column 80
#set-default-mode c-mode
#set-default-mode fill
no-tab-mode
set-tab-width 4
#set-default-mode fill
 
global-set-key "\^h" delete-backward-char
global-set-key "\^[h" backward-kill-word
#global-set-key "\^[o" mark-paragraph
global-set-key "\^[g" goto-line
#global-set-key "\^u" kill-line-backward
global-set-key "\^[u" kill-paragraph
global-set-key "\^[p" scroll-one-line-down
global-set-key "\^[n" scroll-one-line-up
global-set-key "\^[e" forward-paragraph
global-set-key "\^[a" backward-paragraph
global-set-key "\^c\^j" list-buffers
#global-set-key "\^c\^n" next-buffer
#global-set-key "\^c\^p" prev-buffer
global-set-key "\^t" switch-to-buffer
global-set-key "\^xg" revert-buffer
local-set-key "^x\^j" dired-up-directory
global-set-key "\^[s" start-kbd-macro
global-set-key "\^[r" end-kbd-macro
global-set-key "\^[i" call-last-kbd-macro
global-set-key "\^[," pop-tag-mark
global-set-key "\^[/" sy
global-set-key "\^[o" other-window
global-set-key "\^x\^k" kill-buffer
global-set-key "\^[a" beg-of-block
global-set-key "\^[e" end-of-block

auto-execute *.c c-mode
auto-execute *.h c-mode
auto-execute *.cpp c-mode
auto-execute *.hpp c-mode
auto-execute *.python c-mode
auto-execute *.sh c-mode
