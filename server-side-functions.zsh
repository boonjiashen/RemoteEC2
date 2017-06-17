function myVncserver() {
 # http:/w?VNC
 output=`/usr/bin/vncserver -geometry 1240x760 -dpi 84 2>&1 &`
 display=`echo $output 2>&1 | head -2 | tail -1 | sed -e 's/.*desktop is \([^ ]*\).*/\1/g'`
 echo "VNC server is running on is $display"
 vncconfig -display $display -nowin &
 if [ -x /usr/local/bin/autocutsel ] ; then ; /usr/local/bin/autocutsel & ; fi
}
