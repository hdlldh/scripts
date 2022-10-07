REPO_PATH="$HOME/Repos"
[ ! -d "$REPO_PATH" ] && mkdir -p "$REPO_PATH"
declare -a repo_urls=(\
	"https://github.com/scalanlp/breeze" \
	"https://github.com/catboost/catboost" \
	"https://github.com/deepjavalibrary/d2l-java.git" \
	"https://github.com/deepjavalibrary/djl.git" \
	"https://github.com/deepjavalibrary/djl-demo" \
	"https://github.com/ageron/handson-ml2.git" \
	"https://github.com/huggingface/evaluate.git" \
	"https://github.com/huggingface/tokenizers" \
	"https://github.com/huggingface/transformers" \
	"https://github.com/apache/spark" \
	"https://github.com/JohnSnowLabs/spark-nlp.git" \
	"https://github.com/JohnSnowLabs/spark-nlp-workshop.git" \
	"https://github.com/tensorflow/tensorflow" \
	"https://github.com/tensorflow/tfx.git" \
	"https://github.com/tensorflow/serving.git" \
	"https://github.com/tensorflow/java.git" \
	"https://github.com/pytorch/pytorch.git" \
	"https://github.com/pytorch/serve.git" \
) 

for url in "${repo_urls[@]}"
do
    repo=$(basename "$url" | cut -f 1 -d ".")
    echo "Checking $repo"
    if [ -d "$REPO_PATH/$repo" ]; then
        echo "Updating $repo"
        cd "$REPO_PATH/$repo"
        git pull
    else
        echo "$REPO_PATH/$repo does not exist."
        echo "Cloning $repo"
        cd $REPO_PATH
        git clone $url
    fi
done
