echo "ARGS: $1 $2"
  split -l 1000000 $1 $2
  for file in $2*
      do
        echo "File: $file"
        if [[ $file == *"_aa" ]]; then
         echo "Not copying header"
        else
         echo "Copying header"
         head -n 1 $1 > tmp_file
        fi

        cat $file >> tmp_file
        mv -f tmp_file $file
      done

 find ./ -name "$2*" | xargs wc -l
