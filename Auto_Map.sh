#!/bin/bash 
# Author: Mortada cherrak 
# Date Created: 08-06-2020
# Description: A simple Network Scanner 
# Date Modified:  ADD CASE UDP TCP AND ALL 
############################################
#Colors variabel
NC='\033[0m'
RED='\033[1;38;5;196m'
GREEN='\033[1;38;5;040m'
ORANGE='\033[1;38;5;202m'
BLUE='\033[1;38;5;012m'
BLUE2='\033[1;38;5;032m'
PINK='\033[1;38;5;013m'
GRAY='\033[1;38;5;004m'
NEW='\033[1;38;5;154m'
YELLOW='\033[1;38;5;214m'
CG='\033[1;38;5;087m'
CP='\033[1;38;5;221m'
CPO='\033[1;38;5;205m'
CN='\033[1;38;5;247m'
CNC='\033[1;38;5;051m'
############################################
#Env
LINK='https://github.com/3xTpA/'

#Banner and version
Codename='3xTpA'
Version=1.0.3
function banner(){
	echo -e ""
echo -e "${CP}     \     |   |__ __|  _ \        \  |      \      _ \ "
echo -e "${CP}    _ \    |   |   |   |   |      |\/ |     _ \    |   | "
echo -e "${CP}   ___ \   |   |   |   |   |      |   |    ___ \   ___/ "
echo -e "${CP} _/    _\ \___/   _|  \___/      _|  _|  _/    _\ _|    "                                                         
     echo -e "     ${BLUE2}  A Framework for Scanning and Gathering${NC}"
echo -e "              ${BLUE2}Exposed Git Repository${NC}"
}

#Basic_TCP_Directories Function
function MK_Basic_TCP(){
if [ ! -d "$IP" ];then
        mkdir $IP
fi
if [ ! -d "$IP/nmap" ];then
        mkdir $IP/nmap
fi
if [ ! -d "$IP/nmap/TCP" ];then
	mkdir $IP/nmap/TCP
fi
if [ ! -f "$IP/nmap/TCP/Basic_TCP_$IP.txt" ];then
	touch $IP/nmap/TCP/Basic_TCP_$IP.txt
fi
}

#Basic_UDP_Directories Function
function MK_Basic_UDP(){
if [ ! -d "$IP" ];then
        mkdir $IP
fi
if [ ! -d "$IP/nmap" ];then
        mkdir $IP/nmap
fi
if [ ! -d "$IP/nmap/UDP" ];then
	mkdir $IP/nmap/UDP
fi
if [ ! -f "$IP/nmap/UDP/Basic_UDP_$IP.txt" ];then
	touch $IP/nmap/UDP/Basic_UDP_$IP.txt
fi
}

#Full_TCP_Directories Function
function MK_Full_TCP(){
if [ ! -d "$IP" ];then
        mkdir $IP
fi
if [ ! -d "$IP/nmap" ];then
        mkdir $IP/nmap
fi
if [ ! -d "$IP/nmap/TCP" ];then
	mkdir $IP/nmap/TCP
fi
if [ ! -f "$IP/nmap/TCP/Full_TCP_$IP.txt" ];then
	touch $IP/nmap/TCP/Full_TCP_$IP.txt
fi
}

#Full_UDP_Directories Function
function MK_Full_UDP(){
if [ ! -d "$IP" ];then
        mkdir $IP
fi
if [ ! -d "$IP/nmap" ];then
        mkdir $IP/nmap
fi
if [ ! -d "$IP/nmap/UDP" ];then
	mkdir $IP/nmap/UDP
fi
if [ ! -f "$IP/nmap/UDP/Full_UDP_$IP.txt" ];then
	touch $IP/nmap/UDP/Full_UDP_$IP.txt
fi
}

#All_Directories Function
function MK_ALL(){
if [ ! -d "$IP" ];then
        mkdir $IP
fi
if [ ! -d "$IP/nmap" ];then
        mkdir $IP/nmap
fi
if [ ! -d "$IP/nmap/TCP" ];then
	mkdir $IP/nmap/TCP
fi
if [ ! -d "$IP/nmap/UDP" ];then
	mkdir $IP/nmap/UDP
fi
if [ ! -f "$IP/nmap/TCP/Basic_TCP_$IP.txt" ];then
	touch $IP/nmap/TCP/Basic_TCP_$IP.txt
fi
if [ ! -f "$IP/nmap/UDP/Basic_UDP_$IP.txt" ];then
	touch $IP/nmap/UDP/Basic_UDP_$IP.txt
fi
if [ ! -f "$IP/nmap/TCP/Full_TCP_$IP.txt" ];then
	touch $IP/nmap/TCP/Full_TCP_$IP.txt
fi
if [ ! -f "$IP/nmap/UDP/Full_UDP_$IP.txt" ];then
	touch $IP/nmap/UDP/Full_UDP_$IP.txt
fi
}

#Basic_TCP Function
function Basic_TCP(){
	clear
	MK_Basic_TCP
	 banner
     echo -e ""
echo -e "${YELLOW}[-]${NC} ${NEW}Target : ${GREEN}${IP}...${NC}"
echo -e "${CP}[+]${NC} ${ORANGE}Basic TCP Scanning...: ${GREEN}${IP}${NC}"
echo -e "${RED}[*]${NC} ${PINK}Scanning process started...${NC}"
echo -e ""
nmap -Pn -T4 --max-retries 1 --max-scan-delay 20 --defeat-rst-ratelimit -p 0-65535 $IP -oN $IP/nmap/TCP/Basic_TCP_FR.txt
echo "PORT     STATE SERVICE VERSION" > $IP/nmap/TCP/Basic_TCP_$IP.txt
cat $IP/nmap/TCP/Basic_TCP_FR.txt | awk '/open/' >> $IP/nmap/TCP/Basic_TCP_$IP.txt
cat $IP/nmap/TCP/Basic_TCP_FR.txt | grep open | cut -d " " -f1 > $IP/nmap/TCP/new.txt
cat $IP/nmap/TCP/new.txt | cut -d "/" -f1 | tr '\n' ',' > $IP/nmap/TCP/Basic_TCP_FR.txt
rm $IP/nmap/TCP/new.txt
rm $IP/nmap/TCP/Basic_TCP_FR.txt
}

#Full_TCP Function
function Full_TCP(){
	clear
	MK_Full_TCP
     banner
     echo -e ""
echo -e "${YELLOW}[-]${NC} ${NEW}Target : ${GREEN}${IP}...${NC}"
echo -e "${CP}[+]${NC} ${ORANGE}Full TCP Scanning...: ${GREEN}${IP}${NC}"
echo -e "${RED}[*]${NC} ${PINK}Scanning process started...${NC}"
echo -e ""
nmap -Pn -T4 --max-retries 1 --max-scan-delay 20 --defeat-rst-ratelimit -p 0-65535 $IP -oN $IP/nmap/TCP/Basic_TCP_FR.txt
echo "PORT     STATE SERVICE VERSION" > $IP/nmap/TCP/Basic_TCP_$IP.txt
cat $IP/nmap/TCP/Basic_TCP_FR.txt | awk '/open/' >> $IP/nmap/TCP/Basic_TCP_$IP.txt
cat $IP/nmap/TCP/Basic_TCP_FR.txt | grep open | cut -d " " -f1 > $IP/nmap/TCP/new.txt
cat $IP/nmap/TCP/new.txt | cut -d "/" -f1 | tr '\n' ',' > $IP/nmap/TCP/Basic_TCP_FR.txt
rm $IP/nmap/TCP/new.txt
nmap -Pn -T4 -A --max-retries 1 --max-scan-delay 20 --defeat-rst-ratelimit -p $(cat $IP/nmap/TCP/Basic_TCP_FR.txt) $IP -oN $IP/nmap/TCP/Full_TCP_$IP.txt
rm $IP/nmap/TCP/Basic_TCP_FR.txt
rm $IP/nmap/TCP/Basic_TCP_FR.txt
}

#Basic_UDP Function
function Basic_UDP(){
	clear
	MK_Basic_UDP
     banner
     echo -e ""
echo -e "${YELLOW}[-]${NC} ${NEW}Target : ${GREEN}${IP}...${NC}"
echo -e "${CP}[+]${NC} ${ORANGE}Basic UDP Scanning...: ${GREEN}${IP}${NC}"
echo -e "${RED}[*]${NC} ${PINK}Scanning process started...${NC}"
echo -e ""
nmap -Pn -T3 -sU --max-retries 1 --open $IP -oN $IP/nmap/UDP/Basic_UDP_FR.txt
cat $IP/nmap/UDP/Basic_UDP_FR.txt | awk '/open/' > $IP/nmap/UDP/Basic_UDP_$IP.txt
cat $IP/nmap/UDP/Basic_UDP_FR.txt | grep open | cut -d " " -f1 > $IP/nmap/UDP/new.txt
cat $IP/nmap/UDP/new.txt |grep udp | cut -d "/" -f1 | tr '\n' ',' > $IP/nmap/UDP/Basic_UDP_FR.txt
rm $IP/nmap/UDP/new.txt
}

#Full_UDP Function
function Full_UDP(){
	clear
	MK_Full_UDP
	 banner
     echo -e ""
echo -e "${YELLOW}[-]${NC} ${NEW}Target : ${GREEN}${IP}...${NC}"
echo -e "${CP}[+]${NC} ${ORANGE}Full UDP Scanning...: ${GREEN}${IP}${NC}"
echo -e "${RED}[*]${NC} ${PINK}Scanning process started...${NC}"
echo -e ""
nmap -Pn -T3 -sU --max-retries 1 --open $IP -oN $IP/nmap/UDP/Basic_UDP_FR.txt
cat $IP/nmap/UDP/Basic_UDP_FR.txt | awk '/open/' > $IP/nmap/UDP/Basic_UDP_$IP.txt
cat $IP/nmap/UDP/Basic_UDP_FR.txt | grep open | cut -d " " -f1 > $IP/nmap/UDP/new.txt
cat $IP/nmap/UDP/new.txt |grep udp | cut -d "/" -f1 | tr '\n' ',' > $IP/nmap/UDP/Basic_UDP_FR.txt
rm $IP/nmap/UDP/new.txt
nmap -Pn -T3 -O -sV -sC -sU --max-retries 1 -p U:$(cat $IP/nmap/UDP/Basic_UDP_FR.txt) $IP -oN $IP/nmap/UDP/Full_UDP_$IP.txt
rm $IP/nmap/UDP/Basic_UDP_FR.txt
rm $IP/nmap/UDP/Basic_UDP_$IP.txt
}

#All Scan Function
function ALL(){
	clear
	MK_ALL
     banner
     echo -e ""
echo -e "${YELLOW}[-]${NC} ${NEW}Target : ${GREEN}${IP}...${NC}"
echo -e "${CP}[+]${NC} ${ORANGE}Basic TCP Scanning...: ${GREEN}${IP}${NC}"
echo -e "${RED}[*]${NC} ${PINK}Scanning process started...${NC}"
echo -e ""
nmap -Pn -T4 --max-retries 1 --max-scan-delay 20 --defeat-rst-ratelimit -p 0-65535 $IP -oN $IP/nmap/TCP/Basic_TCP_FR.txt
echo "PORT     STATE SERVICE VERSION" > $IP/nmap/TCP/Basic_TCP_$IP.txt
cat $IP/nmap/TCP/Basic_TCP_FR.txt | awk '/open/' >> $IP/nmap/TCP/Basic_TCP_$IP.txt
cat $IP/nmap/TCP/Basic_TCP_FR.txt | grep open | cut -d " " -f1 > $IP/nmap/TCP/new.txt
cat $IP/nmap/TCP/new.txt | cut -d "/" -f1 | tr '\n' ',' > $IP/nmap/TCP/Basic_TCP_FR.txt
rm $IP/nmap/TCP/new.txt
echo -e ""
echo -e "${YELLOW}[-]${NC} ${NEW}Target : ${GREEN}${IP}...${NC}"
echo -e "${CP}[+]${NC} ${ORANGE}Full TCP Scanning...: ${GREEN}${IP}${NC}"
echo -e "${RED}[*]${NC} ${PINK}Scanning process started...${NC}"
echo -e ""
nmap -Pn -T4 -A --max-retries 1 --max-scan-delay 20 --defeat-rst-ratelimit -p $(cat $IP/nmap/TCP/Basic_TCP_FR.txt) $IP -oN $IP/nmap/TCP/Full_TCP_$IP.txt
rm $IP/nmap/TCP/Basic_TCP_FR.txt
sleep 1
echo -e ""
echo -e "${YELLOW}[-]${NC} ${NEW}Target : ${GREEN}${IP}...${NC}"
echo -e "${CP}[+]${NC} ${ORANGE}Basic UDP Scanning...: ${GREEN}${IP}${NC}"
echo -e "${RED}[*]${NC} ${PINK}Scanning process started...${NC}"
echo -e ""
nmap -Pn -T3 -sU --max-retries 1 --open $IP -oN $IP/nmap/UDP/Basic_UDP_FR.txt
cat $IP/nmap/UDP/Basic_UDP_FR.txt | awk '/open/' > $IP/nmap/UDP/Basic_UDP_$IP.txt
cat $IP/nmap/UDP/Basic_UDP_FR.txt | grep open | cut -d " " -f1 > $IP/nmap/UDP/new.txt
cat $IP/nmap/UDP/new.txt |grep udp | cut -d "/" -f1 | tr '\n' ',' > $IP/nmap/UDP/Basic_UDP_FR.txt
rm $IP/nmap/UDP/new.txt
echo -e ""
echo -e "${YELLOW}[-]${NC} ${NEW}Target : ${GREEN}${IP}...${NC}"
echo -e "${CP}[+]${NC} ${ORANGE}Full UDP Scanning...: ${GREEN}${IP}${NC}"
echo -e "${RED}[*]${NC} ${PINK}Scanning process started...${NC}"
echo -e ""
nmap -Pn -T3 -O -sV -sC -sU --max-retries 1 -p U:$(cat $IP/nmap/UDP/Basic_UDP_FR.txt) $IP -oN $IP/nmap/UDP/Full_UDP_$IP.txt
rm $IP/nmap/UDP/Basic_UDP_FR.txt
}
#Main Menu
function Main_Menu(){
	clear
    banner
    echo ""
    echo -e "${CN}Author   : ${BLUE}Mortada Cherrak ($LINK)"
	echo -e "${CN}Codename : ${CPO}${Codename}"
	echo -e "${CN}Version  : ${BLUE}${Version}"
	echo ""
	echo -e "  ${NC}[${GREEN}"+"${NC}]${RED} Enter Target IP"
	echo -e "  ${NC}[${CG}"1"${NC}]${CNC} Basic TCP Scan"
	echo -e "  ${NC}[${CG}"2"${NC}]${CNC} Full  TCP Scan"
	echo -e "  ${NC}[${CG}"3"${NC}]${CNC} Basic UDP Scan"
	echo -e "  ${NC}[${CG}"4"${NC}]${CNC} Full  UDP Scan"
	echo -e "  ${NC}[${CG}"5"${NC}]${CNC} All"
	echo -e "  ${NC}[${CG}"6"${NC}]${CNC} Exit"
	
	echo ""
	echo -ne "${YELLOW}Input Target IP ${CG}(${NC}${GREEN}ex:${NC} ${RED}10.10.10.1${NC}${CG})${NC}: "; tput sgr0
	read IP
	echo -ne "${YELLOW}Input your choice: "; tput sgr0
	read CHOICE
	
#Menu Function
if test "$CHOICE" == '1'
then
    Basic_TCP
elif test "$CHOICE" == '2'
then
	Full_TCP
elif test "$CHOICE" == '3'
then
    Basic_UDP
elif test "$CHOICE" == '4'
then
	Full_UDP
 
elif test "$CHOICE" == '5'
then
	ALL
elif test "$CHOICE" == '6'
then
	exit 0
 else
    Main_Menu
 fi
}
Main_Menu

