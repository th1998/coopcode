<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="${pageContext.request.contextPath}/js/cookie.js"></script>
<title>参赛人员录入</title>
</head>
<body>
        <div class="layui-fluid">
           
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">参赛选手录入</div>
                        <div class="layui-card-body ">
                           <form class="layui-form"> 
							  <div class="layui-form-item">
							    <label class="layui-form-label">语言</label>
							    <div class="layui-input-block">
							      <select id="languageId" name="languageId">
							        <c:forEach items="${language}" var="item">
										<option value="${item.id}">${item.language}</option>
									</c:forEach>
							      </select>
							    </div>
							  </div>
							  <div class="layui-form-item">
							    <label class="layui-form-label">题目</label>
							    <div class="layui-input-block">
							      <input type="text" id="title" name="title" value="${in.title}" placeholder="请输入" autocomplete="off" class="layui-input" lay-verify="required" >
							    </div>
							  </div>
							  
							  <div class="layui-form-item layui-form-text">
							    <label class="layui-form-label">内容</label>
							    <div class="layui-input-block">
							      <textarea placeholder="请输入内容" class="layui-textarea"  name="content" id="content" lay-verify="required" ></textarea>
							    </div>
							  </div>
							  
							  <div class="layui-form-item">
							    <label class="layui-form-label">难度</label>
							    <div class="layui-input-block">
							      <input type="text" id="difficulty" name="difficulty" value="${in.difficulty}" placeholder="请输入" autocomplete="off" class="layui-input" lay-verify="required" >
							    </div>
							  </div>
							  <input type="text" id="id" name="id" value="${in.id}" autocomplete="off" class="layui-input" lay-verify="required" style="display:none;">
							  
							  <div class="layui-form-item">
							    <div class="layui-input-block">
							      <p class="layui-btn" lay-submit lay-filter="entry">立即提交</p>
							      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
							    </div>
							  </div>
							</form>
                        </div>
                    </div>
                </div>
                
                
                
    </body>
    
    <script>
    $("select[name=languageId]").val('${in.languageId}');
    
	var str ="${in.content}"
	
	$("textarea[name=content]").val(str);
	layui.use(['form','layer'], function(){
  var form = layui.form;
	
  //异步提交表单
  form.on('submit(entry)', function(data){
     var url = '${pageContext.request.contextPath}/update_submit';
     var param = $(".layui-form").serialize();
     $.post(url, param, function (res) {
        if(res.flag == 1){
        	layer.msg(res.content, {icon: 1});
        }else{
        	layer.alert(res.content, {icon: 2});
        }
         
     });
    });
});
</script>
</html>