<%--
  - Author: pulky
  - Version: 1.1
  - Copyright (C) 2001 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page present registration page for a specific contest.
  -
  - Version 1.1 (Configurable Contest Terms-Studio Release Assembly v1.0) changes: Added new functionality that asks for
  - several terms of use and show those the user already agreed to.
--%>
<%@ page import="com.topcoder.web.studio.Constants"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag"%>
<%@ taglib uri="studio.tld" prefix="studio"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- Constant definition to avoid use of scriptlets in the JSP body --%>
<c:set value="<%=Constants.MODULE_KEY%>" var="MODULE_KEY"/>
<c:set value="<%=Constants.CONTEST_ID%>" var="CONTEST_ID"/>
<c:set value="<%=Constants.TERMS_OF_USE_ID%>" var="TERMS_OF_USE_ID"/>
<c:set value="<%=Constants.TERMS_AGREE%>" var="TERMS_AGREE"/>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>TopCoder Studio : Contest Registration</title>
        <jsp:include page="style.jsp">
            <jsp:param name="key" value="tc_studio" />
        </jsp:include>

        <script src="/js/NewStyleHeaderFooter/jquery-1.2.6.min.js" type="text/javascript"/>
        <script src="/js/NewStyleHeaderFooter/preloadCssImages.jQuery_v5.js" language="javascript"/>
        <script type="text/javascript">
            $(document).ready(function(){
                //Run the script to preload images from CSS
                $.preloadCssImages();
            });
        </script>
        <script src="/js/NewStyleHeaderFooter/jquery.hoverIntent.minified.js" type="text/javascript"/>
        <script src="/js/NewStyleHeaderFooter/scripts.js" type="text/javascript"/>
        <script type="text/javascript" language="javascript">
            $(document).ready(function(){
                $("#nav ul li").hoverIntent(function(){
                    $(this).children("ul").slideDown("fast");
                }, function() {
                    $(this).children("ul").slideUp("fast");
                });

                $("#nav ul ul li").hover(function() {
                    $(this).parents("#nav ul li").children('a').addClass("active-item");
                }, function() {
                    $(this).parents("#nav ul li").children('a').removeClass("active-item");
                });
            });
        </script>
    </head>

    <body>
        <div id="page-wrap">
            <div align="center">
                <jsp:include page="top.jsp">
                    <jsp:param name="section" value="contest" />
                </jsp:include> <br />
                <!-- container -->
                <div id="container">
                    <div id="wrapper"><!-- content -->
                        <div id="content">
                            <div class="contentTop">
                                <div class="contentMiddle">
                                    <div class="linkBox">
                                        <studio:forumLink forumID="${contest.forumId}" />
                                    </div>
                                    <div class="breadcrumb">
                                        <a href="${sessionInfo.servletPath}?module=ViewActiveContests">Active Contests</a> &gt; ${contest.name}
                                    </div>
                                    <br />
                                    <h1>Contest Registration</h1>

                                    <div align="center">
                                        <form name="terms" method="POST" action="${sessionInfo.servletPath}">
                                            <tc-webtag:hiddenInput name="${MODULE_KEY}" value="Register" />
                                            <tc-webtag:hiddenInput name="${CONTEST_ID}" />
                                            <c:if test="${not empty terms}">
                                                <tc-webtag:hiddenInput name="${TERMS_OF_USE_ID}" value="${terms.id}" />
                                            </c:if>
                                            <c:choose>
                                                <c:when test="${not empty terms}">
                                                    <c:if test="${terms.electronicallySignable == 1}">
                                                        <div align="center" style="padding-top: 20px;">
                                                            Please read through the following terms and then click
                                                            <strong>"I Agree"</strong> when you're done.
                                                        </div>
                                                    </c:if>
                                                    <div align="center" style="padding-top: 20px;">
                                                        ${terms.title}
                                                    </div><br />
                                                    <iframe width="590" height="300" marginWidth="5"
                                                        src="${sessionInfo.servletPath}?module=Terms&amp;${TERMS_OF_USE_ID}=${terms.id}">
                                                    </iframe>
                                                </c:when>
                                                <c:otherwise>
                                                    <div align="center" style="padding-top: 20px;">
                                                        The following terms (that you already agreed to) apply to
                                                        this contest:
                                                    </div>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <c:forEach items="${terms_agreed}" var="terms_agreed_item">
                                                                    <ul>
                                                                        <li>${terms_agreed_item.title}
                                                                            <c:choose>
                                                                                <c:when test="${terms_agreed_item.electronicallySignable != 1}">
                                                                                    <a href="${terms_agreed_item.url}" target="_blank">(View)</a>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <a href="${sessionInfo.servletPath}?module=Terms&amp;${TERMS_OF_USE_ID}=${terms_agreed_item.id}"
                                                                                        target="_blank">(View)</a>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </li>
                                                                    </ul>
                                                                </c:forEach>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </c:otherwise>
                                            </c:choose>
                                            <br /> <br />
                                            <!-- could also use <input>'s button <button> gives you more display freedom and is documented on w3c -->
                                            <!-- resulting page from click has value at the end of the URL, which is pointless. Feel free to use any html/js element/method but i want the nice looking button -->

                                            <div align="center">
                                                <c:if test="${not empty has_global_ad and not has_global_ad}">
                                                    <div class="bigRed" style="text-align: left; width: 590px">
                                                        You have not yet signed the Assignment Document that is required
                                                        in order to submit for this contest. Please go
                                                        <a href="/?module=Static&amp;d1=support&amp;d2=assignmentDocFaq">here</a>
                                                        to read more about Assignment Documents and what you need to do.
                                                        You will not be able to submit for this contest without first
                                                        sending in the signed Assignment Document.<br /><br />
                                                    </div>
                                                </c:if>
                                                <c:choose>
                                                    <c:when test="${not empty terms}">
                                                        <c:choose>
                                                            <c:when test="${terms.electronicallySignable == 1}">
                                                                <div align="center" class="bigRed"
                                                                    style="text-align: left; width: 590px">
                                                                    <tc-webtag:errorIterator
                                                                        id="err" name="${TERMS_AGREE}">
                                                                        ${err} <br />
                                                                    </tc-webtag:errorIterator>
                                                                </div>
                                                                <INPUT TYPE="checkbox" NAME="${TERMS_AGREE}" />
                                                                I agree <br /> <br />
                                                                <input type="image" src="/i/v2/interface/btnContinue.png" />
                                                                <br /><br />
                                                            </c:when>
                                                            <c:otherwise>
                                                                <p>
                                                                    You cannot agree to these terms electronically.
                                                                    You must print the terms and send a signed hard copy
                                                                    to TopCoder. You can get a printer friendly version
                                                                    <a href="${terms.url}" target="_blank">here</a>.
                                                                </p>
                                                                <p>
                                                                    For submission by <b>email</b>, send a clear and
                                                                    legible scan or photo of the entire page (completed,
                                                                    signed, and dated) as an attachment to
                                                                    member-agreements@topcoder.com. For submission by
                                                                    <b>fax</b>, you may fax the completed, signed, and
                                                                    dated form (without a cover sheet) to:
                                                                    (US) +1 (860) 631-1027. For submission by
                                                                    <b>mail</b>, send the completed, signed,
                                                                    and dated form to: Attention: Legal Department,
                                                                    TopCoder, Inc., 95 Glastonbury Blvd., Glastonbury,
                                                                    CT 06033.
                                                                </p>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="image" src="/i/v2/interface/btnRegister.png" />
                                                        <br /><br />
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br clear="all" />
                    </div>
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>
        <jsp:include page="foot.jsp" />
    </body>
</html>
