<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/7
  Time: 15:21
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
    <title>个人信息 | offer++</title>
    <link href="<c:url value="/css/bootstrap.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/zzhsj.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/profile.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/overhang.css"/>" rel="stylesheet">

    <style>
        .main-block table {
            width: 100%
        }
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
                <a class="daohang_zuoce" style="text-decoration:none;"
                   href="${pageContext.request.contextPath }/resume/getPersonal.action">
                    <span class='glyphicon glyphicon-ok-circle'></span>
                    个人信息
                </a>
                <a class="daohang_zuoce  row-now" style="text-decoration:none;"
                   href="${pageContext.request.contextPath }/resume/getSkills.action">
                    <span class='glyphicon glyphicon-ok-circle'></span>
                    职业期望与技能
                </a>
                <a class="daohang_zuoce" style="text-decoration:none;"
                   href="${pageContext.request.contextPath }/resume/getExperience.action">
                    <span class='glyphicon glyphicon-ok-circle'></span>
                    工作与教育经历
                </a>
                <a class="daohang_zuoce " style="text-decoration:none;"
                   href="${pageContext.request.contextPath }/resume/getDescription.action">
                    <span class='glyphicon glyphicon-ok-circle'></span>
                    个人描述
                </a>

                <a class="see_resume" style="text-decoration:none;" style="text-decoration:none;"
                   href="${pageContext.request.contextPath }/resume/getResume.action">
                    <button class="click-button">查看简历</button>
                </a>
            </div>
        </aside>

        <form class="col-md-9 main-block" action="${pageContext.request.contextPath }/resume/setSkills.action"
              method="post">
            <div class="header-bar">
                职业期望与技能
            </div>
            <div class="profile-panel">
                <div class="form-group">
                    <label for="inputProfession">职业方向</label>
                    <select class="form-control shuru" id="inputProfession" name="userDirection">
                        <option value="技术" id="tech"
                                <c:if test="${'技术'== skillsInformation.userDirection}">selected='selected'</c:if>>技术
                        </option>
                        <option value="数据" id="data"
                                <c:if test="${'数据'== skillsInformation.userDirection}">selected='selected'</c:if>>数据
                        </option>
                        <option value="产品" id="product"
                                <c:if test="${'产品'== skillsInformation.userDirection}">selected='selected'</c:if>>产品
                        </option>
                        <option value="设计" id="design"
                                <c:if test="${'设计'== skillsInformation.userDirection}">selected='selected'</c:if>>设计
                        </option>
                        <option value="市场与销售" id="market"
                                <c:if test="${'市场与销售'== skillsInformation.userDirection}">selected='selected'</c:if>>
                            市场与销售
                        </option>
                        <option value="职能" id="function"
                                <c:if test="${'职能'== skillsInformation.userDirection}">selected='selected'</c:if>>职能
                        </option>
                        <option value="运营" id="operate"
                                <c:if test="${'运营'== skillsInformation.userDirection}">selected='selected'</c:if>>运营
                        </option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="inputProfessionDuration">你在该职业方向上有多长时间的工作经验？</label>
                    <select class="form-control shuru" id="inputProfessionDuration" name="userExperience">
                        <option value="一年及以上"
                                <c:if test="${'一年及以上'== skillsInformation.userExperience}">selected='selected'</c:if>>
                            一年及以上
                        </option>
                        <option value="二年及以上"
                                <c:if test="${'二年及以上'== skillsInformation.userExperience}">selected='selected'</c:if>>二年及以上
                        </option>
                        <option value="三年及以上"
                                <c:if test="${'三年及以上'== skillsInformation.userExperience}">selected='selected'</c:if>>三年及以上
                        </option>
                        <option value="五年及以上"
                                <c:if test="${'五年及以上'== skillsInformation.userExperience}">selected='selected'</c:if>>五年及以上
                        </option>
                        <option value="十年及以上"
                                <c:if test="${'十年及以上'== skillsInformation.userExperience}">selected='selected'</c:if>>十年及以上
                        </option>
                    </select>
                </div>

                <div class="form-group">
                    <p><label>选择你期望从事的职位</label></p>
                    <table class="tech-table">
                        <tr>
                            <td>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="userStation" value=".Net工程师"
                                    <c:forEach items="${requestScope.Stations}" var="str">
                                                  <c:if test="${'.Net工程师'== str}">checked='checked'</c:if>
                                    </c:forEach>>.Net工程师</label>
                                </div>
                            </td>
                            <td>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="userStation" value="java工程师"
                                    <c:forEach items="${requestScope.Stations}" var="str">
                                                  <c:if test="${'java工程师'== str}">checked='checked'</c:if>
                                    </c:forEach>>java工程师</label>
                                </div>
                            </td>
                            <td>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="userStation" value="c工程师"
                                    <c:forEach items="${requestScope.Stations}" var="str">
                                                  <c:if test="${'c工程师'== str}">checked='checked'</c:if>
                                    </c:forEach>>c工程师</label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="userStation" value="c++工程师"
                                    <c:forEach items="${requestScope.Stations}" var="str">
                                                  <c:if test="${'c++工程师'== str}">checked='checked'</c:if>
                                    </c:forEach>>c++工程师</label>
                                </div>
                            </td>
                            <td>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="userStation" value="python工程师"
                                    <c:forEach items="${requestScope.Stations}" var="str">
                                                  <c:if test="${'python工程师'== str}">checked='checked'</c:if>
                                    </c:forEach>>python工程师</label>
                                </div>
                            </td>
                            <td>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="userStation" value="c#工程师"
                                    <c:forEach items="${requestScope.Stations}" var="str">
                                                  <c:if test="${'c#工程师'== str}">checked='checked'</c:if>
                                    </c:forEach>>c#工程师</label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="userStation" value="前端工程师"
                                    <c:forEach items="${requestScope.Stations}" var="str">
                                                  <c:if test="${'前端工程师'== str}">checked='checked'</c:if>
                                    </c:forEach>>前端工程师</label>
                                </div>
                            </td>
                            <td>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="userStation" value="ios工程师"
                                    <c:forEach items="${requestScope.Stations}" var="str">
                                                  <c:if test="${'ios工程师'== str}">checked='checked'</c:if>
                                    </c:forEach>>ios工程师</label>
                                </div>
                            </td>
                            <td>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="userStation" value="Android工程师"
                                    <c:forEach items="${requestScope.Stations}" var="str">
                                                  <c:if test="${'Android工程师'== str}">checked='checked'</c:if>
                                    </c:forEach>>Android工程师</label>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <table class="data-table">
                        <tr>
                            <td>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="userStation" value="BI研发"
                                    <c:forEach items="${requestScope.Stations}" var="str">
                                                  <c:if test="${'BI研发'== str}">checked='checked'</c:if>
                                    </c:forEach>>BI研发</label>
                                </div>
                            </td>
                            <td>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="userStation" value="数据分析师"
                                    <c:forEach items="${requestScope.Stations}" var="str">
                                                  <c:if test="${'数据分析师'== str}">checked='checked'</c:if>
                                    </c:forEach>>数据分析师</label>
                                </div>
                            </td>
                            <td>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="userStation" value="数据工程师"
                                    <c:forEach items="${requestScope.Stations}" var="str">
                                                  <c:if test="${'数据工程师'== str}">checked='checked'</c:if>
                                    </c:forEach>>数据工程师</label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="userStation" value="数据架构师"
                                    <c:forEach items="${requestScope.Stations}" var="str">
                                                  <c:if test="${'数据架构师'== str}">checked='checked'</c:if>
                                    </c:forEach>>数据架构师</label>
                                </div>
                            </td>
                            <td>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="userStation" value="数据专家"
                                    <c:forEach items="${requestScope.Stations}" var="str">
                                                  <c:if test="${'数据专家'== str}">checked='checked'</c:if>
                                    </c:forEach>>数据专家</label>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <table class="product-table">
                        <tr>
                            <td>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="userStation" value="产品经理"
                                    <c:forEach items="${requestScope.Stations}" var="str">
                                                  <c:if test="${'产品经理'== str}">checked='checked'</c:if>
                                    </c:forEach>>产品经理</label>
                                </div>
                            </td>
                            <td>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="userStation" value="产品助理"
                                    <c:forEach items="${requestScope.Stations}" var="str">
                                                  <c:if test="${'产品助理'== str}">checked='checked'</c:if>
                                    </c:forEach>>产品助理</label>
                                </div>
                            </td>
                            <td>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="userStation" value="产品总监"
                                    <c:forEach items="${requestScope.Stations}" var="str">
                                                  <c:if test="${'产品总监'== str}">checked='checked'</c:if>
                                    </c:forEach>>产品总监</label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="userStation" value="游戏策划"
                                    <c:forEach items="${requestScope.Stations}" var="str">
                                                  <c:if test="${'游戏策划'== str}">checked='checked'</c:if>
                                    </c:forEach>>游戏策划</label>
                                </div>
                            </td>
                        </tr>

                    </table>
                    <table class="design-table">
                        <tr>
                            <td>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="userStation" value="品牌/平面设计师"
                                    <c:forEach items="${requestScope.Stations}" var="str">
                                                  <c:if test="${'品牌/平面设计师'== str}">checked='checked'</c:if>
                                    </c:forEach>>品牌/平面设计师</label>
                                </div>
                            </td>
                            <td>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="userStation" value="视觉设计师"
                                    <c:forEach items="${requestScope.Stations}" var="str">
                                                  <c:if test="${'视觉设计师'== str}">checked='checked'</c:if>
                                    </c:forEach>>视觉设计师</label>
                                </div>
                            </td>
                            <td>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="userStation" value="UE设计师"
                                    <c:forEach items="${requestScope.Stations}" var="str">
                                                  <c:if test="${'UE设计师'== str}">checked='checked'</c:if>
                                    </c:forEach>>UE设计师</label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="userStation" value="UI设计师"
                                    <c:forEach items="${requestScope.Stations}" var="str">
                                                  <c:if test="${'UI设计师'== str}">checked='checked'</c:if>
                                    </c:forEach>>UI设计师</label>
                                </div>
                            </td>
                            <td>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="userStation" value="用户研究员"
                                    <c:forEach items="${requestScope.Stations}" var="str">
                                                  <c:if test="${'用户研究员'== str}">checked='checked'</c:if>
                                    </c:forEach>>用户研究员</label>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <table class="market-table">
                        <tr>
                            <td>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="userStation" value="公关"
                                    <c:forEach items="${requestScope.Stations}" var="str">
                                                  <c:if test="${'公关'== str}">checked='checked'</c:if>
                                    </c:forEach>>公关</label>
                                </div>
                            </td>
                            <td>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="userStation" value="商务"
                                    <c:forEach items="${requestScope.Stations}" var="str">
                                                  <c:if test="${'商务'== str}">checked='checked'</c:if>
                                    </c:forEach>>商务</label>
                                </div>
                            </td>
                            <td>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="userStation" value="市场"
                                    <c:forEach items="${requestScope.Stations}" var="str">
                                                  <c:if test="${'市场'== str}">checked='checked'</c:if>
                                    </c:forEach>>市场</label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="userStation" value="销售"
                                    <c:forEach items="${requestScope.Stations}" var="str">
                                                  <c:if test="${'销售'== str}">checked='checked'</c:if>
                                    </c:forEach>>销售</label>
                                </div>
                            </td>
                        </tr>

                    </table>
                    <table class="function-table">
                        <tr>
                            <td>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="userStation" value="财务"
                                    <c:forEach items="${requestScope.Stations}" var="str">
                                                  <c:if test="${'财务'== str}">checked='checked'</c:if>
                                    </c:forEach>>财务</label>
                                </div>
                            </td>
                            <td>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="userStation" value="法务"
                                    <c:forEach items="${requestScope.Stations}" var="str">
                                                  <c:if test="${'法务'== str}">checked='checked'</c:if>
                                    </c:forEach>>法务</label>
                                </div>
                            </td>
                            <td>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="userStation" value="人力资源"
                                    <c:forEach items="${requestScope.Stations}" var="str">
                                                  <c:if test="${'人力资源'== str}">checked='checked'</c:if>
                                    </c:forEach>>人力资源</label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="userStation" value="行政"
                                    <c:forEach items="${requestScope.Stations}" var="str">
                                                  <c:if test="${'行政'== str}">checked='checked'</c:if>
                                    </c:forEach>>行政</label>
                                </div>
                            </td>
                        </tr>

                    </table>
                    <table class="operate-table">
                        <tr>
                            <td>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="userStation" value="编辑/文案"
                                    <c:forEach items="${requestScope.Stations}" var="str">
                                                  <c:if test="${'编辑/文案'== str}">checked='checked'</c:if>
                                    </c:forEach>>编辑/文案</label>
                                </div>
                            </td>
                            <td>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="userStation" value="产品运营"
                                    <c:forEach items="${requestScope.Stations}" var="str">
                                                  <c:if test="${'产品运营'== str}">checked='checked'</c:if>
                                    </c:forEach>>产品运营</label>
                                </div>
                            </td>
                            <td>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="userStation" value="新媒体运营"
                                    <c:forEach items="${requestScope.Stations}" var="str">
                                                  <c:if test="${'新媒体运营'== str}">checked='checked'</c:if>
                                    </c:forEach>>新媒体运营</label>
                                </div>
                            </td>
                        </tr>
                    </table>

                </div>

                <div class="form-group">
                    <label for="inputSkill">职业技能</label>
                    <input type="text" class="form-control   shuru" id="inputSkill" name="userSkill"
                           value="${skillsInformation.userSkill}">
                </div>

                <button type="submit" class="btn btn-primary form_save_btn">保存</button>
            </div>
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

    var checkboxs = document.querySelectorAll('input[type=checkbox]');

    $(document).ready(function () {
        if (${result!=null}) {
            $("body").overhang({
                type: "success",
                message: "保存成功",
            });
        }
    })

    function showTable() {
        var tableNowKind = document.querySelector('#inputProfession').value;
        if (tableNowKind === '技术')
            tableNowKind = 'tech';
        else if (tableNowKind === '数据')
            tableNowKind = 'data';
        else if (tableNowKind === '产品')
            tableNowKind = 'product';
        else if (tableNowKind === '设计')
            tableNowKind = 'design';
        else if (tableNowKind === '市场与销售')
            tableNowKind = 'market';
        else if (tableNowKind === '职能')
            tableNowKind = 'function';
        else if (tableNowKind === '运营')
            tableNowKind = 'operate';

        console.log(tableNowKind);
        var tableClassName = tableNowKind + '-table';
        console.log(tableClassName);
        tables = document.querySelectorAll('table');

        for (var i = 0; i < tables.length; i++) {
            console.log(tables[i].className);
            if (tables[i].className === tableClassName) {
                tables[i].style.display = 'block';
            } else
                tables[i].style.display = 'none';
        }
    }


    function validate() {
        var tableNowKind = document.querySelector('#inputProfession').value;
        if (tableNowKind === '技术')
            tableNowKind = 'tech';
        else if (tableNowKind === '数据')
            tableNowKind = 'data';
        else if (tableNowKind === '产品')
            tableNowKind = 'product';
        else if (tableNowKind === '设计')
            tableNowKind = 'design';
        else if (tableNowKind === '市场与销售')
            tableNowKind = 'market';
        else if (tableNowKind === '职能')
            tableNowKind = 'function';
        else if (tableNowKind === '运营')
            tableNowKind = 'operate';

        var tableNow = document.querySelector('.'+tableNowKind+'-table');

        var checkboxs = document.querySelectorAll('input[type=checkbox]');
        var cnt = 0;
        for (var i = 0; i < checkboxs.length; i++) {
            if (checkboxs[i].checked === true && tableNow.contains(checkboxs[i]))
                cnt++;
        }
        if (cnt <= 2 && cnt > 0) {
            for (var i = 0; i < checkboxs.length; i++) {
                if (checkboxs[i].checked === true && (tableNow.contains(checkboxs[i]) === false))
                    checkboxs[i].checked = false;
            }
            return true;
        } else {
            alert('复选框最多只能选择两项，且不能不选');
            return false;
        }
    }

    document.addEventListener('DOMContentLoaded', showTable);

    professionSelect = document.querySelector('#inputProfession');
    professionSelect.addEventListener('change', showTable);

    window.onsubmit = validate;
</script>
</body>
</html>