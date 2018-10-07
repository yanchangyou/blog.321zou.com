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

echo ============run jekyll============
cd jekyll.321zou.com
git pull
cd ..

echo =============run hexo=============
cd hexo.321zou.com
git pull
cd ..

echo =============return back=============
cd ..
