<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>用户列表</title>
<style>
       
        #page_div{
        	float:right;}
       
    </style>
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
      <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" id="sreach_form" method="post">
          <input type="text" name="id" id="id" placeholder="请输入编号" autocomplete="off" class="layui-input">
          <input type="text" name="accountNumber"  id="accountNumber" placeholder="请输入账号" autocomplete="off" class="layui-input">
          <input type="text" name="nickName" id="nickName" placeholder="请输入昵称" autocomplete="off" class="layui-input">
          <button class="layui-btn"  type="button" lay-submit lay-filter="sreach" onclick="sreach()"><i class="layui-icon">&#xe615;</i></button>
        </form>
      </div>
      <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        
        <span class="x-right" style="line-height:40px"></span>
      </xblock>
      <table class="layui-table layui-form">
        <thead>
          <tr>
            <th>
             <input type="checkbox" id="checkall" lay-filter="checkalls"  name="checkall" lay-skin="primary">
            </th>
            <th>编号</th>
            <th>账号</th>
            <th>性别</th>
            <th>生日</th>
            <th>电话号码</th>
            <th>昵称</th>
            <th>积分</th>
            <th >操作</th>
            </tr>
        </thead>
        <tbody>
        	
        </tbody>
      </table>
      
     <div id="page_div"></div>
      

    </div>


  </body>
  <script>
    
	
    //分页处理
   	var total="${pageInfousers.total}";
   	var pageNum=1;
   	var pageSize=8;
	var shuliang = 8-(total%8);
	if(total%8 == 0){
		var page = total/8;
	}else{
		var page = parseInt(total/8)+1;
	}
	
	$(".x-right").html("共有数据:"+total+"条 共:"+page+"页");
	
	
	

		layui.use('laypage',function(){  
			   var laypage=layui.laypage;
			   
			   laypage.render({
			       elem: 'page_div',
			       count: total,
			       curr:pageNum,  
			       limit:pageSize, 
			       first: '首页',
			       last: '尾页',
			       theme:'#222222',
			       jump: function(obj, first){
			        	var currPage = obj.curr;
		
			        	var key="${key}";
			        	
			        	
			        	var id ="${id}";
			        	var accountNumber = "${accountNumber}";	
			        	var nickName = "${nickName}";
			        	
			        	
    	        	  	if(key!="flag"){
    	        	  		onSreach(obj.curr,id,accountNumber,nickName);
    	        	  	}else{
    	        	  		onShow(obj.curr);
    	        	  	} 
			       }
			   });
			         
			});
	
		
	sreach = function(){
		var id = $("#id").val();
		var accountNumber = $("#accountNumber").val();
		var nickName = $("#nickName").val();
		location.href = "${pageContext.request.contextPath}/user_select?id="+id+"&accountNumber="+accountNumber+"&nickName="+nickName; 
	}
	
	//条件模糊查询
	onSreach = function(page,id,accountNumber,nickName){
		
		$.ajax({  
		    url:'${pageContext.request.contextPath}/userslist',
		    type:'get',
		    data: {page:page,id:id,accountNumber:accountNumber,nickName:nickName},
		    async: false,
		    success:function(data){
		    	var tr = "";
		    	for(var i = 0;i<data.list.length;i++){
    				tr += "<tr>";
	    			tr += "<th><input type='checkbox' lay-filter='userId' class='checkd'  name='checkd' lay-skin='primary' value='"+data.list[i].id+"'></th>";
	    			tr += "<th>"+data.list[i].id+"</th>";
	    			tr += "<th>"+data.list[i].accountNumber+"</th>";
	    			tr += "<th>"+data.list[i].sex+"</th>";
	    			tr += "<th>"+data.list[i].birthday+"</th>";
	    			tr += "<th>"+data.list[i].phoneNumber+"</th>";
	    			tr += "<th>"+data.list[i].nickName+"</th>";
	    			tr += "<th>"+data.list[i].integral+"</th>";
	    			tr += "<td class='td-manage'>"+
					  	  	"<a title='编辑' >"+
				          		"<i class='layui-icon'>&#xe63c;</i>"+
				          	"</a>"+
				          	"<a title='删除'  onclick='del("+data.list[i].id+")'>"+
				          		"<i class='layui-icon'>&#xe640;</i>"+
				          	"</a>"+
			              "</td>"
	    			
	    			layui.jquery("tbody").html(tr);
	    			layui.use(['laydate','form'], function(){
	    			    var laydate = layui.laydate;
	    			    var  form = layui.form;
	    			    form.render("checkbox");
	    			});
    			}
		    }
	   });
	}
	
	//无条件查询
    onShow = function(page){
    	$.ajax({  
		    url:'${pageContext.request.contextPath}/userslist',
		    type:'get',
		    data: {page:page},
		    async: false,
		    success:function(data){
		    	var tr = "";
		    	for(var i = 0;i<data.list.length;i++){
    				tr += "<tr>";
	    			tr += "<th><input type='checkbox'  lay-filter='userId' class='checkd' name='checkd' lay-skin='primary' value='"+data.list[i].id+"'></th>";
	    			tr += "<th>"+data.list[i].id+"</th>";
	    			tr += "<th>"+data.list[i].accountNumber+"</th>";
	    			tr += "<th>"+data.list[i].sex+"</th>";
	    			tr += "<th>"+data.list[i].birthday+"</th>";
	    			tr += "<th>"+data.list[i].phoneNumber+"</th>";
	    			tr += "<th>"+data.list[i].nickName+"</th>";
	    			tr += "<th>"+data.list[i].integral+"</th>";
	    			tr += "<td class='td-manage'>"+
					  	  	"<a title='编辑' >"+
				          		"<i class='layui-icon'>&#xe63c;</i>"+
				          	"</a>"+
				          	"<a title='删除'  onclick='del("+data.list[i].id+")'>"+
				          		"<i class='layui-icon'>&#xe640;</i>"+
				          	"</a>"+
			              "</td>"
	    			
	    			layui.jquery("tbody").html(tr);
	    			layui.use('form', function(){
	    			    var  form = layui.form;
	    			    form.render("checkbox");
	    			});
    			}
		    }
	   });
	}
	
    var a=[];
    layui.use('form', function(){
	     form = layui.form;
	     //全选
	     form.on('checkbox(checkalls)', function (data) {
          var a = data.elem.checked;
          if (a == true) {
              $(".checkd").prop("checked", true);
              form.render('checkbox');
          } else {
              $(".checkd").prop("checked", false);
              form.render('checkbox');
          }
         // getid();
      });
	     
	  
	     form.on('checkbox(userId)', function (data) {
	    	 //有一个未选中全选取消选中
	    	 var item = $(".checkd");
             for (var i = 0; i < item.length; i++) {
                 if (item[i].checked == false) {
                     $("#checkall").prop("checked", false);
                     form.render('checkbox');
                     break;
                 } 
             }
            //如果都勾选了  勾上全选
             var  all=item.length;
             for (var i = 0; i < item.length; i++) {
                 if (item[i].checked == true) {
                     all--;
                 }
             }
             if(all==0){
                 $("#checkall").prop("checked", true);
                 form.render('checkbox');
             }
             //getid();
	     });  
	     
    });
    
   
    
    delAll=function (){
    	  var idArr=""
  		  $('input[name="checkd"]').each(function(){
  				if($(this).prop("checked")){
  					idArr=idArr+$(this).val()+",";
  				}
  		  });
  		 var ids = idArr.substr(0,idArr.length-1);
  		 console.log(ids)
  		 
  		 layer.confirm('确认要删除吗？',function(index){
	        	var url = '${pageContext.request.contextPath}/user_delAll';
	          	var param = {ids:ids};
	          	$.post(url, param, function (data) {
	          		if(data.flag == 1){
	          			layer.msg('删除成功！',{icon: 5,time:2000},function(){location.reload();});
	                  }else{
	                	layer.msg('删除失败！',{icon: 5,time:1000},function(){location.reload();});
	                  } 
	              });
	      		
	     });
	};
    
	
	//单个删除
	  function del(id){
      	var result =false;
      	layui.use(['form','layer'], function(){
              var  form = layui.form;
              var layer = layui.layer;
              layer.confirm('是否删除该用户', {icon: 6},function(index){
              	var url="${pageContext.request.contextPath}/del_submit";
          		var param={id:id};
          		$.get(url,param,function(data){
          			
          			if(data.flag == 1){
          				layer.msg('删除成功！',{icon: 5,time:2000},function(){location.reload();});
          				location.reload();
          			}
          		});
              });
      	});
      	 	
      }
</script>
<script>

      layui.use('form', function(){
        var laydate = layui.laydate;
        var  form = layui.form;
        form.render({
            elem: 'checkbox' //指定元素
          });
        
      });
</script>

 </html>