This build is a bit of a mess, and assumes that you've imported the ubuntu-cloud
qcow2 image. I'll fix that so that there's a Packer build that does all of that
automagically.

A bunch of stuff going on here to try to prevent the apt daily update from
kicking off and preventing the various apt operations from working and
breaking the build. I'll ferret out which of these are actually effective
someday. :)
