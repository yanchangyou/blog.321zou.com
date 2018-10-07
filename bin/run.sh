#/bin/bash

echo goto workspace
cd blog.321zou.com

echo ========update blog docs===========
cd blog.321zou.com
git pull
cd ..

echo ========update theme===========
cd hexo-theme-next
git pull
cd ..

echo ========init docs _posts===========
cp -r blog.321zou.com/docs/* jekyll.321zou.com/_posts
cp -r blog.321zou.com/docs/* hexo.321zou.com/source/_posts

echo ========init site ===========
cp -r blog.321zou.com/site/* jekyll.321zou.com/
cp -r blog.321zou.com/site/* hexo.321zou.com/source/

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
