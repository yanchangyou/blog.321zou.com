#/bin/bash

echo ========goto workspace==========
cd blog.321zou.com

echo ========update all===========
./blog.321zou.com/bin/update.sh

echo ========goto workspace==========
cd blog.321zou.com

echo ============run jekyll============
cd jekyll.321zou.com
bash run.sh
cd ..

echo =============run hexo=============
cd hexo.321zou.com
bash run.sh
cd ..

echo =============return back=============
cd ..
