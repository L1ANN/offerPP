
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>用户管理</title>
</head>
<body>
<link rel="stylesheet" href="<%= basePath %>css/bootstrapdj.min.css">
<script src="<c:url value="/js/jquerydj-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/bootstrapdj.min.js"/>"></script>
<link rel="stylesheet" type="text/css" href="<%= basePath %>css/zzhsj.css" >
<style>
    .col-center-block {
        float: none;
        display: block;
        margin-left: auto;
        margin-right: auto;
    }
</style>

<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header navbar-nav navbar-left">
            <img src="<%= basePath %>img/1489386486003.jpeg" height="10" width="100" class="img-circle img-thumbnail">
        </div>
        <div>
            <ul class="nav navbar-nav navbar-right">
                <li ><a href="${basePath}userManage.action?page=1">用户管理</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        企业管理
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="${basePath}checkCompany.action?page=1">企业审核</a></li>
                        <li class="divider"></li>
                        <li><a href="${basePath}positionLimitManage.action?page=1">企业岗位审核</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        管理员
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="${basePath}adminModifyPasswordPage.action">修改密码</a></li>
                        <li class="divider"></li>
                        <li><a href="${basePath}exit.action">退出</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div class="row myCenter">
        <div class="col-sm-8 col-md-8 col-center-block">
            <div class="modal-dialog">
                <c:set var="totalUsers" value="${requestScope.totalUsers}"/>
                <c:set var="usersPerPage" value="${requestScope.usersPerPage}"/>
                <c:set var="totalPages" value="${requestScope.totalPages}"/>
                <c:set var="page" value="${requestScope.page}"/>
                <c:set var="currentPageUsers" value="${requestScope.userList}"/>

                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>邮箱</th>
                        <th>姓名</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${currentPageUsers!=null}">
                        <c:forEach items="${currentPageUsers}" var="user">
                            <tr>
                                <td>${user.userEmail}</td>
                                <td>${user.userName}</td>
                                <td>
                                    <a href="${basePath}deleteUser.action?page=${page}&&id=${user.pkUserId}">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="text-center">
    <nav>
        <ul class="pagination">
            <li><a href="<c:url value="${basePath}userManage.action?page=1"/>">首页</a></li>
            <li><a href="<c:url value="${basePath}userManage.action?page=${page-1>1?page-1:1}"/>">&laquo;</a></li>

            <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                <c:set var="active" value="${loop.index==page?'active':''}"/>
                <li class="${active}"><a
                        href="<c:url value="${basePath}userManage.action?page=${loop.index}"/>">${loop.index}</a>
                </li>
            </c:forEach>
            <li>
                <a href="<c:url value="${basePath}userManage.action?page=${page+1<totalPages?page+1:totalPages}"/>">&raquo;</a>
            </li>
            <li><a href="<c:url value="${basePath}userManage.action?page=${totalPages}"/>">尾页</a></li>
        </ul>
    </nav>
</div>


<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-6 left_block">
                <img src="<c:url value="/img/footer.png"/>"/>
                <p>华中科技大学软件学院2017届学生实训作品, 由软酷网老师指导完成</p>
                <p>欢迎大家使用!</p>
            </div>

            <div class="col-md-2">
                <h4>看机会</h4>
                <ul>
                    <li><a href="#">看机会</a></li>
                    <li><a href="#">使用攻略</a></li>
                    <li><a href="#">常见问题</a></li>
                    <li><a href="#">邀请朋友</a></li>
                    <li><a href="#">移动版</a></li>
                </ul>
            </div>
            <div class="col-md-2">
                <h4>博客</h4>
                <ul>
                    <li><a href="#">文章</a></li>
                    <li><a href="#">活动</a></li>
                </ul>
            </div>
            <div class="col-md-2">
                <h4>offer++</h4>
                <ul>
                    <li><a href="#">关于我们</a></li>
                    <li><a href="#">加入我们</a></li>
                    <li><a href="#">法律条款</a></li>
                </ul>
            </div>
        </div>
    </div>
</footer>


</body>
</html>
