kp () {
  port=$1
  
  if [[ $port ]] ; then
    info=$(lsof -Pi tcp:$port | grep $port | fzf)
  else
    info=$(lsof -Pi tcp | fzf)
  fi
  
  cmd=$(echo $info | awk '{print $1}')
  pid=$(echo $info | awk '{print $2}')
  hostPort=$(echo $info | awk '{print $9}')

  if [[ $pid ]] ; then
    kill -9 $pid && echo "killed $pid ($cmd - TCP $hostPort)"
  fi
}

knp () {
  port=$1

  if [[ $port ]] ; then
    info=$(lsof -Pi tcp:$port | grep "^node" | fzf)
  else
    info=$(lsof -Pi tcp | grep "^node" | fzf)
  fi

  cmd=$(echo $info | awk '{print $1}')
  pid=$(echo $info | awk '{print $2}')
  hostPort=$(echo $info | awk '{print $9}')

  if [[ $pid ]] ; then
    kill -9 $pid && echo "killed $pid ($cmd - TCP $hostPort)"
  fi
}
