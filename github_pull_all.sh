declare -a repos=(\
	"breeze" \
	"catboost" \
	"handson-ml2" \
	"nlp_hugging_face" \
	"spark" \
	"spark-nlp" \
	"spark-nlp-workshop" \
	"tensorflow" \
	"tensorflow_java" \
	"tf-deploy"\
) 

for repo in "${repos[@]}"
do
    echo "$repo"
    cd ~/GithubRepos/$repo
    git pull
done
