---
layout: post
title: "如何用jekyll写博客"
date: "2018-10-02 15:34:03 +0800"
author: "友"
---

## 前言
上一篇介绍了[如何用github写博客](/2018/10/01/2018-10-01-writeblogwithgithub.html)，github后台会生成静态文件内容，而这个生成静态文件的功能就是由jekyll完成，而且jekyll可以本地安装，下面就讲解如果搭建本地环境.

### 效果
![整体效果](https://raw.githubusercontent.com/yanchangyou/blog.321zou.com/master/images/2018-10-02-jekyll-dev-env.jpg)

<!-- more -->

### 原理
jekyll将markdown文件转换为html文件(类似于java里面的freemarker）

jekyll使用ruby开发，ruby使用gem管理软件包（类似于java里面的maven）

## 安装
安装
```
# 安装jekyll的开发语言ruby，ruby中自带gem
brew install ruby  # macos
# yum install ruby # linux ruby版本要>=2.1;  详细说明见末尾部分
# 需要安装，不安装报错
gem install bundler

# 安装jekyll
gem install jekyll

```
### 使用
安装完成之后，就可以使用jekyll创建博客空间，然后启动服务，通过浏览器访问，默认路径是：http://127.0.0.1:4000/

```
jekyll new blogName
cd blogName
jekyll server
```
访问[http://127.0.0.1:4000/](http://127.0.0.1:4000/?_blank)

### 首次尝试
新建first-blog.md，然后看看有没有效果，访问http://127.0.0.1:4000/first-blog 出现404，访问http://127.0.0.1:4000/first-blog.md 是原始文件；
尝试多种方法都不行，最后网上查找相关资料，最后弄懂是怎么回事

## jekyll特点
- 文件命名规则
  - 默认只能识别：yyyy-MM-dd-title.md这种格式
  - 识别后才会转换为静态html
  - 才会在首页展示
- 目录规则
  - _posts : 博客编写目录，默认生成一个xxx-welcome-to-jekyll.markdown
  - _layouts : 页面模板目录
  - _site : 生成的静态文件目录
- 特殊文件
  - _config.yml ： 整个网站的配置
  - Gemfile : 类似于 pom.xml文件，配置jekyll的依赖包

### 模板引擎
打开默认生成的xxx-welcome-to-jekyll.markdown文件，分析结构
- header部分： 配置了整个页面的属性对
  - layout: post（布局模式： post:博客，home：首页）
  - title： 标题
  - date: 日期，目录结构: 年/月/日/title
  - categories: 博客存放的顶级目录，然后在按照 年/月/日/title子目录
- body部分：博客正文
  - 静态部分：文本
  - 动态部分：脚本，{% raw %}开始{% highlight ruby %}内容{% endhighlight %}{% endraw %}结束

### 测试
在yyyy-MM-dd-first-page.md的header部分添加
```
---
layout: post
---
```
再次从首页访问，发现样式已经装配上了

### 要点
一篇博客要想正确渲染出来，需要下面两个要点
- 文件名： yyyy-MM-dd-title.md
- header部分： 要添加layout设置

### 主题定制
在[github主题](https://github.com/pages-themes?_blank)中，存放默认主题，选择喜欢的主题，每个主题有使用说明，我的操作步骤先全部复制过去，再微调
1. 下载主题：
```
git clone https://github.com/pages-themes/cayman
```
1. 复制主题：把所有内容复制到原来的博客目录
1. 安装依赖：
```
gem install jekyll-theme-cayman-blog
```
1. 重启动
```
jekyll s
```

然后刷新页面，主题页面已经换了，最初写的first-blog已经使用了新主题

## 集成
### atom集成
上面都是在命令行下面操作，比较麻烦，github的atom编辑器，有jekyll插件，安装上后，就可以在atom进行编写博客、预览博客，默认每次保存都会生成静态页面，方便预览； 并atom与github集成很好，方便git提交

具体操作
- 安装：菜单->Packages->Settings view->Install Packages/Schemas 搜索包：jekyll，然后点击安装
- 使用：菜单->Packages->Jekyll->Toggle Server（启停服务）、New Post（新建博客）、其他功能

### 与github集成
把github项目clone下来之后，把本地博客内容全部复制进去，然后右下角提交，这样github和本地就是相同效果

## 常见问题和解决
- jekyll 修改域名和端口：
```
jekyll s -w --host=0.0.0.0 --port 8000
```
- _config.yml: 此文件中的变量是 site.varName 在博客中引用
- _layouts: 中定义了很多变量，可以在_config.yml和博客的header部分配置开关等, 其中site.github是github集成相关，可以修改源码让本地效果和github效果一致
- 访问统计：在百度统计申请、注册一个网站，复制统计js到 _layouts/default.html中，然后就可以查看网站访问统计
- Gemfile : 可以配置国内的镜像快，source 'https://gems.ruby-china.com'
- ruby源码安装：[安装说明](http://rensanning.iteye.com/blog/1927921?_blank),把里面版本换成2.3.7
  - [问题1解决](https://stackoverflow.com/questions/21498868/install-openssl-support-for-self-compiled-ruby-installation?_blank)
  - 问题2解决：
  ```
  cd /usr/local/include/ruby-2.3.0 && ln -s . include
  ```
- 定制域名：微信会对没有注册的域名屏蔽，影响显示效果，需要使用一个注册的域名中转，并且保留原来的域名，没有注册的域名可以联系我帮你中转
- ruby的日期格式（%Y-%m-%d %H:%M:%S），java（yyyy-MM-dd HH:mm:ss）
- 新窗口打开链接，直接写html，添加
```
target="_blank"
```
```
<a href="/2018/10/01/writeblogwithgithub.html" target="_blank">如何用github写博客</a>
```

### ruby yum安装
默认安装是2.0，但是需要jekyll需要2.1以上，源码按照依赖比较麻烦，使用yum安装,下面安装jekyll时，报缺少config.h的错误，换成源码安装，见下面
```
yum install centos-release-scl-rh
yum install rh-ruby22 -y
scl enable rh-ruby22 bash
ruby -v
```
### ruby源码安装
版本：2.3.6
```
wget https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.6.tar.bz2
tar -xjf ruby-2.3.6.tar.bz2
cd ruby-2.3.6
./configure && make && make install
```

## 总结
总结以下步骤
1. 安装jekyll
1. 生成博客空间
1. 安装主题
1. 与github集成
1. 与atom集成：编写->预览->提交->查看->分享
1. 处理微信域名屏蔽
1. 微调、优化、改进

## 参考
- [jekyll中文站](https://www.jekyll.com.cn/?_blank)
- [github教程](https://help.github.com/articles/adding-a-jekyll-theme-to-your-github-pages-site/?_blank)
- [jekyll 部署](https://blog.csdn.net/uselym/article/details/73608638?_blank)
- [jekyll语法介绍](https://www.cnblogs.com/strick/p/5484779.html?_blank)
- [使用Jekyll搭建自己的博客](https://www.jianshu.com/p/c04475ba80e4?_blank)
- [jekyll服务可以在局域网中访问](https://www.jianshu.com/p/650b96306013?_blank)
- [ruby安装](http://www.runoob.com/ruby/ruby-installation-unix.html?_blank)
- [ruby安装问题解决](http://rensanning.iteye.com/blog/1927921?_blank)
- [Gemfile文件](https://www.cnblogs.com/lwh-note/p/9177726.html?_blank)
- [新窗口打开链接1](https://blog.csdn.net/so_geili/article/details/53025317?_blank)
- [新窗口打开链接2](https://blog.csdn.net/gao497278979/article/details/52089399?_blank)
