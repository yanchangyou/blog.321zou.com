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

echo =============run=============
./blog.321zou.com/bin/run.sh
