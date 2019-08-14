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
<script src="${pageContext.request.contextPath}/js/jquery-3.4.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/xadmin.js"></script>
<script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/cookie.js"></script>
<title>添加用户</title>
</head>
<body>
 <div class="x-nav">
            <span class="layui-breadcrumb">
                <a href="">首页</a>
                <a href="">演示</a>
                <a>
                    <cite>导航元素</cite></a>
            </span>
            <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
                <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i>
            </a>
        </div>
        
        <div class="layui-fluid">
           
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">用户添加</div>
                        <div class="layui-card-body ">
                           <form class="layui-form" action="${pageContext.request.contextPath}/add_user_submit" method="post"> 
							   
							   <div class="layui-form-item" > 
							    <label class="layui-form-label">账号</label>
							    <div class="layui-input-block">
							     <input type="text" id="accountNumber" autocomplete="off" name="accountNumber"  class="layui-input" lay-verify="required|accountNumber" >
							    </div>
							  </div>
							  
							  <div class="layui-form-item">
							    <label class="layui-form-label">性别</label>
							     <div class="layui-input-block">
							        <input type="radio" name="sex" value="男" title="男" checked>
							        <input type="radio" name="sex" value="女" title="女" >
							     </div>
							  </div>
							  
							  <div class="layui-form-item">
							    <label class="layui-form-label">生日</label>
							    <div class="layui-input-block">
							     <input class="layui-input" name="birthday" autocomplete="off" id="birthday" lay-verify="required"> 
							    </div>
							  </div>
							  
							  <div class="layui-form-item">
							    <label class="layui-form-label">昵称</label>
							    <div class="layui-input-block">
							     <input type="text" id="nickName" autocomplete="off" name="nickName" class="layui-input" lay-verify="required|nickName" >
							    </div>
							  </div>
							  
							  <div class="layui-form-item">
							    <label class="layui-form-label">电话号码</label>
							    <div class="layui-input-block">
							     <input type="text" id="phoneNumber" autocomplete="off" name="phoneNumber" class="layui-input" lay-verify="required" >
							    </div>
							  </div>
							  
							  
							  <div class="layui-form-item" style="display:none;">
							    <label class="layui-form-label">密码</label>
							    <div class="layui-input-block">
							     <input class="layui-input" name="password" id="password" lay-verify="required" type="password" value="123456"> 
							    </div>
							  </div>
							  
							  <div class="layui-form-item">
							    <div class="layui-input-block">
							      <button type="button" class="layui-btn tj" lay-submit lay-filter="entry">立即提交</button>
							      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
							    </div>
							  </div>
							</form>
                        </div>
                    </div>
                </div>
                
             </div> 
              
    </body>
    
<script>
var flag = false;

var an = 1;
var nn = 1;
$("#accountNumber").on('blur',function(){
	var accountNumber = $("#accountNumber").val();
	$.ajax({  
	    url:'${pageContext.request.contextPath}/findOnlyUser',
	    type:'get',
	    data:{accountNumber:accountNumber},
	    async: false,
	    success:function(data){
	    	
	    	if(data.flag == 1){
	    		flag = false;
	    	}else{
	    		flag = true;
	    		an = 2;
	    	}	
	    }
    });
	
});

$("#nickName").on('blur',function(){
	var nickName = $("#nickName").val();
	$.ajax({  
	    url:'${pageContext.request.contextPath}/findOnlyUser2',
	    type:'get',
	    data:{nickName:nickName},
	    async: false,
	    success:function(data){
	    	if(data.flag == 1){
	    		flag = false;
	    	}else{
	    		flag = true;
	    		nn = 2;
	    	}	
	    }
    });
	
});

$(".tj").click(function(){
	if(flag == true){
			$(".layui-form").submit();
	}else{
		if(an == 2){
			layui.use('layer', function(){
		  		var layer = layui.layer;
				  layer.open({
					  title: '提示' ,
					  content: '该账号已存在，请重新输入！'
					});     
				});
		}else if(nn == 2){
			layui.use('layer', function(){
		  		var layer = layui.layer;
				  layer.open({
					  title: '提示' ,
					  content: '该昵称已存在，请重新输入！'
					});     
				});
		}
		 
		

	}
})

layui.use(['form','laydate','layer'], function(){
	  var form = layui.form;
	  var laydate = layui.laydate;
	  var layer = layui.layer;
	  
	  laydate.render({
          elem: '#birthday' 
      });
	  
	  
	  
	  

	
	
		
});

layui.use(['form','layer'], function(){
	  var form = layui.form;

	  var flag="${flag}"
	  
		if(flag == 1){
			layer.alert("添加成功");
		}else if(flag == 3){
			layer.alert("添加失败");
		}
});

</script>
</html>