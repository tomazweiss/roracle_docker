PROJECT_FOLDER=/home/weisst/projects/docker/roracle

docker run \
		--rm \
		-it \
		-p 8787:8787 \
		-e USERID=$UID \
		-e PASSWORD=rstudio \
		-v $PROJECT_FOLDER:/home/rstudio/workspace \
		roracle:v0.1