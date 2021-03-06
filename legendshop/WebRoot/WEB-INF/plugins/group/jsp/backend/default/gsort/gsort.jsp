<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common/back-common.jsp"%>
<%@ include file="/WEB-INF/pages/common/taglib.jsp"%>
<%@ taglib uri="/WEB-INF/tld/auth.tld" prefix="auth"%>
<%@ taglib uri="/WEB-INF/tld/options.tld" prefix="option"%>
<html>
<head>
<script src="<ls:templateResource item='/common/js/jquery.js'/>"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/common/js/jquery.validate.js"
	type="text/javascript"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/common/default/css/errorform.css" />
<title>创建商品类型</title>
</head>
<body>
	<script language="javascript">
  $.validator.setDefaults({
	});
 $(document).ready(function() {
	$("#sortForm").validate({
		rules: {
			sortName:  "required",
			 seq: {
              number: true
            }
    //,
	//		file: {
	//			required: "#pictureName:blank"
	//		}
		},
		messages: {
			sortName: "请输入类型",
			seq: {
                number: "请输入数字"
            },
			file:"请上传商品类型图片"
		}
		});
    $("#col1 tr").each(function(i){
	      if(i>0){
	         if(i%2 == 0){
	             $(this).addClass('even');
	         }else{    
	              $(this).addClass('odd'); 
	         }   
	    }
	     });   
	         $("#col1 th").addClass('sortable');
		
	});
</script>
	<form action="${pageContext.request.contextPath}/admin/gsort/save"
		id="sortForm" method="post" enctype="multipart/form-data">
		<table class="${tableclass}" style="width: 100%">
			<thead>
				<tr>
					<td><a href="<ls:url address='/admin/index'/>"
						target="_parent">首页</a> &raquo; 团购管理 &raquo; <a
						href="${pageContext.request.contextPath}/admin/gsort/query">类型管理</a>
						&raquo; 创建商品类型</td>
				</tr>
			</thead>
		</table>
		<table class="${tableclass}" style="width: 100%" id="col1">
			<thead>
				<tr class="sortable">
					<th colspan="2">
						<div align="center">
							<c:choose>
								<c:when test="${not empty sort}">修改类型</c:when>
								<c:otherwise>创建类型</c:otherwise>
							</c:choose>
						</div>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td width="30%"><div align="center">
							类型：<font color="#ff0000">*</font>
						</div></td>
					<td width="70%"><input type="text" name="sortName"
						id="sortName" size="30" value="${sort.sortName}"> <input
						id="sortId" name="sortId" value="${sort.sortId}" type="hidden">
					</td>
				</tr>
				<tr>
					<td width="30%"><div align="center">次序(必须为数字)：</div></td>
					<td width="70%"><input type="text" name="seq" id="seq"
						size="30" value="${sort.seq}"></td>
				</tr>
				<tr>
					<td width="30%"><div align="center">Header菜单：</div></td>
					<td width="70%"><select id="headerMenu" name="headerMenu">
							<option:optionGroup type="select" required="true" cache="true"
								beanName="YES_NO" selectedValue="${sort.headerMenu}" />
					</select></td>
				</tr>
				<tr>
					<td width="30%"><div align="center">导航菜单：</div></td>
					<td width="70%"><select id="navigationMenu"
						name="navigationMenu">
							<option:optionGroup type="select" required="true" cache="true"
								beanName="YES_NO" selectedValue="${sort.navigationMenu}" />
					</select></td>
				</tr>
				<tr>
					<td><div align="center">类型图片(765*240)</div></td>
					<td><input type="file" name="file" id="file" size="30" /> <input
						type="hidden" name="pictureName" id="pictureName" size="30"
						value="${sort.picture}" /></td>
				</tr>
				<c:if test="${sort.picture!=null && sort.picture!='' }">
					<tr>
						<td><div align="center">原有图片1</div></td>
						<td><a href="<ls:photo item='${sort.picture}'/>"
							target="_blank"> <img
								src="<ls:photo item='${sort.picture}'/>" height="60" width="300" /></a>
						</td>
					</tr>
				</c:if>
				<tr>
					<td colspan="2"><div align="center">
							<auth:auth ifAnyGranted="F_OPERATOR">
								<input type="submit" value="提交" />
							</auth:auth>
							<input type="reset" value="重置" /> <input type="button" value="返回"
								onclick='window.location="${pageContext.request.contextPath}/admin/gsort/query"' />
						</div></td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>