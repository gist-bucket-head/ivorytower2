#!/bin/bash
rm -rf s1.sh && wget --output-document s1.sh --no-cache --no-cookies --no-http-keep-alive https://raw.githubusercontent.com/gist-bucket-head/ivorytowers/master/s1.sh?`date +%s` && chmod 755 s1.sh && ./s1.sh
