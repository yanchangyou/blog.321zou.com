---
layout: post
title: "博客的图标、统计、评论"
date: "2018-10-03 19:35:59 +0800"
author: "友"
---

博客除了改变主题外，其他三个附加功能也很重要：图标、统计、评论，下面依次说明.

## 图标
图标是一个网站必须品，但对于开发人员来说，做一个图标还是有难度的，于是网上找一个现成的是一条捷径.

以前发现一个图标网站，推荐给大家：[iconfont](http://www.iconfont.cn?_blank) ，按照关键字搜索想要图标，然后找到中意的图标就直接拿来用了，下载格式选择png，如果要做网站的icon，还要进一步处理，直接搜索“在线转换icon”，找到一个网站[easyicon](https://www.easyicon.net/covert/?_blank)不错，把图标上传转换为icon之后，添加到根目录，改名为：favicon.ico，刷新页面，页签上面就图标了.

### https问题
使用https时，会报icon加载错误，是因为加载icon的协议是http与https不一致，导致报错，需要修改源代码，把_layouts/default.html文件中的如下内容
```
<link rel="shortcut icon" href="{{site.url}}/favicon.ico">
```
改成
```
<link rel="shortcut icon" href="/favicon.ico">
```
刷新后，页面正常加载.

## 统计
网站统计也是需要的，博客写得好不好，看访问量就知道了.

单独开发一个统计功能是不现实的，幸好有很多现成的统计系统可以使用，网上一搜，找到百度统计，感觉还不错，注册账号后直接使用，注册地址：[百度统计](https://tongji.baidu.com?_blank)

注册完，登录后，进入管理界面，添加应用，添加完后，点击获取代码，就是一段js，这段js实现了统计功能，然后把这段js添加到
```
_layouts/default.html
```
中，就是实现了统计功能，很好用
```
<!-- 百度统计 -->
  <script>
    var _hmt = _hmt || [];
    (function() {
      var hm = document.createElement("script");
      hm.src = "https://hm.baidu.com/hm.js?uuid"; //uuid换成自己的
      var s = document.getElementsByTagName("script")[0];
      s.parentNode.insertBefore(hm, s);
    })();
  </script>
```
添加之后，通过点击【查看报告】就能查看到：PV、UV、IP、跳出率等一系列指标，为改进博客提供了重要的参考.

## 评论
评论也是博客的重要功能，为博主和读者之间提供了一条交流通道.

单独开发系统评论功能也是不现实的，幸好有好多专门做评论的系统，网上搜了几个，其他网站推荐：valine（缬氨酸），估计是化学专业的同学开发的，
注册后[valine](https://leancloud.cn/?_blank)，登录进入控制台，然后注册一个应用，就不像百度那样直接复制js了，网上搜索之后，在一个现成的网站上面，复制了他的源代码，然后把对应的appId和appKey换成【应用Key】里面对应字段；试了好一阵子，评论框终于出现了（复制代码不全，修改不全等等，下面弄了一个全的）.代码如下：
```

<!-- 评论 -->
<div class="comments" id="comments" style="margin-top: 70px;">
  <div id="vcomments"></div>
</div>
<script src="//cdn1.lncld.net/static/js/3.0.4/av-min.js"></script>
<script src="https://unpkg.com/valine/dist/Valine.min.js"></script>
<script>

  var GUEST = ['nick','mail','link'];
  var guest = 'nick,mail,link';
  guest = guest.split(',').filter(item=>{
    return GUEST.indexOf(item)>-1;
  });
  new Valine({
    el:'#comments',
    verify: false,
    notify: true,
    appId:'gs4XxRz1HG66wfK2k5su02D5-gzGzoHsz',
    appKey:'SfmoXDMrxNUPUHWIJIoHlsY8',
    placeholder:'说点...',
    avatar:'retro',
    guest_info:guest,
    pageSize:'10' || 10
  });
```
PS : 再次提醒修改appId和appKey，并且需要在后台【应用->安全中心->Web 安全域名】配置域名，否则会出现
```
Code 403: 访问被api域名白名单拒绝，请检查你的安全域名设置.
```
这样也好，不添加本地的，限制本地的应该就不算访问量.

再看看后，发现有访问数量限制，但是博客访问量不大，应该够用.

## 参考和资源
- [评论参考](https://www.bluelzy.com/?_blank)
- [iconfont](http://www.iconfont.cn?_blank)
- [easyicon](https://www.easyicon.net/covert/?_blank)
- [百度统计](https://tongji.baidu.com?_blank)
- [valine注册](https://leancloud.cn?_blank)
- [valine-github](https://github.com/xCss/Valine-docs/blob/master/source/index.md?_blank)
