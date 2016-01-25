
if [ "$?" == "1" ]
then
	echo Usage $0 test_user
	exit -1
fi

if [ ! -d ~/wba1-2012-test ]
then
	echo
	echo CLONE ORIGINAL wba1-2012 to ~/wba1-2012-test
	echo
	git clone --bare https://github.com/fh-koeln/wba1-2012 ~/wba1-2012-test

	# Ensure we do not push this later!
	cd ~/wba1-2012-test
	git remote rm origin
fi

if [ ! -d ~/wba1-2012-test-$1/wba1-2012 ]
then
	echo
	echo CLONE ~/wba1-2012-test to ~/wba1-2012-test-$1/wba1-2012
	echo
	git clone ~/wba1-2012-test ~/wba1-2012-test-$1/wba1-2012
fi

# when this script is final we could create this also in an if ! -f block. But not yet ;-)
echo clear                                                    >  ~/wba1-2012-test-$1/git
echo                                                          >> ~/wba1-2012-test-$1/git
echo echo                                                     >> ~/wba1-2012-test-$1/git
if [ "$CLICOLOR" == "1" ]; then echo printf \\\\e\[1\\\;35m   >> ~/wba1-2012-test-$1/git; fi
echo echo "\"  git\"" \"\$\@\"   >> ~/wba1-2012-test-$1/git
if [ "$CLICOLOR" == "1" ]; then echo printf \\\\e[0m          >> ~/wba1-2012-test-$1/git; fi
echo echo                                                     >> ~/wba1-2012-test-$1/git
echo `which git` \"\$\@\"                                     >> ~/wba1-2012-test-$1/git
echo echo                                                     >> ~/wba1-2012-test-$1/git

chmod a+x ~/wba1-2012-test-$1/git

clear
echo
echo Fake git repo wba1-2012 for user $1
echo

cd ~/wba1-2012-test-$1/wba1-2012

export "PATH=~/wba1-2012-test-$1:$PATH"
export "PS1=\\W $1\\$ "
bash
