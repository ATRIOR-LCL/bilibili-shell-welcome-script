#!/bin/bash

# 颜色配置
WHITE='\033[97m' # 白色
BLACK='\033[30m' # 黑色
PINK='\033[95m'  # 粉色
BLUE='\033[94m'  # 蓝色
RESET='\033[0m'  # 重置颜色
USER=$(whoami)
HOSTNAME=$(hostname)
OS=$(lsb_release -d 2>/dev/null | cut -f2 || uname -s)
KERNEL=$(uname -r)
UPTIME=$(uptime -p 2>/dev/null || uptime | awk '{print $3,$4}' | sed 's/,//')
MEMORY=$(LANG=C free -h | awk '/^Mem:/ {printf "%s/%s", $3, $2}')
DISK=$(df -h / | awk 'NR==2 {print $3"/"$2" ("$5")"}')
CPU=$(grep "model name" /proc/cpuinfo | head -1 | cut -d: -f2 | sed 's/^ *//' | cut -c1-25)
draw_bilibili_tv() {
  echo
  echo -e "           ${BLACK}██${RESET}      ${BLACK}██${RESET}         ${WHITE}     ╭──────────────────────────────────────────────╮${RESET}"
  echo -e "      ${BLACK}███████████████████${RESET}     ${WHITE}     │${RESET}     ${PINK}🎉 欢迎回来！${WHITE}$USER${RESET} ${PINK}(◉ ‿ ◉)${RESET}     ${WHITE}│${RESET}"
  echo -e "    ${BLACK}██${WHITE}███████████████████${BLACK}██${RESET}   ${WHITE}     ├──────────────────────────────────────────────┤${RESET}"
  echo -e "  ${BLACK}██${WHITE}███████████████████████${BLACK}██${RESET} ${WHITE}     │${RESET} ${WHITE}🖥️  主机名  │${RESET} ${WHITE}$(printf "%-25s" "$HOSTNAME")${RESET} ${WHITE}│${RESET}"
  echo -e "  ${BLACK}██${WHITE}███${BLACK}█████${WHITE}█████${WHITE}██${BLACK}█████${WHITE}███${BLACK}██${RESET} ${WHITE}     │${RESET} ${WHITE}🐧  系统    │${RESET} ${WHITE}$(printf "%-25s" "$OS")${RESET} ${WHITE}│${RESET}"
  echo -e "  ${BLACK}██${WHITE}███████████████████████${BLACK}██${RESET} ${WHITE}     │${RESET} ${WHITE}⚙️  内核    │${RESET} ${WHITE}$(printf "%-25s" "$KERNEL")${RESET} ${WHITE}│${RESET}"
  echo -e "  ${BLACK}██${WHITE}████████${BLACK}███████${WHITE}████████${BLACK}██${RESET} ${WHITE}     │${RESET} ${WHITE}⏰  运行时间│${RESET} ${WHITE}$(printf "%-25s" "$UPTIME")${RESET} ${WHITE}│${RESET}"
  echo -e "  ${BLACK}██${WHITE}███${WHITE}████████████████████${BLACK}██${RESET} ${WHITE}     │${RESET} ${WHITE}💾  内存    │${RESET} ${WHITE}$(printf "%-25s" "$MEMORY")${RESET} ${WHITE}│${RESET}"
  echo -e "  ${BLACK}██${WHITE}███████████████████████${BLACK}██${RESET} ${WHITE}     │${RESET} ${WHITE}💿  磁盘    │${RESET} ${WHITE}$(printf "%-25s" "$DISK")${RESET} ${WHITE}│${RESET}"
  echo -e "    ${BLACK}██${WHITE}████████████████████${BLACK}██${RESET} ${WHITE}      │${RESET} ${WHITE}🔧  处理器  │${RESET} ${WHITE}$(printf "%-25s" "$CPU")${RESET} ${WHITE}│${RESET}"
  echo -e "      ${BLACK}███████████████████${RESET} ${WHITE}         ╰──────────────────────────────────────────────╯${RESET}"
  echo
}

draw_bilibili_tv
