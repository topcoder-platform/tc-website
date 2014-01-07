<%--
  - Author: pulky, pvmagacho, TCSASSEMBER
  - Version: 1.5
  - Copyright (C) 2001 - 2011 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page present registration page for a specific contest.
  -
  - Version 1.1 (Configurable Contest Terms-Studio Release Assembly v1.0) changes: Added new functionality that asks for
  - several terms of use and show those the user already agreed to.
  - Version 1.2 (Studio Electronic Assignment Document Assembly version 1.0) changes:
  -     - Change the registration process.
  - Version 1.3 (Re-platforming Studio Release 2 assembly) change notes: updated to use different model for contest.
  - Version 1.4 (Re-platforming Studio Release 4 assembly) change notes: clean up old studio model files.
  - Version 1.5 (Release Assembly - TopCoder Studio CCA Integration) change notes: Add support for the new terms of use
  - - logic, support the terms of use group and terms of use dependencies.
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
<c:set var="NON_ELEC_AGREEABLE_TERMS_TYPE_ID" value="<%=new Integer(Constants.NON_ELEC_AGREEABLE_TERMS_TYPE_ID)%>"/>
<c:set var="contest" value="${requestScope.contest}"/>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
        <link href="/css/popup/modalPopup.css" type="text/css"  rel="stylesheet" />        
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
        <script src="/js/modalPopup.js" type="text/javascript"></script>
        <script type="text/javascript">
        <!--
        function togGroup(link, index) {
            var obj = document.getElementById("groupTitle" + index);
            var co = document.getElementById("group" + index);
            if (obj.className.indexOf("term_group_exp") != -1) {
                co.style.display = "none";
                obj.className = obj.className.replace("term_group_exp", "term_group_col");
            } else {
                co.style.display = "block";
                obj.className = obj.className.replace("term_group_col", "term_group_exp");
            }
            if (link.blur) link.blur();
        }
        function goBack() {
            var pre = '${prePendingTerms}';
            var pres = pre.split(",");
            if (pre.length > 0 && pres.length > 0) {
                var tid = pres[pres.length - 1];
                pres.splice(pres.length - 1, 1);
                pre = pres.join(",");
                location.href = '/?module=ViewRegistration&${CONTEST_ID}=${contest.id}&${TERMS_OF_USE_ID}=' + tid + '&<%=Constants.PRE_PENDING_TERMS%>=' + pre;
            } else {
                location.href = '/?module=ViewRegistration&${CONTEST_ID}=${contest.id}';
            }
            return false;
        }
        // -->
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
                                        <studio:forumLink forumID="${contest.info[4].value}" />
                                    </div>
                                    <div class="breadcrumb">
                                        <a href="${sessionInfo.servletPath}?module=ViewActiveContests">Active Challenges</a> 
                                        &gt; ${contest.projectName}
                                    </div>
                                    <br />
                                    <h1>Challenge Registration</h1>

                                    <div align="center">
                                        <form name="terms" method="POST" action="${sessionInfo.servletPath}?${CONTEST_ID}=${contest.id}&<%=Constants.PRE_PENDING_TERMS%>=${prePendingTerms}">
                                            <tc-webtag:hiddenInput name="${MODULE_KEY}" value="Register" />
                                            <tc-webtag:hiddenInput name="${CONTEST_ID}" />
                                            <c:choose>
                                                <c:when test="${not empty terms}">
                                                    <c:choose>
                                                        <c:when test="${empty dependenciesTermsPending}">
                                                            <tc-webtag:hiddenInput name="${TERMS_OF_USE_ID}" value="${terms.termsOfUseId}"/>
                                                            <c:if test="${terms.agreeabilityType.termsOfUseAgreeabilityTypeId != NON_ELEC_AGREEABLE_TERMS_TYPE_ID}">
                                                                <div align="center" style="padding-top: 20px;">
                                                                    Please read through the following terms and then click
                                                                    <strong>"I Agree"</strong> when you're done.
                                                                </div>
                                                            </c:if>
                                                            <div align="center" style="padding-top: 20px;">${terms.title}</div><br/>
                                                            <iframe width="590" height="300" marginWidth="5"
                                                                src="${sessionInfo.servletPath}?module=Terms&amp;${TERMS_OF_USE_ID}=${terms.termsOfUseId}">
                                                            </iframe>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <table class="leftalign penddingTermsTable">
                                                            <tr><td style="text-align:center;">${terms.title}</td></tr>
                                                            <c:if test="${not empty dependenciesTermsAgreed}">
                                                            <tr><td><br/>
                                                                You have the following terms (which you have agreed to) for ${terms.title}:<br/>
                                                                <ul>
                                                                    <c:forEach items="${dependenciesTermsAgreed}" var="dep_terms_agreed_item">
                                                                        <li>
                                                                            ${dep_terms_agreed_item.title}
                                                                            <c:choose>
                                                                                <c:when test="${dep_terms_agreed_item.agreeabilityType.termsOfUseAgreeabilityTypeId == NON_ELEC_AGREEABLE_TERMS_TYPE_ID}">
                                                                                    <a href="${dep_terms_agreed_item.url}">(View)</a>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <a href="/?module=Terms&tuid=${dep_terms_agreed_item.termsOfUseId}" target="_blank">(View)</a>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </li>
                                                                    </c:forEach>
                                                                </ul>
                                                            </td></tr>
                                                            </c:if>
                                                            <c:if test="${not empty dependenciesTermsPending}">
                                                            <tr><td><br/>
                                                                You have the following terms pending for agreement before you can read and agree to ${terms.title}:<br/>
                                                                <ul>
                                                                    <c:forEach items="${dependenciesTermsPending}" var="dep_terms_pending_item">
                                                                        <li>
                                                                            ${dep_terms_pending_item.title}
                                                                            <a href="/?module=ViewRegistration&${CONTEST_ID}=${contest.id}&tuid=${dep_terms_pending_item.termsOfUseId}&prePendingTerms=${prePendingTerms}">(View and agree)</a>
                                                                        </li>
                                                                    </c:forEach>
                                                                </ul>
                                                            </td></tr>
                                                            </c:if>
                                                            </table>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:when>
                                                <c:otherwise>
                                                     <table class="leftalign">
                                                         <c:if test="${not empty terms_agreed}">
                                                            <tr>
                                                                <td>
                                                                    The following terms of use apply to this project:
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    You have agreed to:<br/>
                                                                    <c:forEach items="${terms_agreed}" var="terms_agreed_item_group">
                                                                    <c:forEach items="${terms_agreed_item_group}" var="terms_agreed_item">
                                                                        <ul>
                                                                            <li>
                                                                                ${terms_agreed_item.title}
                                                                                <c:choose>
                                                                                    <c:when test="${terms_agreed_item.agreeabilityType.termsOfUseAgreeabilityTypeId == NON_ELEC_AGREEABLE_TERMS_TYPE_ID}">
                                                                                        <a href="${terms_agreed_item.url}">(View)</a>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <a href="/?module=Terms&tuid=${terms_agreed_item.termsOfUseId}" target="_blank">(View)</a>
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </li>
                                                                        </ul>
                                                                    </c:forEach>
                                                                    </c:forEach>
                                                                </td>
                                                            </tr>
                                                        </c:if>
                                                        <c:if test="${not empty terms_group}">
                                                        <tr>
                                                            <td>
                                                                <div class="term_title">
                                                                The following groups of terms of use apply to this project.<br/>
                                                                You need to agree to at least one of the groups of terms before you can register:
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <c:forEach items="${terms_group}" var="terms_group_item" varStatus="vars">
                                                        <tr>
                                                            <td>
                                                                <div class="term_group term_group_exp" id="groupTitle${vars.index}"><a href="#" onclick="togGroup(this, ${vars.index});return false;" class="term_group_icon"></a><div class="term_group_box" style="width:430px;"><strong>Group ${vars.count}</strong></div><div style="clear:both;"></div></div>
                                                                <div class="term_group_content" id="group${vars.index}">
                                                                <c:if test="${terms_group_has_agreed[vars.index]}">
                                                                    You have agreed to:<br/>
                                                                    <ul>
                                                                    <c:forEach items="${terms_group_item}" var="tou_item">
                                                                        <c:if test="${terms_status[tou_item.termsOfUseId]}">
                                                                        <li>
                                                                            ${tou_item.title}
                                                                            <c:choose>
                                                                                <c:when test="${tou_item.agreeabilityType.termsOfUseAgreeabilityTypeId == NON_ELEC_AGREEABLE_TERMS_TYPE_ID}">
                                                                                    <a href="${tou_item.url}">(View)</a>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <a href="/?module=Terms&tuid=${tou_item.termsOfUseId}" target="_blank">(View)</a>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </li> 
                                                                        </c:if>
                                                                    </c:forEach>
                                                                    </ul>
                                                                </c:if>
                                                                You have the following terms pending for agreement:
                                                                <ul>
                                                                <c:forEach items="${terms_group_item}" var="tou_item">
                                                                    <c:if test="${not terms_status[tou_item.termsOfUseId]}">
                                                                        <li>
                                                                            ${tou_item.title}
                                                                            <a href="/?module=ViewRegistration&${CONTEST_ID}=${contest.id}&tuid=${tou_item.termsOfUseId}&prePendingTerms=${prePendingTerms}">(View and agree)</a>
                                                                        </li> 
                                                                    </c:if>
                                                                </c:forEach>
                                                                </ul>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        </c:forEach>
                                                        </c:if>
                                                    </table>
                                                </c:otherwise>
                                            </c:choose>
                    
                                            <br /> <br />
                                            <!-- could also use <input>'s button <button> gives you more display freedom and is documented on w3c -->
                                            <!-- resulting page from click has value at the end of the URL, which is pointless. Feel free to use any html/js element/method but i want the nice looking button -->

                                            <div align="center">
                                                <c:choose>
                                                    <c:when test="${not empty terms and empty dependenciesTermsPending}">
                                                        <c:choose>
                                                            <c:when test="${terms.agreeabilityType.termsOfUseAgreeabilityTypeId != NON_ELEC_AGREEABLE_TERMS_TYPE_ID}">
                                                                <div align="center" class="bigRed"
                                                                    style="width: 590px">
                                                                    <tc-webtag:errorIterator
                                                                        id="err" name="${TERMS_AGREE}">
                                                                        ${err} <br />
                                                                    </tc-webtag:errorIterator>
                                                                </div>
                                                                <INPUT TYPE="checkbox" NAME="${TERMS_AGREE}" id="agreechk" onclick="if (this.checked) document.getElementById('conbtn').disabled = ''; else document.getElementById('conbtn').disabled = 'disabled';"/>
                                                                I Agree to the Terms and Conditions stated above&#160; <br /> <br />
                                                                    <c:choose>
                                                                        <c:when test="${not empty has_global_ad and has_global_ad}">
                                                                            <%-- HAVE AD --%>
                                                                            <input type="image" src="/i/v2/interface/btnContinue.png" />
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                        <%-- NO AD --%>
                                                                            <input type="image" src="/i/v2/interface/btnContinue.png" class="show-modal-register"/>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                    <input type="image" src="/i/v2/interface/btnCancel.png" onclick="return goBack()" name="Cancel" value="Cancel"/>
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
                                                                <input type="image" src="/i/v2/interface/btnCancel.png" onclick="return goBack()" name="Cancel" value="Cancel"/>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:if test="${empty terms_group and empty terms}">
                                                        <c:choose>
                                                            <c:when test="${not empty has_global_ad and has_global_ad}">
                                                                <%-- HAVE AD --%>
                                                                <input type="image" src="/i/v2/interface/btnRegister.png" />
                                                            </c:when>
                                                            <c:otherwise>
                                                            <%-- NO AD --%>
                                                                <input type="image" src="/i/v2/interface/btnRegister.png" class="show-modal-register"/>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <br /><br />
                                                        </c:if>
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
