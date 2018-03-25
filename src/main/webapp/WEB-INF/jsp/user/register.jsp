<%--
  Created by IntelliJ IDEA.
  User: L1ANN
  Date: 2018/2/26
  Time: 9:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>注册 | offer++</title>
    <!-- Bootstrap core CSS -->
    <link href="<c:url value="/css/bootstrap.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/zzhsj.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/login_register.css"/>" rel="stylesheet">
    <!-- Custom styles for this template -->

</head>
<body>
<!--导航栏-->
<c:import url="header_unlogin.jsp" charEncoding="UTF-8"/>
<!--正文-->
<div class="container">
    <div class="row">
        <form class="col-xs-12 col-md-6 col-md-offset-3"
              action="${pageContext.request.contextPath}/user/register.action" method="post">

            <h1>注册</h1>

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

            <!--用户注册-->
            <div class="seeker-input">
                <div class="form-group">
                    <label for="userName" class="zhanghao_mima">姓名</label>
                    <input type="text" class="form-control" id="name" placeholder="姓名" name="userName" value="${register_user.userName}">
                    <span class="error_message">
                        <c:forEach items="${errors}" var="error">
                            <c:if test="${error.defaultMessage=='姓名不能为空'}">
                                ${error.defaultMessage}
                            </c:if>
                        </c:forEach>
                    </span>
                </div>
                <div class="form-group">
                    <label for="email" class="zhanghao_mima">邮箱</label>
                    <input type="email" class="form-control" id="email" placeholder="邮箱" name="userEmail"
                           value="${register_user.userEmail}">
                    <%--返回重复注册的错误信息--%>
                    <span class="error_message">
                        <c:if test="${repeatEmail!=null}">
                            ${repeatEmail}
                        </c:if>
                    <%--返回邮箱校验的错误信息--%>
                    <c:forEach items="${errors}" var="error">
                        <c:if test="${error.defaultMessage=='邮箱不能为空'}">
                            ${error.defaultMessage}
                        </c:if>
                        <c:if test="${error.defaultMessage=='邮箱格式不正确'}">
                            ${error.defaultMessage}
                        </c:if>
                    </c:forEach>
                    </span>
                </div>

                <button class="fr btn btn-primary" type="button" onclick="sendEmail()">发送验证码</button>
                <div class="form-group">
                    <label for="inputCode" class="zhanghao_mima">验证码</label>
                    <input type="number" class="form-control" id="inputCode" name="inputCode" placeholder="请填写邮件中的验证码">
                    <%--返回验证码错误的错误信息--%>
                    <span class="error_messagae">
                <c:if test="${codeError!=null}">
                    ${codeError}
                </c:if>
                    </span>
                </div>
                <div class="form-group">
                    <label for="password" class="zhanghao_mima">密码</label>
                    <input type="password" class="form-control" id="password" name="userPassword" placeholder="密码"
                           value="${register_user.userPassword}">
                    <%--返回密码校验的错误信息--%>
                    <span class="error">
                <c:forEach items="${errors}" var="error">
                    <c:if test="${error.defaultMessage=='密码不能为空'}">
                        ${error.defaultMessage}
                    </c:if>
                    <c:if test="${error.defaultMessage=='密码长度必须在6-16之间'}">
                        ${error.defaultMessage}
                    </c:if>
                </c:forEach>
                    </span>
                </div>
                <div class="form-group">
                    <label for="confirmPassword" class="zhanghao_mima">确认密码</label>
                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword"
                           placeholder="确认密码" value="${register_user.userPassword}">
                    <%--返回确认密码的错误信息--%>
                    <span class="error">
                <c:if test="${confirmError!=null}">
                    ${confirmError}
                </c:if>
                    </span>
                </div>

                <button type="submit" class="btn btn-primary btn-block">确定</button>
            </div>

            <!--公司注册-->
            <div class="hr-input">

                <div class="form-group">
                    <label for="comNo">企业工商注册号</label>
                    <input type="number" class="form-control" id="comNo" placeholder="企业工商注册号" name="comNo">
                    <p hidden id="comNoNullError" class="frontVerify">企业工商注册号不能为空</p>
                </div>
                <div class="form-group">
                    <label for="comName">企业名称</label>
                    <input type="text" class="form-control" id="comName" placeholder="企业名称" name="comName">
                    <p hidden id="comNameNullError" class="frontVerify">企业名称不能为空</p>
                </div>
                <div class="form-group">
                    <label for="comLegalperson">企业法人代表</label>
                    <input type="text" class="form-control" id="comLegalperson" placeholder="企业法人代表" name="comLegalperson">
                    <p hidden id="comLegalpersonNullError" class="frontVerify">企业法人代表不能为空</p>
                </div>
                <div class="form-group">
                    <label for="inputEmail">企业邮箱</label>
                    <input type="text" class="form-control" id="comEmail" placeholder="邮箱" name="comEmail">
                    <%--返回重复注册的错误信息--%>
                    <p hidden id="comRepeatError" class="backVerify">该邮箱已注册</p>
                    <p hidden id="comEmailNullError" class="frontVerify">企业邮箱不能为空</p>
                    <p hidden id="comEmailRegixError" class="frontVerify">企业邮箱格式不正确</p>
                </div>
                <div class="form-group">
                    <p hidden id="emailSend" class="backVerify">验证码已发送到邮箱</p>
                    <button class="fr btn btn-primary" type="button" id="sendVerifyEmail">发送验证码</button>
                </div>

                <div class="form-group">
                    <label for="inputValidator">验证码</label>
                    <input type="number" class="form-control" id="inputCode_company" placeholder="请填写邮件中的验证码"
                           name="inputCode">
                    <p hidden id="verifyCodeError" class="backVerify">验证码错误或超时</p>
                </div>


                <div class="form-group">
                    <label for="inputPassword">密码</label>
                    <input type="password" class="form-control" id="comPassword" placeholder="密码"
                           name="comPassword">
                    <p hidden id="passWordError" class="frontVerify">密码长度为6-16位字符</p>
                </div>

                <div class="form-group">
                    <label for="inputPassword">确认密码</label>
                    <input type="password" class="form-control" id="confirmPassword_company" placeholder="确认密码"
                           name="confirmPassword">
                    <p hidden id="passwordConfirmError" class="frontVerify">密码与确认密码不一致</p>
                </div>
                <%--<button type="submit" class="btn btn-primary btn-block" formaction="./companyRegister.action" formmethod="post">确定</button>--%>
                <button type="button" class="btn btn-primary btn-block" id="formSubmit">确定</button>
            </div>
        </form>

    </div>
</div>
<!--页尾-->
<c:import url="footer.jsp" charEncoding="UTF-8"/>
<!--script脚本-->
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.js"/>"></script>

<script type="text/javascript">
    $(document).ready(function () {
        //发送验证邮件
        $('#sendVerifyEmail').click(function () {
            var comEmail=$('#comEmail').val();
            var reg=/^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
            $(".frontVerify").hide();
            $(".backVerify").hide();
            //邮件发送前的前台验证
            //企业邮箱不为空
            console.log(comEmail);
            if(comEmail.length==0){
                $('#comEmailNullError').show();
            }
            //企业邮箱格式不正确
            else if(!reg.test(comEmail)){
                $('#comEmailRegixError').show();
            }
            else {
                $.post(
                    "${pageContext.request.contextPath}/company/sendEmail.action",
                    {
                        email: comEmail,
                        request: 'register'
                    },
                    function (data) {
                        $('#emailSend').show();
                    }
                ).error(function () {
                    alert("发送验证码失败！");
                });
            }
        });
        //提交表单
        $('#formSubmit').click(function () {
            var comNo=$('#comNo').val();
            var comName=$('#comName').val();
            var comLegalperson=$('#comLegalperson').val();
            var comEmail=$('#comEmail').val();
            var comPassword=$('#comPassword').val();
            var confirmPassword=$('#confirmPassword_company').val();
            var inputCode=$('#inputCode_company').val();
            $(".frontVerify").hide();
            $(".backVerify").hide();
            //表单提交前的前台验证
            //企业工商注册号不为空
            if(comNo.length==0){
                $('#comNoNullError').show();
            }
            else if(comName.length==0){
                $('#comNameNullError').show();
            }
            else if(comLegalperson.length==0){
                $('#comLegalpersonNullError').show();
            }
            //密码长度为6-16位字
            else if(comPassword.length<6||comPassword.length>16){
                $('#passWordError').show();
            }
            //密码与确认密码不一致
            else if(confirmPassword!=comPassword){
                $('#passwordConfirmError').show();
            }else{
                var data={
                    inputCode:inputCode,
                    confirmPassword:confirmPassword,
                    comNo:comNo,
                    comName:comName,
                    comLegalperson:comLegalperson,
                    comEmail:comEmail,
                    comPassword:comPassword
                };
                $.post(
                    "${pageContext.request.contextPath}/company/companyRegister.action",
                    data,
                    function (data) {
                        if (data.hasOwnProperty('errorList')) {
                            alert(${errorList});
                        }
                        else if (data.result == 'verifyCodeError') {
                            $('#verifyCodeError').show();
                        }
                        //这里采用弹出是为了区分前台后台验证
                        else if (data.result == 'confirmError') {
                            alert('密码和确认密码不一致');
                        }
                        else if (data.result == 'registerRepeat') {
                            $('#comRepeatError').show();
                        }
                        else if(data.result=='registerFail'){
                            alert('注册失败');
                        }
                        //注册成功
                        else if (data.result == 'registerOK') {
                            alert("注册成功,管理员将在24小时内审核您的注册信息");
                            window.location.href = "${pageContext.request.contextPath}/company/signCompany.action";
                        }
                    }).error(function () {
                    alert('注册失败');
                });
            }

        })
    });
    function sendEmail() {
        var email = $("#email").val();
        $.ajax({
            url: "sendEmail.action?email=" + email,
            type: "post",
            data: {},
            success: function (data) {
                if(data.result=='ok'){
                    alert("验证码发送成功");
                }
            },
            error: function () {
                alert("发送验证码失败！");
            }
        });
    }

    function setBox(type) {
        let seeker_type_box = document.querySelector('form .fl.user_type_box');
        let hr_type_box = document.querySelector('form .fr.user_type_box');
        let hr_input = document.querySelector('form .hr-input');
        let hr_radio = hr_type_box.querySelector('input[type=radio]');
        let seeker_input = document.querySelector('form .seeker-input');
        let seeker_radio = seeker_type_box.querySelector('input[type=radio]');

        if (type === 'seeker') {
            seeker_radio.checked = 'checked';
            hr_input.style.display = 'none';
            seeker_input.style.display = 'block';
        } else if (type === 'hr') {
            hr_input.style.display = 'block';
            seeker_input.style.display = 'none';
            hr_radio.checked = 'checked';
        }
    }


    document.addEventListener('DOMContentLoaded', (e) => {
        console.log('DOMLoad!');
    user_type = '${user_type}';
    console.log(user_type);

    if (user_type === '') setBox('seeker');
    else if (user_type === 'seeker' || user_type === 'hr') {
        setBox('${user_type}');
    }
    });

    let type_choose_div = document.querySelector('.type_choose');
    type_choose_div.addEventListener('click', (e) => {
        let tar = e.target;
    if (tar.tagName === 'LABEL')
        tar = tar.parentNode.parentNode;

    console.log(tar);

    if (tar.className === 'fl user_type_box') {
        setBox('seeker');
    } else if (tar.className === 'fr user_type_box') {
        setBox('hr');
    }
    });


    // 嵌套元素  点按事件  点按在margin上是不算两个都点到的
    // 该用类的时候还是要用
</script>
</body>
</html>
