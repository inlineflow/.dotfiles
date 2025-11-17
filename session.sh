if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <directory_path>"
  exit 1
fi

target_dir="$1"
target_dir="${target_dir%/}"
session_name="${target_dir##*/}"
echo "Target dir: $target_dir"
echo "Session name: $session_name"

if [ ! -d "$target_dir" ]; then
  echo "Error: Directory '$target_dir' not found."
  exit 1
fi

tmux has-session -t "$session_name" 2>/dev/null
if [ $? -eq 0 ]; then
  echo "Session '$session_name' already exists. Attaching to it instead."
  tmux attach-session -t "$session_name"
  exit 0
fi

echo "Starting new tmux session '$session_name' in dir '$target_dir'"
cd "$target_dir" || { echo "Failed to change directory."; exit 1; }

tmux new-session -d -s "$session_name" -n "nvim"

tmux new-window -t "$session_name" -n "term" 
tmux new-window -t "$session_name" -n "git" 

tmux attach-session -t "$session_name"
tmux select-pane -t 0
tmux send-keys -t "$session_name":0.0 "nvim ." C-m
