#!/bin/bash
linode show $1 | grep ips | cut -c11-30
