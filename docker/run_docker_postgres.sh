DATA_FOLDER=${HOME}/docker/postgres/data
mkdir -p ${DATA_FOLDER}
docker run -d \
--restart always \
--name Tahoe \
-e POSTGRES_PASSWORD=Pass2020! \
-v ${DATA_FOLDER}/:/var/lib/docker/postgres/data \
-p 54321:5432 \
postgres
