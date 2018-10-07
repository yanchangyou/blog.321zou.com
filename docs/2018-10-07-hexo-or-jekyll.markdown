---
layout: post
title: "选择hexo，还是jekyll？"
date: "2018-10-07 20:25:25 +0800"
author: "友"
categories: blog
type: "tags"
tags:
  - blog
  - hexo
  - jekyll
---

应该选择hexo还是jekyll？ 我们先看对比，对比完之后，就能更好的选择.

## 对比
hexo和jekyll多角度对比：

|   比较内容    |    hexo    |    jekyll    |   备注  |
|--------------|-----------|--------------|--------------|
|  语言 | node | ruby | node比ruby更流行 |
|  安装 | yum等默认安装 | 源码安装 |   |
|  文件名前缀 | 无要求 | 日期开头 |   |
|  文件名后缀 | md 或者 markdown | markdown |   |
|  主题 | 丰富，直接可用 | 较少，需要改造 |  |
|  atom集成 | 简单 | 功能完善 | |
|  图标 | 替换文件 | 添加文件| |
|  统计 | 开关控制 | 添加代码 |   |
|  评论 | 开关控制 | 添加代码 |  |
|  搜索 | 开关控制 | ？ | |
|  活跃度| 高   | 低|  |
|  功能 | 丰富 | 简陋 | hexo把能想到的基本都加上了 |
| 多语言 | 支持 | 不支持| |
| 目录结构 | 划分清晰 | 不是很清晰|很容易切换主题等|

以上除了atom插件集成上，jekyll优于hexo，其他方面都不占优势，相信有了自己的选择.

## 不足
说完hexo的优点，再说说hexo的缺点（或许是建议）
- 图片支持，插入图片要安装图片插件
- 主题不能指定目录，source可以指定目录
暂时遇到以上两点

## 改进
- 图片：使用http开通完整URL，不使用相对路径
- 主题目录：使用linux的链接文件，这样可以自由切换，同时避免不同git混杂在一起

## 尝试
怎么同时支持hexo和jekyll？

通过对比，hexo和jekyll还是有许多不同，要想把他们集成在一起，还是要花费一些功夫，下面是给出的解决方法
- markdown文件命名：使用jekyll的规则，hexo使用原生文件名，但jekyll去掉了年月日的前缀，于是需要修改jekyll静态文件生成规则，添加上年月日，修改jekyll的_config.yml文件，内容如下
```
permalink: /:categories/:year/:month/:day/:year-:month-:day-:title:output_ext
```
- 文件同步： 添加启动shell脚本，在脚本中通过复制文件实现文件同步（尝试过链接文件，发现更新之后，不会自动生成静态文件，导致页面不刷新）
- 自动化： hexo和jekyll的目录中分别添加启动命令，外面脚本调用
- 个性化： 去掉框架中的个性化处理，如jekyll的嵌入脚本写法
- 端口分配： hexo使用4100，jekyll使用3100，避免和原始冲突
- 域名分配： 分别以hexo、jekyll作为域名开头部分
- 随机访问： 内部nginx的使用反向代理随机指向jekyll或hexo，但是他们之间非博客内容部分连接不一样，只能按照ip_hash来随机分配，保证同一个人是完整的，配置如下：
```
upstream random {
    ip_hash;
    server localhost:3100;
    server localhost:4100;
}
server {
     listen       80;
     server_name random.321zou.com;

     location / {
         proxy_pass http://random;
     }
}
```

## 集成
最终集成了成文件结构如下：（github地址见：[blog.321zou.com](https://github.com/yanchangyou/blog.321zou.com) ）
```
└── blog.321zou.com
    ├── blog.321zou.com
    │   ├── bin
    │   ├── docs
    │   ├── images
    │   └── site
    ├── hexo-theme-next
    │   ├── _config.yml
    ├── hexo.321zou.com
    │   ├── _config.yml
    │   ├── run.sh
    ├── jekyll.321zou.com
    │   ├── _config.yml
    │   ├── run.sh
```
blog.321zou.com目录说明：
- docs：里面是博客内容，这些博客在github也能查看
- images：存储图片，方便博客里面引用，注意引用url是
```
https://github.com/yanchangyou/blog.321zou.com/blob/master/images/2018-10-02-jekyll-dev-env.jpg?raw=true
#而不是
https://raw.githubusercontent.com/yanchangyou/blog.321zou.com/master/images/2018-10-02-jekyll-dev-env.jpg
#前面写法兼容性更好
```
- site：存储了about，联系等站点相关内容
- bin：集成初始化、启动、更新执行脚本
hexo.321zou.com和jekyll.321zou.com中有分别的启动脚本，这样能统一控制

## 心得
- 分离：内容和形式，markdown是内容，hexo和jekyll是形式，他们应该分离
- 个性化：在兼容两种框架时，可以去掉个性化内容，达到最大程度通用
- 扩展：当框架不支持时，可以通过其他途径，比如shell脚本解决
- 完整：提供完整命令支持，实现：初始化、启动、更新、定时更新一条龙服务
