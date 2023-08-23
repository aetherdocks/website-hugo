#!/bin/bash
# This will simply execute the deploy command that exists in my server

ssh delta@josefina-jornet /home/delta/docker/nginx/deploy.sh

# If you are wondering what is that remote host. All my machines in my homelab use Tailscale, works like magic and I can this stuff.
