#/bin/bash

echo =========create blog root dir==========
mkdir blog.321zou.com
cd blog.321zou.com

echo =============clone all git==============
git clone https://github.com/yanchangyou/blog.321zou.com
git clone https://github.com/yanchangyou/hexo-theme-next
git clone https://github.com/yanchangyou/hexo.321zou.com
git clone https://github.com/yanchangyou/jekyll.321zou.com

echo ===install jekyll-theme-cayman-blog=====
cd jekyll.321zou.com
gem install jekyll-theme-cayman-blog
cd ..

echo =============init dir=============
mkdir -p jekyll.321zou.com/_posts
mkdir -p hexo.321zou.com/source/_posts

echo ============run jekyll============
cd jekyll.321zou.com
bash run.sh
cd ..

echo =============run hexo=============
cd hexo.321zou.com
bash run.sh
cd ..

echo ========init docs _posts===========
cp -r blog.321zou.com/docs/* jekyll.321zou.com/_posts
cp -r blog.321zou.com/docs/* hexo.321zou.com/source/_posts

echo ========init site ===========
cp -r blog.321zou.com/site/* jekyll.321zou.com/
cp -r blog.321zou.com/site/* hexo.321zou.com/source/

echo =============return back=============
cd ..
