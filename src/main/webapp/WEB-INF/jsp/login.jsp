<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.4.0.min.js" charset="utf-8"></script>
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
<title>登录</title>
</head>
<body class="login-bg">
   <div class="login layui-anim layui-anim-up">
        <div class="message">CoopCode后台登录</div>
        <div id="darkbannerwrap"></div>
        
        <form method="post" class="layui-form" >
            <input name="name" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" >
            <hr class="hr15">
            <input name="pass" lay-verify="required" placeholder="密码"  type="password" class="layui-input">
            <hr class="hr15">
            <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
            <hr class="hr20" >
        </form>
    </div>
    
    <script>
        $(function  () {
        	layui.use('form', function(){
        		var form = layui.form;
        		form.on('submit(login)', function(data){
       				var url = '${pageContext.request.contextPath}/login_submit';
                  	var param = $(".layui-form").serialize();
                  	$.post(url, param, function (res) {
                          console.log(res.flag)
                  		  if(res.flag == 1){
                          	location.href='${pageContext.request.contextPath}/index';
                          }else{
                          	layer.alert('见到你真的很高兴', {icon: 6,timeout:5000});
                          	location.href='${pageContext.request.contextPath}/login';
                          }
                      });
            		});
        	});   	
        })        
    </script>
</body>
</html>