<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.4.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/xadmin.js"></script>
<script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/cookie.js"></script>
<title>语言列表</title>
</head>
<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">用户管理</a>
        <a>
          <cite>列表元素</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
    </div>
   <div class="x-body">
   		<blockquote class="layui-elem-quote" style="height:30px;">
            <form class="layui-form layui-col-md12 x-so" >
      			<input type="text" name="language" id="language" placeholder="请输入语言" autocomplete="off" class="layui-input">
        		<button class="layui-btn" type="button" onclick="add_language()"><i class="layui-icon"></i>添加</button>
      			<span class="x-right" style="line-height:40px;float:right;"></span>
      		</form>
      		 
        </blockquote>
 
    
      <div style="height:100%;">
            
            <div class="layui-field-box">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        
                            <div class="layui-carousel x-admin-carousel x-admin-backlog" lay-anim="" lay-indicator="inside" lay-arrow="none" style="width: 100%; height: 500px;">
                                <div carousel-item="">
                                    <ul class="layui-row layui-col-space10 layui-this" id="kk">
                                        
                                    </ul>
                                </div>
                            </div>
                        
                    </div>
                </div>
            </div>
        </div>                          
                                
     
      </div>
</body>
<script>
$.ajax({
	url:'${pageContext.request.contextPath}/getAllLanguage',
    type:'get',
    async: false,
    success:function(data){
    	$('.x-right').html("共有语言："+data.length+" 种");
    	for(var i=0;i<data.length;i++){
    		$("#kk").append('<li class="layui-col-xs2" >'+
                                      '<a href="javascript:;" class="x-admin-backlog-body">'+
                                            '<h3>语言<span style="float:right; font-size:16px;" onclick="del('+data[i].id+')">x</span></h3>'+
								            '<p>'+
								                '<cite>'+data[i].language+'</cite></p>'+
								        '</a>'+
								    '</li>');
    	}
    }
})


function add_language(){
	var language = $("#language").val();
	$.ajax({
		url:'${pageContext.request.contextPath}/add_language',
	    type:'get',
	    async: false,
	    data:{language:language},
	    success:function(data){
	    	if(data.flag == 1){
	    		layui.use(['form','layer'], function(){
	    			 var  form = layui.form;
	                 var layer = layui.layer;
	                 layer.msg('添加成功！',{icon: 1,time:2000},function(){location.reload();});
	    		})
	    	}else{
	    		layui.use(['form','layer'], function(){
	    			 var  form = layui.form;
	                 var layer = layui.layer;
	                 layer.msg('添加失败！',{icon: 2,time:2000},function(){location.reload();});
	    		})
	    	}
	    }
	});
}

function del(id){
	$.ajax({
		url:'${pageContext.request.contextPath}/del_language',
	    type:'get',
	    async: false,
	    data:{id:id},
	    success:function(data){
	    	if(data.flag == 1){
	    		layui.use(['form','layer'], function(){
	    			 var  form = layui.form;
	                 var layer = layui.layer;
	                 layer.msg('删除成功！',{icon: 1,time:2000},function(){location.reload();});
	    		})
	    	}else{
	    		layui.use(['form','layer'], function(){
	    			 var  form = layui.form;
	                 var layer = layui.layer;
	                 layer.msg('删除失败！',{icon: 2,time:2000},function(){location.reload();});
	    		})
	    	}
	    }
	});
}
</script>
</html>