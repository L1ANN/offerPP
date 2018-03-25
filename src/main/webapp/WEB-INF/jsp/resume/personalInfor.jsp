<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/6
  Time: 16:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page import="team.offer.entity.*" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>个人信息 | offer++</title>
    <link href="<c:url value="/css/bootstrap.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/zzhsj.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/profile.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/overhang.css"/>" rel="stylesheet">
    <style>


    </style>
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
                <a class="row-now daohang_zuoce"  style="text-decoration:none;"
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
                <a class="daohang_zuoce"  style="text-decoration:none;"
                   href="${pageContext.request.contextPath }/resume/getDescription.action">
                    <span class='glyphicon glyphicon-ok-circle'></span>
                    个人描述
                </a>

                <a class="see_resume" style="text-decoration:none;" href="${pageContext.request.contextPath }/resume/getResume.action">
                    <button class="click-button">查看简历</button>
                </a>
            </div>
        </aside>

        <form class="col-md-9 main-block" action="${pageContext.request.contextPath}/resume/setPersonal.action"
              enctype="multipart/form-data" method="post">

            <div class="header-bar">
                个人信息
            </div>

            <div class="profile-panel">

                <div class="user_img">
                    <c:if test="${personalInformation.userIcon==null || personalInformation.userIcon==''}">
                        <img src="<c:url value="/img/talent_blank.jpg-200w"/>" class="fl" width=100 height=10/>
                    </c:if>
                    <c:if test="${personalInformation.userIcon!=null && personalInformation.userIcon!=''}">
                        <img src="/pic/${personalInformation.userIcon}" class="fl" width=100 height=10/>
                    </c:if>

                    <div class="fl filecontainer">
                        <p class="file_name">头像上传后将自动保存</p>

                        <input type='button' class='btn file_button' value='浏览...'onclick="document.getElementById('fileField').click()" />

                        <input type="file" class="file" id="fileField" name="userUpload"/>
                    </div>
                    <div style="clear: both"></div>
                </div>

                <div class="form-group">
                    <label for="inputName">姓名</label>
                    <input type="text" class="form-control shuru" name="userName" id="inputName"
                           value="${personalInformation.userName}">
                </div>

                <div class="form-group">
                    <label for="inputAge">年龄</label>
                    <input type="number" class="form-control  shuru" name="userAge" id="inputAge"
                           value="${personalInformation.userAge}">
                </div>
                <div class="form-group">
                    <label for="inputCity">所在城市</label>
                    <select class="form-control  shuru" name="userAddressCity" id="inputCity">
                        <option value="北京"
                                <c:if test="${'北京'== personalInformation.userAddressCity}">selected='selected'</c:if>>北京
                        </option>
                        <option value="上海"
                                <c:if test="${'上海'== personalInformation.userAddressCity}">selected='selected'</c:if>>上海
                        </option>
                        <option value="广州"
                                <c:if test="${'广州'== personalInformation.userAddressCity}">selected='selected'</c:if>>广州
                        </option>
                        <option value="深圳"
                                <c:if test="${'深圳'== personalInformation.userAddressCity}">selected='selected'</c:if>>深圳
                        </option>
                        <option value="杭州"
                                <c:if test="${'杭州'== personalInformation.userAddressCity}">selected='selected'</c:if>>杭州
                        </option>
                        <option value="武汉"
                                <c:if test="${'武汉'== personalInformation.userAddressCity}">selected='selected'</c:if>>武汉
                        </option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="inputPhone ">联系手机</label>
                    <input type="number" class="form-control  shuru" name="userPhone" id="inputPhone"
                           value="${personalInformation.userPhone}">
                </div>
                <div class="form-group">
                    <label for="inputMail">联系邮箱</label>
                    <input type="text" class="form-control  shuru" name="userEmail" id="inputMail"
                           value="${personalInformation.userEmail}">
                </div>
            </div>
            <button type="submit" class="btn btn-primary form_save_btn">保存</button>
        </form>
    </div>
</div>
<!--页尾-->
<c:import url="../user/footer.jsp" charEncoding="UTF-8"/>
<!--script脚本-->
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.js"/>"></script>
<script src="<c:url value="/js/overhang.js"/>"></script>
<script>
    $(document).ready(function(){
        if(${result!=null}){
            $("body").overhang({
                type: "success",
                message: "保存成功",
            });
        }
    })
</script>
</body>
</html>