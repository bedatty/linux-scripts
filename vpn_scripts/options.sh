#! /usr/bin/env bash

username="";
opcao="";
volume="";

echo -n "What's volume name: "
read -re volume

Principal() {
 echo "Opções:"
   echo
   echo "1. List users"
   echo "2. Search a user"
   echo "3. Add users"
   echo "4. Delete users"
   echo "5. Exit"
   echo
   echo -n "What's your option: "
   read -re opcao
   case "$opcao" in
     1) list_users ;;
     2) search_user ;;
     3) add_user ;;
     4) delete_user ;;
     5) exit ;;
     *) "Unknow option" ; echo ; Principal ;;
   esac
}

#Functions

list_users() {
   clear
   docker exec "$volume" ovpn_listclients
   Principal
}

search_user() {
  clear
  echo -n "Informe o usuário: "
  read -re username
  docker exec "$volume" ovpn_listclients | grep "$username"
  Principal
}

add_user() {
  clear
  echo -n "Informe o usuário: "
  read -re username
  docker exec -it "$volume" easyrsa build-client-full "$username" nopass
  echo "Usuário $username adicionado."
  docker exec "$volume" ovpn_getclient "$username" > "$username".ovpn
  Principal
}

delete_user() {
  clear
  echo -n "Informe o usuário: "
  read -re username
  docker exec -it "$volume" ovpn_revokeclient "$username" remove
  Principal
}

Principal