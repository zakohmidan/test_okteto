#!/bin/bash
export PASSWORD="123123123"
echo "000000000000000000000000000000000000001111111111111111111111111111111111111"
mkdir -p /root/.vnc/
echo $PASSWORD | vncpasswd -f > $HOME/.vnc/passwd
chmod 600 $HOME/.vnc/passwd
cat <<EOF > $HOME/.vnc/xstartup
#!/bin/bash
xrdb $HOME/.Xresources
startxfce4 &
EOF
chmod +x $HOME/.vnc/xstartup


