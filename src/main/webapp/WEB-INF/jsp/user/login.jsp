<%--
  Created by IntelliJ IDEA.
  User: L1ANN
  Date: 2018/2/28
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录 | offer++</title>
    <!-- Bootstrap core CSS -->
    <link href="<c:url value="/css/login_register.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/bootstrap.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/zzhsj.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/overhang.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/square/_all.css"/>" rel="stylesheet">
    <style>
        label.remember {
            padding-left: 0px;
        }
    </style>
</head>
<body>
<!--导航栏-->
<c:import url="header_unlogin.jsp" charEncoding="UTF-8"/>
<!--正文-->
<div class="container">
    <div class="row">
        <form class="col-xs-12 col-md-5 col-md-offset-3" action="${pageContext.request.contextPath}/user/login.action"
              method="post">
            <h1 class="denglu">登录</h1>

            <div class="type_choose">
                <div class="fl user_type_box">
                    <div class="radio">
                        <label class="remember_text"><input class="xuanze" type="radio" name="user_type"
                                                            checked="checked"/> 我是候选人</label>
                    </div>
                </div>

                <div class="fr user_type_box">
                    <div class="radio">
                        <label class="remember_text"><input class="xuanze" type="radio" name="user_type"/> 我是HR</label>
                    </div>
                </div>
            </div>

            <!--用户登录框-->
            <div class="seeker-input" style="display:block;">
                <div class="form-group">
                    <label for="email" class="zhanghao_mima">账号</label>
                    <input type="email" class="form-control" id="email" name="userEmail" placeholder="账号"
                           value="${email}">
                </div>

                <div class="form-group">
                    <label for="password" class="zhanghao_mima">密码</label>
                    <input type="password" class="form-control" id="password" name="userPassword" placeholder="密码"
                           value="${password}">
                </div>

                <div class="checkbox">
                    <div class="fl">
                        <label class="remember">
                            <input class="ins" type="checkbox" id="r1" name="remember" value="1">
                            <span class="remember_text">记住我</span>
                        </label>
                    </div>
                    <div class="fr"><a href="${pageContext.request.contextPath}/user/forgetEmailUI.action"><span
                            class="forget_text">忘记密码?</span></a></div>
                </div>
                <button type="submit" class="btn btn-primary btn-block">确定</button>
            </div>

            <!--企业登录框-->
            <div class="hr-input" style="display:none;">
                <div class="form-group">
                    <label for="inputEmail">账号</label>
                    <input type="text" class="form-control" id="comEmail" placeholder="账号" name="email">
                    <p hidden id="NoPass" class="backVerify">公司注册未审核</p>
                    <p hidden id="NoSuchCompany" class="backVerify">邮箱未注册</p>
                    <p hidden id="emailNullError" class="frontVerify">邮箱不能为空</p>
                    <p hidden id="emailRegixError" class="frontVerity">邮箱格式不正确</p>
                </div>
                <div class="form-group">
                    <label for="inputPassword">密码</label>
                    <input type="password" class="form-control" id="comPassword" placeholder="密码" name="password">
                    <p hidden id="passNullError" class="frontVerify">密码长度为6-16位字符</p>
                    <p hidden id="passwordError" class="backVerify">密码错误</p>
                </div>
                <div class="checkbox">
                    <div class="fl"><label><input type="checkbox"> 记住我</label></div>
                    <div class="fr"><a href="${pageContext.request.contextPath}/company/findComPassword.action">忘记密码?</a></div>
                </div>
                <button type="button" class="btn btn-primary btn-block" id="hrbutton">确定</button>
                <%--<button type="submit" class="btn btn-primary btn-block" formaction="./companySignIn.action" formmethod="post">确定</button>--%>

            </div>
        </form>
    </div>
</div>
<!--页尾-->
<c:import url="footer.jsp" charEncoding="UTF-8"/>
<!--script脚本-->
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.js"/>"></script>
<script src="<c:url value="/js/overhang.js"/>"></script>
<script src="<c:url value="/js/icheck.js"/>"></script>
<script src="<c:url value="/js/login_register.js"/>"></script>
<script type="text/javascript">
    $(document).ready(function () {

        $('.ins').iCheck({
            checkboxClass: 'icheckbox_square',
            radioClass: 'iradio_square',
            increaseArea: '20%'
        });

        if (${remember==1}) {
            $("#r1").iCheck('check');
        }

        if (${error!=null}) {
            $("body").overhang({
                type: "error",
                message: "登录账号或密码不正确"
            });
        }
        var comRemCheck=${comRemCheck==1}?1:0;

        if(comRemCheck==1)
        {
            $("#comRemMe").prop("checked",true);
        }
        else{

            $("#comRemMe").prop("checked",false);
        }

        $('#hrbutton').click(function () {
            $(".backVerify").hide();
            $(".frontVerify").hide();
            var reg = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
            var email = $('#comEmail').val();
            var password = $('#comPassword').val();
            if (email.length == 0) {
                $('#emailNullError').show();
            }
            else if (!reg.test(email)) {
                $('#emailRegixError').show();
            }
            else if (password.length < 6 || password.length > 16) {
                $('#passNullError').show();
            }
            else {
                if($("#comRemMe").is("checked")){
                    comRemCheck=1;
                }
                else{
                    comRemCheck=0;
                }
                console.log(comRemCheck);
                $.post(
                    "${pageContext.request.contextPath}/company/companySignIn.action",
                    {
                        email: email,
                        password: password,
                        comRemCheck:comRemCheck
                    },
                    function (data) {
                        if (data.result == "NoSuchCompany") {
                            $('#NoSuchCompany').show();
                        }
                        else if (data.result == 'passwordError') {
                            $('#passwordError').show();
                        }
                        else if(data.result=='NoPass'){
                            alert("公司审核未通过，请稍后登录");
                        }
                        else if (data.result == 'ok') {

                            window.location.href = "${pageContext.request.contextPath}/company/showCurrComDetails.action";
                        }
                        else {
                            alert('登录失败');
                        }
                    }
                );
            }

        });
    });
</script>
</body>
</html>
