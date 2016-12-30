initial_step.sh
---
- Make `initial_setup.sh`
```
#!/bin/bash
echo 'Acquire::ForceIPv4 "true";' | sudo tee /etc/apt/apt.conf.d/99force-ipv4
sudo apt-get update
sudo apt update
```
- `chmod 755 initial_script.sh`
- `./initial_script.sh`



Install the Markdown Editor called Typora on Ubuntu 16
---
- Make `install_typora.sh`
```
#!/bin/bash
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
sudo add-apt-repository 'deb https://typora.io linux/'
sudo apt update && sudo apt install typora
sudo apt -f -y install
sudo apt update && sudo apt install typora
sudo apt install -y libnss3-dev
```
- `chmod 755 install_typora.sh`
- `./install_typora.sh`
- Sources:
[http://www.omgubuntu.co.uk/2016/09/typora-stylish-minimal-markdown-editor-now-available-ubuntu](http://www.omgubuntu.co.uk/2016/09/typora-stylish-minimal-markdown-editor-now-available-ubuntu)

Make some doc files that will be concatenated in order
---
- Make `s001.md` and `s002.md` and `s003.md` etc.
- Put some simple markdown into these files.

Make a documentation build script to concatenate markdown into one big README.md
---
- Make `rebuild.sh`
```
#!/bin/sh
rm -rf README.md
for filename in s*.md; do
	#If you want to show the filenames above each section, do the following 2 lines:
	#echo "${filename}"
	#echo "==="
	cat "${filename}"
	echo
	echo
done > README.md
more README.md
```
- `chmod 755 rebuild.sh`
- `./rebuild.sh`

Create view.sh
---
- Create `view.sh`, if you have a UI available.
```
#!/bin/bash
typora README.md &
```
- `chmod 755 view.sh`
- `./view.sh`

Make sure that the Linode CLI is installed.
---
- `su - root`, if you are not already logged in as root.
- Make a file called `install_linode-cli.sh`:
```
#!/bin/bash
#add repo
sudo echo "deb http://apt.linode.com/ stable main" > /etc/apt/sources.list.d/linode.list
#get gpg signature
sudo wget -O- https://apt.linode.com/linode.gpg | sudo apt-key add -
#update
sudo apt update
#(re)install linode-cli
sudo apt remove -y linode-cli
sudo apt install -y linode-cli
linode --help
```
- `chmod 755 install_linode-cli.sh`
- `./install_linode-cli.sh`
- `exit` (if you were su'd into root)

Set your Linode credentials
---
- `sudo apt install -y git`
- `git clone https://github.com/gist-bucket-head/ivorytowers.git`
- `cd ivorytowers/bin`
- `./setLinodeCreds.sh`
- This creates folder `.linodecli` with a file `config` within that looks (something) like this:
```
api-key 5555555555555555555555555555555555555555555555555555555555555555
```
- Test it: `linode list`

createIvory.sh
---

- Make `createIvory.sh`:
```
#!/bin/bash
if [ $# -ne 1 ]; then
  echo "Illegal number of arguments. Usage:    ./createIvory.sh 4096"
  exit
fi
SIZE=$1
echo "Building Linode ${SIZE}..."
BIRTHNAME=`date +%s%N | cut -b1-13`
sleep 1
CHRISTIANNAME=`date +%s%N | cut -b1-13`
linode create ivory$BIRTHNAME --plan "Linode "$SIZE --distribution "Ubuntu 16.04 LTS" --datacenter newark --group IvoryTower
linode -o ivory$BIRTHNAME -a rename --label ivory$BIRTHNAME --new-label ivory$CHRISTIANNAME
linode -a show --label ivory$CHRISTIANNAME
```
- `chmod 755 createIvory.sh`

Create a Linode programmatically
---
- `./createIvory.sh 4096`
- `linode list`
- `linode show <linode-label>`

SSH over to the new machine
---
- `ssh root@<ip address>`

