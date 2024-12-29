# Define variables
IMAGE_NAME = fabric-instance
TAG = latest

# Build the Docker image
build:
	docker build -t $(IMAGE_NAME):$(TAG) .

# Run the Docker container
run:
	docker run -it --rm $(IMAGE_NAME):$(TAG)

# Delete the Docker image
clean:
	docker rmi $(IMAGE_NAME):$(TAG)

# Stop and remove all containers (optional utility target)
stop-containers:
	docker stop $$(docker ps -q) || true
	docker rm $$(docker ps -aq) || true

# Remove all unused Docker resources (optional utility target)
prune:
	docker system prune -f
