#!/usr/bin/env bash

selected=`cat $HOME/Projects/config/cht.sh/lang $HOME/Projects/config/cht.sh/command | fzf`

echo $selected

if [[ -z $selected ]]; then
  exit
fi

read -p "Enter Query: " query
echo $selected $query
if grep -qs "$selected" $HOME/Projects/config/cht.sh/lang; then
    query=`echo $query | tr ' ' '+'`
    tmux neww -n "cht.sh" bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done" 
else
    tmux neww -n "cht.sh" bash -c "curl -s cht.sh/$selected~$query " 
fi

