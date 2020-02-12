#!/usr/bin/env bash
#08-02-2020
# Instagram Images Downloader
#resize -s 44 68 > /dev/null 2>&1
# color in bash
rd='\e[31m' #Red
bl='\e[34m' #Blue
yl='\e[33m' #Yellow
wt='\e[97m' #White
mg='\e[35m' #Magenta
cy='\e[36m' #cyan
gr='\e[32m' #green
gy='\e[90m' #gray

# TAmpilan
echo -ne "\033]0;Sadness Give Me Power\007"
#bash suckbrain/skullhead.sh
#echo -e "\n\t\t     \e[41m${wt} Instagram Stalker Toolkit ${bl}\e[49m"
#echo -e "\n${yl}::${bl}[${cy} →${bl} ]${yl}::::${bl}[ ${yl}Sadness Give ME Power${bl}                         ]${yl}:${bl}[ ← ]${yl}::"
#echo -e "\n${yl}::${bl}[ ${cy}♯ ${bl}]${yl}::::${bl}[ ${yl}    Instagram Foto & Video  Downloader${bl}     ${yl}]::::${bl}[ ♯ ]${yl}::"
#echo -e "${yl}::${bl}[ ${cy}♯${bl} ]${yl}::::${bl}[ ${yl}Instagram Video Downloader${bl}                    ]${yl}:${bl}[ ♯ ]${yl}::"
#echo -e "             \e[40m\t\t     ${rd} Sadness       \e[49m"
#echo -e "\n${yl}::${bl}[ 01 ]${yl}::${bl}[${gr}  Foto  Downloader ${bl} ]"
#echo -e "${yl}::${bl}[ 02 ]${yl}::${bl}[${gr}  Video Downloader ${bl} ]"
#echo -e "${yl}::${bl}[ 03 ]${yl}::${bl}[${gr}  Foto Downloader ( Private Account ) ${bl} ]"
# Options
#echo -ne "\n[Sadness Give Me Power]->"
#echo -ne "\n${yl}::${bl}[ ${gr}Choose What You Want${bl} ]${yl}::>_${yl} "
sadness="$1"
# # #
#--------------Host-------------#
link="https://www.instagram.com"
#===============================#
#==============User aGent==========================================================================================#
uragent="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36"
#==================================================================================================================#
Fuck() {
# Cheking Account
if [[ $sadness == "Get_foto" ]]; then
  clear
  echo -e "${yl}::[ Get_foto ] "
  echo -ne "\n::[ Input ]:[ username ]-> "
  read parameter
  tmp="/tmp/result.txt"
  tautan=$(curl -s -L -A "$uragent" "$link/$parameter/")
  sed 's+user_forward+'$parameter+'g' suckbrain/scrape.py > scrape.$parameter.py
  rm -rf $tmp
  python3 scrape.$parameter.py > $tmp
  rm -rf scrape.$parameter.py
  fruit=$(cat /tmp/result.txt)

      if [[ $tautan =~ "The link you followed may be broken," ]] || [[ $tautan =~ "or the page may have been removed." ]] || [[ $tautan =~ "Don't have an account? Sign up" ]] || [[ $tautan =~ "Get the app." ]]; then
          bash suckbrain/skullhead.sh
          echo -e "\n::[${rd} X ${yl}]::[${bl} User Account ${yl}] -> ${rd}Not Found!"

      elif [[ $tautan =~ '"is_private":true' ]]; then
          bash suckbrain/skullhead.sh
          echo -e "${yl}\n::[${gr} ✔ ${yl}]:::[ ${bl}User Account${yl} ] -> Private!"
          echo -e "\n::[${rd} 卌 ${yl}]:[${bl} Description ${yl}] "
          echo -e "\t -> [ null ]"
      else
          bash suckbrain/skullhead.sh
          echo -e "${yl}\n::[${gr} ✔ ${yl}]:::[ ${bl}User Account${yl} ] -> ${gr}Found!${yl}"
          echo -e "\n::[${rd} 卌 ${yl}]:[${bl} Description ${yl}] "
          echo -e "\t -> [ $fruit ]"
          content=$(curl -s -L -A "$uragent" "$link/$parameter"  | grep -Po '(?<="display_url":")[^",]*' > trash/content.txt)
          muntah=$(cat trash/content.txt)
          echo -e "$muntah" > trash/content_nyata.txt
          rm -rf trash/content.txt
          mkdir -p trash/img_${parameter}
          sleep 3
          echo ""
          echo -e "::[${bl} Downloading ${yl}]:[${bl} Content${yl} ]\n"
          for data in $(cat trash/content_nyata.txt); do
            wget -O trash/img_${parameter}/${RANDOM}.jpg $data -q --show-progress
          done
          rm -rf trash/content_nyata.txt
          echo -e $yl"\n::[Done !]:[$gr\e[5m✔\e[25m$yl]\n"
          sleep 0.5
          xdg-open trash/img_${parameter}

      fi
elif [[ $sadness == "Get_video" ]]; then
# Cheking video
clear
echo -e "${yl}::[ Get_video ]"
echo -e "Example : https://www.instagram.com/p/B52GbZcl5Mf/ -> B52GbZcl5Mf"
echo -ne "${yl}\n::[ Input ]:[ Video ] -> "
read parameter
tautan=$(curl -s -L -A "$uragent" "$link/p/$parameter/")
     if [[ $tautan =~ "Thelink you followed may be broken." ]] || [[ $tautan =~ "or the page may be have been removed." ]] || [[ $tautan =~ "Don't have an account? Sign up" ]] || [[ $tautan =~ "Get the app." ]]; then
         bash suckbrain/skullhead.sh
         echo -e "\n::[${rd} X ${yl}]::[${bl} User Account ${yl}] -> ${rd}Not Found!"

     elif [[ $tautan =~ '"is_private":true' ]]; then
         echo -e "${yl}\n::[${gr} ✔ ${yl}]:::[ ${bl}User Account${yl} ] -> Private!"
         echo -e "::[${rd} 卌 ${yl}]:[${bl}   User Video   ${yl}] "
         echo -e "\t -> [ Null ]"
     else
         bash suckbrain/skullhead.sh
         echo -e "${yl}\n::[${gr} ✔ ${yl}]:::[ ${bl}User Account${yl} ] -> ${gr}Found!${yl}"
         echo -e "::[ 卌 ]:::[ User Video ]"
         echo -e "\t -> Downloading..."
         content=$(curl -s -L -A "$uragent" "$link/p/$parameter" | grep -Po '(?<="video_url":")[^",]*' > /tmp/content.txt)
         muntah=$(cat /tmp/content.txt)
         echo -e "$muntah" > /tmp/content_nyata.txt
         rm -rf /tmp/content.txt
         mkdir -p trash/vid_${parameter}
         sleep 3
         echo ""
         for data in $(cat /tmp/content_nyata.txt); do
           wget -O trash/vid_$parameter/${RANDOM}.mp4 $data -q --show-progress
         done
         rm -rf /tmp/content_nyata.txt
         echo -e $yl"\n::[Done !]:[$gr\e[5m✔\e[25m$yl]\n"
         sleep 0.5
         xdg-open trash/vid_${parameter}
     fi
elif [[ $sadness == "version" ]] || [[ $sadnessc == "Version" ]]; then
echo -e "Code in    : 2020-02-08"
echo -e "Description: Instagram  Stalker Toolkit"
echo -e "Version    : beta 0.1  "
echo -e "Codename   : Sadness   "
echo -e "Creator    : localhost229"

elif [[ $sadness == "Get_foto_private" ]]; then
         echo "Not Ready yet"
else
clear
echo -e "\nExample ./Instaload ::[ Get_foto ]::[ Get_video ]::[ Version ]::[ Get_foto_private]"


fi

}

Fuck
