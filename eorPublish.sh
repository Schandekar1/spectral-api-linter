#!/usr/bin/bash

COMMIT=$(git log -1 --name-only --pretty=oneline --full-index )
#COMMIT=$(git log --name-only --pretty=format:"%H" -n 1 | awk '{print $1}') && git diff-tree --no-commit-id --name-only -r $COMMIT | sort | uniq

echo "Commit object :" $COMMIT

  FILES=($COMMIT)
  
  echo "Files :" ($COMMIT)
  
  len=${#FILES[@]}

  for (( i=0; i<${len}; i++)); do
    DIR=$(dirname "${FILES[$i]}")
    #echo "Processing the file ${FILES[$i]} from the directory ${DIR}"
    
    if [[ ${DIR} == 'api/'* ]]; then
      EXTENSION=$(echo ${FILES[$i]#*.})
      if [ ${EXTENSION} == "yaml" ]; then
        FILE=$(basename ${FILES[$i]} | cut -f 1 -d '.')
        echo "commited file:=> ${DIR}/${FILE}.yaml"
        
        # ${SCRIPT_PATH}/generateFile.sh ${DIR}/${FILE}.yaml ${OpenAPI_TEMPLATE} "generated/${DIR}/${FILE}.html"
      fi
    fi
  done
