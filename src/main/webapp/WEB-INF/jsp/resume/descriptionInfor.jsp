<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/7
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page import="team.offer.entity.*" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>个人描述 | offer++</title>
    <link href="<c:url value="/css/bootstrap.css"/>" rel="stylesheet">

    <link href="<c:url value="/css/index.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/zzhsj.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/profile.css"/>" rel="stylesheet">
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <link href="<c:url value="/css/overhang.css"/>" rel="stylesheet">


</head>

<body>
<!--导航栏-->
<c:import url="../user/header_login.jsp" charEncoding="UTF-8"/>
<!--正文-->

<div class="container">
    <div class="row">
        <aside class="col-md-3">
            <div class="aside-block">

                <div class="daohang_title">个人简历</div>
                <div class="kongxi"></div>
                <a class="daohang_zuoce"  style="text-decoration:none;"
                   href="${pageContext.request.contextPath }/resume/getPersonal.action">
                    <span class='glyphicon glyphicon-ok-circle'></span>
                    个人信息
                </a>
                <a class="daohang_zuoce"  style="text-decoration:none;"
                   href="${pageContext.request.contextPath }/resume/getSkills.action">
                    <span class='glyphicon glyphicon-ok-circle'></span>
                    职业期望与技能
                </a>
                <a class="daohang_zuoce"  style="text-decoration:none;"
                   href="${pageContext.request.contextPath }/resume/getExperience.action">
                    <span class='glyphicon glyphicon-ok-circle'></span>
                    工作与教育经历
                </a>
                <a class="daohang_zuoce row-now "  style="text-decoration:none;"
                   href="${pageContext.request.contextPath }/resume/getDescription.action">
                    <span class='glyphicon glyphicon-ok-circle'></span>
                    个人描述
                </a>

                <a class="see_resume" style="text-decoration:none;" href="${pageContext.request.contextPath }/resume/getResume.action">
                    <button class="click-button">查看简历</button>
                </a>
            </div>
        </aside>

        <form class="col-md-9 main-block" method="post">

            <div class="header-bar">
                个人描述
            </div>

            <div class="profile-panel">
                <p>在100offer，个人描述是你简历中最重要的部分，
                    不过你没必要重复你在工作和项目经历中已经罗列出的内容。
                    你可以畅所欲言，评价一下自己的技术或业务能力，
                    聊聊自己的开源项目，理想中的团队，以及你的个人爱好等等。
                    正是这些内容让你的简历看起来不再冰冷，而是充满了个人特色。
                </p>

                <!--富文本编辑器-->
                <div id="summernote">${personalDescription}</div>

                <button id="save" class="btn btn-primary form_save_btn">保存</button>
            </div>
        </form>
    </div>
</div>


<!--页尾-->
<c:import url="../user/footer.jsp" charEncoding="UTF-8"/>
<!--script脚本-->
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.js"/>"></script>
<script src="<c:url value="/js/summernote.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.js"/>"></script>
<script src="<c:url value="/js/overhang.js"/>"></script>
<script>

    $(document).ready(function () {
        $('#summernote').summernote({
            height: 250,
            minHeight: 250,
            maxHeight: 250,
            lang: 'zh-CN',
            focus: true
        });
        if(${result!=null}){
            $("body").overhang({
                type: "success",
                message: "保存成功",
            });
        }
    });

    $("#save").click(function () {
        var resume = $('#summernote').summernote('code');
        $.ajax({
            url: "${pageContext.request.contextPath }/resume/setDescription.action",
            type: "post",
            data: {
                "resume": resume
            },
            success: function (data) {
                if (data.result == "changepass") {
                    window.location.href = "${pageContext.request.contextPath}/resume/getDescription.action?result=ok";
                }
            }

        })
    });
</script>
</body>
</html>

