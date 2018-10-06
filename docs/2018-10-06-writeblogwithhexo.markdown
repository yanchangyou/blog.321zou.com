---
layout: post
title: "如何用hexo写博客"
date: "2018-10-06 12:24:05 +0800"
tags: blog
author: "友"
---

## 原理
hexo使用node开发，使用node进行markdown文件解析，生成html文件.

## 安装
先安装node，然后安装hexo，命令如下
```
yum install nodejs
node -v

# 安装极慢，切换镜像
npm set registry https://registry.npm.taobao.org
npm install hexo -g  
```

### 加速
使用国内的镜像安装更快，
- os安装包镜像 : https://opsx.alibaba.com/mirror 找到对应的os,点击后面的帮助连接，按照说明进行配置（阿里云服务器默认已经配置好）
- node国内镜像： https://npm.taobao.org/

## 使用
```
# 初始化目录
hexo init myblog
cd myblog
hexo s --debug
```
然后启动完成之后会出现链接：http://localhost:4000/ ，访问链接就会出现星空背景的博客，第一篇博客讲解了快速上手指南

然后通过分析默认生产的markdown文件（source/_posts/hello-world.md），就是原生的markdown文件，很简单.

查看网页有新建博客的说明，按照操作很容易上手，这里不过多解释，更多见官方中文文档，里面有详尽的讲解：https://hexo.io/zh-cn/  （PS：据说是台湾的同学开发的），后面重点讲解附件功能：图标、统计、评论.

## 主题
这里推荐Next，地址 https://github.com/theme-next/hexo-theme-next
```
cd themes
yum install git -y
git clone https://github.com/theme-next/hexo-theme-next
cd ..
vi _config.yml   #然后把theme改成 hexo-theme-next (大概在75行左右)
# 保存之后，重启
hexo s --debug
```
重新刷新浏览器，网页主题以及换好，上面修改配置文件:_config.yml，更多说明见官网：https://hexo.io/zh-cn/docs/configuration

## 图标
找图标位置，themes/hexo-theme-next/source/images/，里面有下面两种型号
- favicon-16x16-next.png
- favicon-32x32-next.png

进入网站[iconfont](http://www.iconfont.cn?_blank)，定制好大小，然后下载，把图标放进去（之前说要转换，看不转换也行），刷新页面，图标已改变.

## 统计
### 百度
统计方面hexo做的比较好，已经集成了百度，直接配置属性就开启，打开主题hexo-theme-next配置文件：_config.yml（注意不是hexo的配置文件），搜索baidu_analytics，添加自己的uuid
```
theme.baidu_analytic: uuid
```
刷新页面，F12查看时已经有百度请求：https://hm.baidu.com/hm.gif?xxx，说明已经安装成功了

### busuanzi
相同的位置，开启busuanzi功能，搜索busuanzi，把enable的false改成true
```
busuanzi_count:
  enable: true
  total_visitors: true
  total_visitors_icon: user
  total_views: true
  total_views_icon: eye
  post_views: true
  post_views_icon: eye
```
## 评论
相同方法，搜索valine， 然后配置好appId和appKey，注意缩进
```
valine:
  appId: gs4XxRz1HG66wfK2k5su02D5-gzGzoHsz
  appKey: SfmoXDMrxNUPUHWIJIoHlsY8
```
从上面可以看出，hexo做了很多博客相关的集成，用起来很方便，点赞.
