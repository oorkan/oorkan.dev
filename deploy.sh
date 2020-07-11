#!/bin/sh
git pull origin master && git push origin master && curl -X POST -d {} https://api.netlify.com/build_hooks/5e8d76821dc6e79fcdbe4dd9

