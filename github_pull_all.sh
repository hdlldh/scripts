declare -a repos=("breeze" "catboost" "handson-ml2" "spark" "spark-nlp" "spark-nlp-workshop" "tensorflow" "tensorflow_java" "tf-deploy")

for repo in "${repos[@]}"
do
    echo "$repo"
    cd ~/GithubRepos/$repo
    git pull
done
