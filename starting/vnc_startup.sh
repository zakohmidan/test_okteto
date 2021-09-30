#!/bin/bash
export PASSWORD="123123123"
echo "000000000000000000000000000000000000001111111111111111111111111111111111111"
mkdir -p /root/.vnc/
echo $PASSWORD | vncpasswd -f > $HOME/.vnc/passwd
chmod 600 $HOME/.vnc/passwd


vncserver
vncserver -kill :1
mv ~/.vnc/xstartup ~/.vnc/xstartup.bak
cat <<EOF > $HOME/.vnc/xstartup
#!/bin/bash
xrdb $HOME/.Xresources
startxfce4 &
EOF
chmod +x $HOME/.vnc/xstartup



#websockify -D --web=/usr/share/novnc/  6080 localhost:5901

###########################################
/usr/bin/supervisord -n



