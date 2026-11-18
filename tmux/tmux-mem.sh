#!/bin/sh
# Set @mem on every tmux window (@session_mem on sessions) to the total memory
# footprint of all processes running in its panes (each pane's shell plus
# descendants). Footprint is what Activity Monitor reports; unlike RSS it
# includes compressed and swapped-out memory.

{
  top -l 1 -n 10000 -stats pid,ppid,mem | awk '$1 ~ /^[0-9]+$/ { print $1, $2, $3 }'
  echo ---
  tmux list-panes -a -F '#{session_id} #{window_id} #{pane_pid}'
} | awk '
  # top prints sizes like 512K, 34M, 1.2G (or bare bytes)
  function kb(s,   u) {
    u = substr(s, length(s))
    if (u == "G") return s * 1048576
    if (u == "M") return s * 1024
    if (u == "K") return s + 0
    return s / 1024
  }
  function tree(pid,   sum, n, i, kids) {
    sum = mem[pid]
    n = split(children[pid], kids, " ")
    for (i = 1; i <= n; i++) sum += tree(kids[i])
    return sum
  }
  function human(kb) {
    if (kb >= 1048576) return sprintf("%.1fG", kb / 1048576)
    return sprintf("%dM", kb / 1024)
  }
  $0 == "---" { panes = 1; next }
  !panes { mem[$1] = kb($3); children[$2] = children[$2] " " $1; next }
  { m = tree($3); win[$2] += m; sess[$1] += m }
  END {
    for (w in win) print w, human(win[w])
    for (s in sess) print s, human(sess[s])
  }
' | while read -r target mem; do
  case $target in
    @*) tmux set-option -wqt "$target" @mem "$mem" ;;
    *)  tmux set-option -qt "$target" @session_mem "$mem" ;;
  esac
done
