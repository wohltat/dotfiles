docker-compose up -d

# connect to container terminal, remap detach-key to free  ctrl+p
docker exec -it --detach-keys="ctrl-]" meinjaro /bin/zsh
