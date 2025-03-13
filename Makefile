#  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣦⣴⣶⣾⣿⣶⣶⣶⣶⣦⣤⣄⠀⠀⠀⠀⠀⠀⠀                                              
#  ⠀⠀⠀⠀⠀⠀⠀⢠⡶⠻⠛⠟⠋⠉⠀⠈⠤⠴⠶⠶⢾⣿⣿⣿⣷⣦⠄⠀⠀⠀                𓐓  Makefile 𓐔           
#  ⠀⠀⠀⠀⠀⢀⠔⠋⠀⠀⠤⠒⠒⢲⠀⠀⠀⢀⣠⣤⣤⣬⣽⣿⣿⣿⣷⣄⠀⠀                                              
#  ⠀⠀⠀⣀⣎⢤⣶⣾⠅⠀⠀⢀⡤⠏⠀⠀⠀⠠⣄⣈⡙⠻⢿⣿⣿⣿⣿⣿⣦⠀      Dev: oezzaou <oussama.ezzaou@gmail.com> 
#  ⢀⠔⠉⠀⠊⠿⠿⣿⠂⠠⠢⣤⠤⣤⣼⣿⣶⣶⣤⣝⣻⣷⣦⣍⡻⣿⣿⣿⣿⡀                                              
#  ⢾⣾⣆⣤⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠉⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇                                              
#  ⠀⠈⢋⢹⠋⠉⠙⢦⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇       Created: 2024/12/13 10:01:26 by oezzaou
#  ⠀⠀⠀⠑⠀⠀⠀⠈⡇⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇       Updated: 2025/03/13 10:02:59 by oezzaou
#  ⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⢀⣾⣿⣿⠿⠟⠛⠋⠛⢿⣿⣿⠻⣿⣿⣿⣿⡿⠀                                              
#  ⠀⠀⠀⠀⠀⠀⠀⢀⠇⠀⢠⣿⣟⣭⣤⣶⣦⣄⡀⠀⠀⠈⠻⠀⠘⣿⣿⣿⠇⠀                                              
#  ⠀⠀⠀⠀⠀⠱⠤⠊⠀⢀⣿⡿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠘⣿⠏⠀⠀                             𓆩♕𓆪      
#  ⠀⠀⠀⠀⠀⡄⠀⠀⠀⠘⢧⡀⠀⠀⠸⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠐⠋⠀⠀⠀                     𓄂 oussama ezzaou𓆃  
#  ⠀⠀⠀⠀⠀⠘⠄⣀⡀⠸⠓⠀⠀⠀⠠⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                                              

#====[ Makefile: ]==============================================================
SRC := "." 

all: up

.header:
	@echo "\033[32m @@@@@@@  @@@ @@@  @@@  @@@@@@@   @@@@@@       @@@@@@@  @@@ @@@  @@@  @@@@@@@   @@@@@@ ";
	@echo "\033[32m @@!  @@@ @@! @@!@!@@@ !@@       @@!  @@@      @@!  @@@ @@! @@!@!@@@ !@@       @@!  @@@";
	@echo "\033[32m @!@@!@!  !!@ @!@@!!@! !@! @!@!@ @!@  !@!      @!@@!@!  !!@ @!@@!!@! !@! @!@!@ @!@  !@!";
	@echo "\033[32m !!:      !!: !!:  !!! :!!   !!: !!:  !!!      !!:      !!: !!:  !!! :!!   !!: !!:  !!!";
	@echo "\033[32m  :       :   ::    :   :: :: :   : :. :        :       :   ::    :   :: :: :   : :. : ";
	@echo "\033[0m";

help:
	@echo "Makefile commands: (SERVICE=<service_name> to specific service)"
	@echo "  all        - Start the project (clean, build, up)"
	@echo "  up         - Start the containers and build the images"
	@echo "  down       - Stop and remove the containers"
	@echo "  clean      - Stop and remove containers, images, and volumes"
	@echo "  logs       - View logs from the containers or a specific service"
	@echo "  status     - Show the status of the containers or a specific service."
	@echo "  re    - Restart the project or specific service"
	@echo "  prune      - Clean up unused Docker objects (stopped containers, networks, etc.)"
	@echo "  help       - Display this help message"

up: .header
	@docker-compose -f ./docker-compose.yml up -d --build

down:
	@docker-compose -f ./docker-compose.yml down --remove-orphans

logs:
	@docker-compose -f ./docker-compose.yml logs -f -t $(if $(SERVICE),$(SERVICE),)

status:
	@docker-compose -f ./docker-compose.yml ps --all $(if $(SERVICE),$(SERVICE),)

re:
	@docker-compose -f ./docker-compose.yml re $(if $(SERVICE),$(SERVICE),)

clean:
	@docker system prune -f
	@docker-compose -f ./docker-compose.yml down --volumes --rmi all --remove-orphans

.PHONY: all up down clean logs status re clean 
#===============================================================================
