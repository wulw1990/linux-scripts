# trash
export TRASH="/mnt/lustre/wulw/.trash"
mkdir -p $TRASH
function trash() {
  #echo "num param: $#"
  for i in `seq 1 $#`   
  do
    name=$(eval " echo \$$(echo $i)")
    short=$(basename $name)
    full=`echo "$PWD/$name" | tr / %`
    timestamp=`date +%Y-%m-%d_%T_%N`
    #echo $full

    pattern=" "
    if [[ $name =~ $pattern ]]
    then 
      echo "space in file name: $name"
      return
    else 
      #echo "no space"
      #echo $i, $timestamp
      #echo "  " mv $PWD/$name $TRASH
      #echo "  " mv $TRASH/$short\" \"$TRASH/${timestamp}_$short\"
      mv $PWD/$name $TRASH
      mv $TRASH/$short $TRASH/${timestamp}_$full
    fi
  done
}

trash aa bb/aa cc/aa/
