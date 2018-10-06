#/bin/bash

echo goto workspace
cd blog.321zou.com

echo ========update blog docs===========
cd blog.321zou.com
git pull
cd ..

echo ========init docs _posts===========
cp -r blog.321zou.com/docs/* jekyll.321zou.com/_posts
cp -r blog.321zou.com/docs/* hexo.321zou.com/source/_posts

echo ============run jekyll============
cd jekyll.321zou.com
bash run.sh
cd ..

echo =============run hexo=============
cd hexo.321zou.com
bash run.sh
cd ..

sleep 10

echo ========cp image to hexo========
cp -r blog.321zou.com/images hexo.321zou.com/public/

echo ========cp image to jekyll======
mkdir -p jekyll.321zou.com/images
cp -r blog.321zou.com/images jekyll.321zou.com/

cd ..
