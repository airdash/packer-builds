This sets up a pi-hole image for use in an Openstack environment.

You'll need to change the variables in packer.json to suit your environment.

You will also need to set IPV4_ADDRESS to something sane in setupVars.conf

This sets up pi-hole's web interface without a password as well, so you will want to change that
either in setupVars.conf or after you deploy the image.

TODO:
Automatically generate the password on build and display it to the user
Assign IP address to setupVars.conf via /etc/network/if-up.d on boot and restart service
