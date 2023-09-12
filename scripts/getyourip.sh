# MADE INTO SINGLE LINE
# ADD TO .bashrc or .bash_profile TO GET MORE ADVANTAGE

# TO DO ==> Define Your ipinfo.io key as a Global Variable

################ UnComment The Below Line After Adding Your Ipinfo API key ##################

# export IPINFO = 'API_KEY_HERE'

echo IPINFO > /tmp/ipinfo.txt && curl -s ipinfo.io?token=$IPINFO >> /tmp/ipinfo.txt && awk 'NR==1;NR==3;NR==4;NR==7' "/tmp/ipinfo.txt" && rm /tmp/ipinfo.txt # GETS IP INFO

# Get Your ipinfo API go to ==> ipinfo.io
