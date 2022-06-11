declare -a repos=(\
	"breeze" \
	"catboost" \
        "d2l-java" \
	"djl" \
        "djl-demo" \
	"handson-ml2" \
        "ml-prod" \
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
