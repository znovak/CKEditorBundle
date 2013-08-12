#!/bin/bash

# ===============================
# Run from root as bin/update.sh
# ===============================

clear
echo "Please enter Git-repo branch version (e.g. '4.1.x'):"
read VERSION

# ===============================
# Backup custom plugins
# ===============================

mkdir temp
cp -r Resources/public/ckeditor/plugins/cmslink temp/cmslink
cp -r Resources/public/ckeditor/plugins/showblocks temp/showblocks

# ===============================
# Fetch git version
# ===============================

rm -fr Resources/public/ckeditor
git clone git://github.com/ckeditor/ckeditor-releases.git Resources/public/ckeditor
cd Resources/public/ckeditor
git checkout $VERSION/standard
rm -fr .git*
rm -fr samples
cd ../../..

# ===============================
# Restore custom plugins
# ===============================

cp -r temp/cmslink Resources/public/ckeditor/plugins/cmslink
cp -r temp/showblocks Resources/public/ckeditor/plugins/showblocks
# rm -fr temp

