#!/usr/bin/bash

#COMMIT=$(git log --name-only --pretty=oneline --full-index HEAD^^..HEAD | grep -vE '^[0-9a-f]{40} ' | sort | uniq)
COMMIT=$(git log --name-only --pretty=format:"%H" -n 1 | awk '{print $1}') && git diff-tree --no-commit-id --name-only -r $COMMIT | sort | uniq

  FILES=($COMMIT)
  len=${#FILES[@]}

  for (( i=0; i<${len}; i++)); do
    DIR=$(dirname "${FILES[$i]}")
    echo "Processing the file ${FILES[$i]} from the directory ${DIR}"
    
    if [[ ${DIR} == 'services/'* ]]; then
      EXTENSION=$(echo ${FILES[$i]#*.})
      if [ ${EXTENSION} == "yaml" ]; then
        FILE=$(basename ${FILES[$i]} | cut -f 1 -d '.')
        echo "commited file:=> ${DIR}/${FILE}.yaml"
        
        # ${SCRIPT_PATH}/generateFile.sh ${DIR}/${FILE}.yaml ${OpenAPI_TEMPLATE} "generated/${DIR}/${FILE}.html"
      fi
    fi
  done
