#!/bin/bash

add_user() {
    read -p "Enter username: " username
    sudo useradd "$username"
}

delete_user() {
    read -p "Enter username: " username
    sudo userdel "$username"
}

change_password() {
    read -p "Enter username: " username
    sudo passwd "$username"
}

modify_uid() {
    read -p "Enter username: " username
    read -p "New UID: " new_uid
    sudo usermod -u "$new_uid" "$username"
}

add_group() {
    read -p "Enter group name: " groupname
    sudo groupadd "$groupname"
}

modify_group() { 
    read -p "Old group name: " old_group
    read -p "New group name: " new_group
    sudo groupmod -n "$new_group" "$old_group"
}

group_menu() {
    while true; do
        echo "1-Add group"
        echo "3-Modify group"
        echo "3-Back"
        read -p "Choice: " select
        case $select in
            1) add_group ;;
            2) modify_group ;;
            3) break ;;
            *) echo "please enter a vaild selection." ;;
        esac
    done
}

while true; do
    echo "1-User Menu"
    echo "2-Group Menu"
    echo "3-Exit"
    read -p "Choice: " select
    case $select in
        1)
            while true; do
                echo "1-Add user"
                echo "2-Delete user"
                echo "3-Change password"
                echo "4-Modify UID"
                echo "5-Back"
                read -p "Choice: " user_select
                case $user_select in
                    1) add_user ;;
                    2) delete_user ;;
                    3) change_password ;;
                    4) modify_uid ;;
                    5) break ;;
                    *) echo "Please enter valid selection." ;;
                esac
            done
            ;;
        2) group_menu ;;
        3) break ;;
        *) echo "please neter vaild selection" ;;
    esac
done
