date -d "20170601+1 month 20:00:12" +%Y-%m-%d-%H:%M:%S

author_data='@1505367581 +0800'
author_data=${author_data#@}
arrIN=(${author_data// / })
author_data_str=$(date -R -d @${arrIN[0]})
echo "date of current $author_data_str"

author_data_str=$(date -R -d "$author_data_str+1 month")
echo $author_data_str

git filter-branch -f --env-filter '
author_data=$GIT_AUTHOR_DATE
author_data=${author_data#@}
arrIN=(${author_data// / })
author_data_str=$(date -R -d @${arrIN[0]})
author_data_str=$(date -R -d "$author_data_str+1 month")
NEW_NAME="Abdul Rehman"
NEW_EMAIL="abdurrehman9968@gmail.com"
export GIT_COMMITTER_NAME="Abdul Rehman"
export GIT_COMMITTER_EMAIL="abdurrehman9968@gmail.com"
export GIT_AUTHOR_NAME="abdulrehman996"
export GIT_AUTHOR_EMAIL="abdurrehman9968@gmail.com"
export GIT_AUTHOR_DATE="$author_data_str"
export GIT_COMMITTER_DATE="$author_data_str"
' --tag-name-filter cat -- --branches --tags
