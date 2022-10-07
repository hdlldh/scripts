REPO_PATH="$HOME/Repos"
[ ! -d "$REPO_PATH" ] && mkdir -p "$REPO_PATH"
declare -a repo_urls=(\
	"https://github.com/scalanlp/breeze.git" \
	"https://github.com/catboost/catboost.git" \
	"https://github.com/deepjavalibrary/d2l-java.git" \
	"https://github.com/deepjavalibrary/djl.git" \
	"https://github.com/deepjavalibrary/djl-demo.git" \
	"https://github.com/ageron/handson-ml2.git" \
	"https://github.com/huggingface/evaluate.git" \
	"https://github.com/huggingface/tokenizers.git" \
	"https://github.com/huggingface/transformers.git" \
	"https://github.com/apache/spark.git" \
	"https://github.com/JohnSnowLabs/spark-nlp.git" \
	"https://github.com/JohnSnowLabs/spark-nlp-workshop.git" \
	"https://github.com/tensorflow/docs.git" \
	"https://github.com/tensorflow/tfx.git" \
	"https://github.com/tensorflow/serving.git" \
	"https://github.com/tensorflow/java.git" \
	"https://github.com/pytorch/pytorch.git" \
	"https://github.com/pytorch/serve.git" \
	"https://github.com/pytorch/tutorials.git" \
) 

for url in "${repo_urls[@]}"
do
    repo=$(basename "$url" | cut -f 1 -d ".")
    path=$(dirname "$url")
    owner=$(basename "$path")
    echo "Checking $repo"
    if [ $owner = "tensorflow" ]; then
	renamed_repo="tf_$repo"
    elif [ $owner = "pytorch" ]; then
        renamed_repo="pt_$repo"
    else
	renamed_repo=$repo
    fi 
    if [ -d "$REPO_PATH/$renamed_repo" ]; then
        echo "Updating $renamed_repo"
        cd "$REPO_PATH/$renamed_repo"
        git pull
    else
        echo "$REPO_PATH/$repo does not exist."
        echo "Cloning $repo"
        cd $REPO_PATH
        if [ $repo = $renamed_repo ]; then
        	git clone $url
	else
		git clone $url $renamed_repo
	fi
    fi
done
