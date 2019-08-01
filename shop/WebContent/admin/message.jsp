<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
 
<!DOCTYPE HTML>
<html>
    <head> 
        <meta charset="UTF-8">
        <title>Title</title>
</head>
<body>
<span style="color:red"><s:actionerror /></span>
<button type="button" id="close">关闭窗口</button> 

<script type="text/javascript" src="${pageContext.request.contextPath }/admin/assets/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/admin/assets/plugin/layer/layer.js" type="text/javascript"></script>
<script type="text/javascript">
    var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
    $("#close").on("click",function () {
        //parent.$('#rightFrame')[0].contentWindow.$("#add").text('我被改变了');
        parent.$('#rightFrame')[0].contentWindow.location.reload(true);
        parent.layer.close(index);
    })
</script>
</body>
</html>