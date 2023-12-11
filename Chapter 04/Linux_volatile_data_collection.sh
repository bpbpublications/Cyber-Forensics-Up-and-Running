#!/bin/bash 

  

# Create a directory with a timestamp 

DIR="volatile_data_$(date +%Y%m%d_%H%M%S)" 

mkdir "$DIR" 

  

# Collect system date and time 

echo "Collecting system date and time ..." 

date > "$DIR/date.txt" 

  

# Collect system uptime 

echo "Collecting system uptime ..." 

uptime > "$DIR/uptime.txt" 

  

# Collect logged-in users 

echo "Collecting logged-in users ..." 

who > "$DIR/who.txt" 

  

# Collect running processes 

echo "Collecting running processes ..." 

ps aux > "$DIR/ps.txt" 

  

# Collect network interfaces and configuration 

echo "Collecting network interfaces and configuration ..." 

ifconfig -a > "$DIR/ifconfig.txt" 

  

# Collect network connections 

echo "Collecting network connections ..." 

sudo netstat -anpt > "$DIR/netstat.txt" 

  

# Collect open files 

echo "Collecting open files ..." 

lsof > "$DIR/lsof.txt" 

  

# Collect loaded kernel modules 

echo "Collecting loaded kernel modules ..." 

lsmod > "$DIR/lsmod.txt" 

  

# Collect mounted filesystems 

echo "Collecting mounted filesystems ..." 

mount > "$DIR/mount.txt" 

  

# Compress the directory into a zip file 

echo "Compressing the directory into a zip file ..." 

zip -r "$DIR.zip" "$DIR" 

  

# Delete the original directory (optional) 

# echo "Deleting the original directory ..." 

# rm -rf "$DIR" 

  

echo "Volatile data collection is completed." 

 