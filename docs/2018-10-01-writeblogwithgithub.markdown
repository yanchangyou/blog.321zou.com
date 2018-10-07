---
layout: post
title: "如何用github写博客"
date: "2018-10-01 23:51:13 +0800"
author: "友"
---

### 原理
提交markdown文件到github后，github的后台程序将markdown文件转换为html静态页面，然后通过github.io对外提供服务，并且可以配置个性化域名

<!-- more -->

### 操作
整体步骤：新建项目->配置分支->配置风格->新建md文件->预览效果，详细步骤如下:
1. 在github.com上面：[新建项目](https://github.com/new?_blank)，强烈建议勾选： Initialize this repository with a README
1. 在上面页签的项目Settings->GitHub Pages中把Source设置为master branch，Save之后，会再相邻位置处理一个新URL，此时访问是404
1. 在相同位置，点击[Choose a schema]按钮配置主题，再次访问，网页就出现了
1. 点击[Create new file]按钮，添加新的markdown文件（md后缀名），github.io预览查看，注意路径名要去掉文件后缀md，才能查看转换后的html文件

### 变化
项目文件中自动生成了_config.yml文件，这个是核心文件，缺少它就不生效，里面有很多配置属性：作者、网页说明、日期格式、_layouts中的变量（以site开头的变量）

### 待续
1. 新增的博客如何在首页自动显示？
1. 在github网页上操作不方便预览，如何搭建本地环境？
1. 如何调整网页风格？
1. 底层使用了哪些技术？
1. 有哪些常见问题？

答案就在：
[如何用jekyll写博客](/2018/10/02/2018-10-02-writeblogwithjekyll.html)
