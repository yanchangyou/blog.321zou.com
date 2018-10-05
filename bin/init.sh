#/bin/bash

echo =========create blog root dir==========
mkdir blog.321zou.com
cd blog.321zou.com

echo =============clone all git==============
git clone https://github.com/yanchangyou/blog.321zou.com
git clone https://github.com/yanchangyou/hexo-theme-next
git clone https://github.com/yanchangyou/hexo.321zou.com
git clone https://github.com/yanchangyou/jekyll.321zou.com

echo =============install hexo=============
cd hexo.321zou.com
npm install --save
cd ..

echo ===install jekyll-theme-cayman-blog=====
cd blog.max.top-min.top
gem install jekyll-theme-cayman-blog
cd ..

echo =============make sh=============
chmod +x blog.max.top-min.top/run.sh
chmod +x hexo.321zou.com/run.sh

echo ============run jekyll============
cd blog.max.top-min.top
./run.sh
cd ..

echo =============run hexo=============
cd hexo.321zou.com
./run.sh
cd ..
