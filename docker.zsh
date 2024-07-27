
startSmartHomeContainers() {
	echo "Starting Containers..."
	cd ~/coding-projects/smart-frontend
	sudo docker compose up --detach
	cd ~/coding-projects/smart-backend
	sudo docker compose up --detach
	echo "Smart Home Containers are ready for development;)"
}

stopSmartHomeContainers() {
	echo "Stopping Containers..."
	sudo docker stop $(sudo docker ps -q)
	echo "ALL CONTAINERS ARE STOPPED NOW"
}

alias startSmartHome='startSmartHomeContainers'
alias stopSmartHome='stopSmartHomeContainers'
