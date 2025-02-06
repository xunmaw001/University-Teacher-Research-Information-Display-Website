<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <meta charset="UTF-8">
  <meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0' />
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>入口页</title>
  <link rel="stylesheet" href="./layui/css/layui.css">
  <link rel="stylesheet" type="text/css" href="./xznstatic/css/iconfont.css">
  <link rel="stylesheet" type="text/css" href="./xznstatic/css/color.css">
  <link rel="stylesheet" type="text/css" href="./xznstatic/css/global.css">
  <link rel="stylesheet" type="text/css" href="./xznstatic/css/page.css">
  <link rel="stylesheet" type="text/css" href="./xznstatic/css/uzlist.css">
  <link rel="stylesheet" type="text/css" href="./xznstatic/css/animate.min.css">
  <link rel="stylesheet" type="text/css" href="./xznstatic/css/fancybox.css" />
  <script type="text/javascript" src="./xznstatic/js/jquery.min.js"></script>
  <script type="text/javascript" src="./xznstatic/js/superslide.2.1.1.min.js"></script>
  <script type="text/javascript" src="./xznstatic/js/wow.min.js"></script>
  <script type="text/javascript" src="./xznstatic/js/fancybox.js"></script>
  <script type="text/javascript">
    var CATID = "0",
      BCID = "0",
      NAVCHILDER = "",
      ONCONTEXT = 0,
      ONCOPY = 0,
      ONSELECT = 0;
  </script>
  <script type="text/javascript" src="./xznstatic/js/common.js"></script>
</head>

<body scrolling="no" style="overflow-y: hidden;overflow-x: hidden;">
  <div id="top">
    <div id="header" class="header" style="font-size: 28px">
      <div class="container">
        <div class="logo fl">
          <div class="logo-img" v-text="projectName" ></div>
        </div>
        <div id="nav" class="nav nav-a fr" style="margin-right: 300px">
          <ul>
            <li class="on"><a style="color:#000000;font-size: 20px" href="javascript:navPage('./pages/home/home.jsp')">首页</a></li>
            <li v-for="(item,index) in indexNav" v-bind:key="index">
              <a style="color:#000000;font-size: 20px" :href="'javascript:navPage(\''+item.url+'\')'">{{item.name}}</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>

  <iframe src="./pages/home/home.jsp" id="iframe" frameborder="0" scrolling="auto" onload="changeFrameHeight()"></iframe>

  <script src="./layui/layui.js"></script>
  <script src="./js/vue.js"></script>
  <script src="./js/config.js"></script>

  <script>
    var vue = new Vue({
      el: '#top',
      data: {
        indexNav: indexNav,
        cartFlag: cartFlag,
        adminurl: adminurl,
        chatFlag: chatFlag,
        projectName: projectName
      },
      methods: {
        jump(url) {
          jump(url)
        },
        mounted: function() {
          this.bindClickOnLi();
        },
        bindClickOnLi() {
          let list = document.getElementsByTagName("li");
          for(var i = 0;i<list.length;i++){
            list[i].onclick = function(){
              $(this).addClass("on").siblings().removeClass("on");
            }
          }
        }
      }
    });

    layui.use(['element','layer'], function() {
      var element = layui.element;
      var layer = layui.layer;
    });


    // 导航栏跳转
    function navPage(url) {
      localStorage.setItem('iframeUrl', url);
      document.getElementById('iframe').src = url;
    }


    var iframeUrl = localStorage.getItem('iframeUrl');
    document.getElementById('iframe').src = iframeUrl;

    //  窗口变化时候iframe自适应
    function changeFrameHeight() {
      var nav = document.getElementById('nav').offsetHeight;
      var top = nav > 85 ? nav + document.getElementById('header').offsetHeight : 85;
      var ifm = document.getElementById("iframe");
      ifm.height = document.documentElement.clientHeight - top;
      ifm.width = document.documentElement.clientWidth;
      console.log(ifm.height)
    }

    // reasize 事件 窗口大小变化后执行的方法
    window.onresize = function() {
      changeFrameHeight();
    }
  </script>
</body>

</html>