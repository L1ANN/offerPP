<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>首页 |offer++</title>
    <meta charset="utf-8">
    <link href="<c:url value="/css/bootstrap.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/selfstyle_indexlogin.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/zzhsj.css"/>" rel="stylesheet">
</head>
<body>
<!--导航栏-->
<c:import url="header_login.jsp" charEncoding="UTF-8"/>
<!--正文-->
<div class="container containerA">
    <div class="row">
        <div class="col-md-2 col-lg-2"></div>
        <div class="col-md-6 col-lg-6 leftcontainer">

            <div class="leftpage">

                <div class="left_first">
                    <div class="slogn">让最好的人才,</div>
                    <br>
                    <div class="slogn">遇见合适的机会</div>

                    <form class="jobfind" action="${pageContext.request.contextPath}/position/query.action" method="post">
                        <div class="input-group input-group-lg">
                            <div class="input-group-addon"><span class="glyphicon glyphicon-search"></span></div>

                            <input type="text" class="form-control" id="jobfind" name="name" placeholder="请输入要查找的职位"
                                   value="<c:if test="${name!=null}">${name}</c:if>">

                            <div class="input-group-addon jobsearchright">
                                <button class="jobsearch btn btn-info" type="submit">搜索职位</button>
                            </div>
                        </div>
                    </form>


                </div>


                <div class="left_second">

                    <div class="heading">
                        <span class="text_1">我们为您推荐的职位</span>

                        <a href="${pageContext.request.contextPath}/user/myCollection.action"" class="mycollection"><!--<span class="glyphicon glyphicon-heart-empty"></span>-->
                            <span class="heart_collection"><img class="collection" src="<c:url value="/img/heartcollection.png"/>"></span><span class="collection_text">&nbsp;职位收藏</span>
                        </a>
                    </div>

                    <c:forEach items="${positionQueries}" var="positionVo">
                        <div class="onejob row">

                            <div class="left col-md-7 col-lg-7">
                                <p class="jobname">
                                    <a href="${pageContext.request.contextPath}/position/detail.action?id=${positionVo.pkPositionId}"
                                       class="joblink">${positionVo.positionName}</a>
                                    <img src="
                            <c:if test="${positionVo.collectionFlag!=null}">
                            <c:url value="/img/hearton.png"/>
                            </c:if>

                            <c:if test="${positionVo.collectionFlag==null}">
                            <c:url value="/img/heartoff.png"/>
                            </c:if>
                                     " class="heart" id="heart${positionVo.pkPositionId}"
                                         onclick="changeHeart('${positionVo.pkPositionId}','heart${positionVo.pkPositionId}','collect${positionVo.pkPositionId}')">
                                    <span style="display: none;" class="collect"
                                          id="collect${positionVo.pkPositionId}">已收藏</span>
                                </p>

                                <p class="jobinfo">
                                    <span class="glyphicon glyphicon-record sign"></span>
                                    <span class="payment experience">${positionVo.positionSalary}</span>
                                    <span class="experience">
                                        <c:if test="${positionVo.positionExperiment!=null}">
                                        ${positionVo.positionExperiment}
                                        </c:if>
                                        <c:if test="${positionVo.positionExperiment==null}">
                                        不限工作经历
                                        </c:if>
                                    </span>
                                    <span class="experience">
                                        <c:if test="${positionVo.positionEducation!=null}">
                                            ${positionVo.positionEducation}
                                        </c:if>
                                        <c:if test="${positionVo.positionEducation==null}">
                                                不限教育经历
                                        </c:if>
                                    </span>
                                </p>

                                <p class="skillsline">
                                    <c:forEach items="${positionVo.skills}" var="skill">
                                        <span class="skills">${skill}</span>
                                    </c:forEach>

                                </p>

                            </div>

                            <div class="right col-md-5 col-lg-5 ">
                                <p class="companyname">${positionVo.companyName}</p>
                                <p class="companyinfo">
                                    <span>${positionVo.positionPlace}</span> |
                                    <span>${positionVo.companyIndustry}</span> |
                                    <span>${positionVo.positionProperty}</span>
                                </p>

                                <p class="companyprofit">${positionVo.positionWelfare}</p>

                            </div>

                        </div>
                    </c:forEach>

                    <!--分页栏-->
                    <a href="${pageContext.request.contextPath}/position/query.action" class="findmorejob">
                        更多职位
                    </a>

                </div>

                <div class="left_three">
                    <div class="heading">
                        优秀合作企业
                    </div>

                    <div class="row imgsline">
                        <div class="col-md-2 col-lg-2">
                            <img class="company" src="<c:url value="/img/alibaba.svg"/>"  />
                        </div>

                        <div class="col-md-2 col-lg-2">
                            <img class="company" src="<c:url value="/img/2mayi.svg"/>" />
                        </div>
                        <div class="col-md-2 col-lg-2">
                            <img class="company" src="<c:url value="/img/3wangyi.svg"/>"/>
                        </div>
                        <div class="col-md-2 col-lg-2">
                            <img class="company" src="<c:url value="/img/458.svg"/>"/>
                        </div>
                        <div class="col-md-2 col-lg-2">
                            <img class="company" src="<c:url value="/img/5.svg"/>"/>
                        </div>
                        <%--<div class="col-md-2 col-lg-2">--%>
                            <%--<img src="<c:url value="/img/6zhihu.svg"/>"/>--%>
                        <%--</div>--%>
                    </div>

                    <div class="row imgsline">
                        <div class="col-md-2 col-lg-2">
                            <img class="company" src="<c:url value="/img/7groupon.svg"/>"/>
                        </div>

                        <div class="col-md-2 col-lg-2">
                            <img class="company" src="<c:url value="/img/8share.svg"/>"/>
                        </div>
                        <div class="col-md-2 col-lg-2">
                            <img class="company" src="<c:url value="/img/9womply.svg"/>"/>
                        </div>
                        <div class="col-md-2 col-lg-2">
                            <img class="company" src="<c:url value="/img/10y_media_labs.svg"/>"/>
                        </div>
                        <div class="col-md-2 col-lg-2">
                            <img class="company" src="<c:url value="/img/11euclid.svg"/>"/>
                        </div>
                        <%--<div class="col-md-2 col-lg-2">--%>
                            <%--<img src="<c:url value="/img/12insightly.svg"/>"/>--%>
                        <%--</div>--%>
                    </div>


                </div>


            </div>

        </div>

        <!--右侧窗口-->
        <div class="col-md-3 col-lg-3 rightaction">
            <div class="rightpage">
                <!--右侧个人窗口-->
                <div class="right_first">
                    <div class="row">
                        <div class="col-md-4 col-lg-4 col-md-offset-3 col-md-offset-3">
                            <c:if test="${user.userIcon==null || user.userIcon==''}">
                                <img src="<c:url value="/img/talent_blank.jpg-200w"/>" class="head img-circle" id="head">
                            </c:if>

                            <c:if test="${user.userIcon!=null && user.userIcon!=''}">
                                <img src="/pic/${user.userIcon}" class="head img-circle" id="head">
                            </c:if>
                        </div>
                    </div>

                    <div class="userinfo">
                        <span class="username">${user.userName}</span>
                    </div>

                    <div class="jobwantline">
                        <c:if test="${user.userStation!=null}">
                            <span class="jobwant">${user.userStation}</span>
                        </c:if>

                    </div>

                    <div class="userinfo">
                        <c:if test="${user.userStation!=null}">
                            <span class="glyphicon glyphicon-map-marker"></span>
                            ${user.userAddressCity}
                        </c:if>
                    </div>

                    <div class="userinfo">
                        <c:if test="${user.userStation!=null}">
                            <span class="glyphicon glyphicon-tag"></span>
                            ${user.userExperience}
                        </c:if>

                    </div>


                </div>

                <!--右侧下方二维码窗口-->
                <div class="right_second">

                    <div class="welcome">欢迎扫描下方二维码,</div>
                    <div class="welcome">联系我们获取更多信息</div>
                    <img src="<c:url value="/img/code.png"/>" class="twocode">

                </div>

            </div>

        </div>

    </div>

</div>
<!--页尾-->
<c:import url="footer.jsp" charEncoding="UTF-8"/>
<!--script脚本-->
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.js"/>"></script>

<script type="text/javascript">

    <!--收藏按钮JS-->
    //pid:职位id  heart：图片id  collection：已收藏文字的id
    function changeHeart(pid, heart, collection) {
        element = document.getElementById(heart)
        //如果没有收藏该职位，收藏，并将心变色，显示已收藏文字
        if (element.src.match("heartoff")) {
            $.ajax({
                url: "${pageContext.request.contextPath}/user/addCollection.action",
                type: "post",
                data: {
                    "pid": pid
                },
                success: function (data) {
                    if (data.result == "1") {
                        element.src = "<c:url value="/img/hearton.png"/>";
                        collect_remind(heart, collection);
                    } else {
                        alert("添加收藏失败！")
                    }
                },
                error: function () {
                    alert("添加收藏失败！");
                }
            });
        }
        //如果收藏该职位，取消收藏，将红心变色
        else {
            $.ajax({
                url: "${pageContext.request.contextPath}/user/deleteCollection.action",
                type: "post",
                data: {
                    "pid": pid
                },
                success: function (data) {
                    if (data.result == "1") {
                        element.src = "<c:url value="/img/heartoff.png"/>";
                        collect_remind(heart, collection);
                    } else {
                        alert("取消收藏失败！");
                    }
                },
                error: function () {
                    alert("取消收藏失败！");
                }
            });
        }

    }

    function collect_remind(heart, collection) {
        if (document.getElementById(heart).src.match("hearton")) {
            document.getElementById(collection).style.display = "inline-block";
            setTimeout(function () {
                document.getElementById(collection).style.display = "none";
            }, 1500);

        }
    }

</script>
</body>
</html>
