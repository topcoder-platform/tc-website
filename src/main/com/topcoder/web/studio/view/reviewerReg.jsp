<%@ page import="com.topcoder.web.studio.Constants"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag"%>
<%@ taglib uri="studio.tld" prefix="studio"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set value="<%=Constants.MODULE_KEY%>" var="MODULE_KEY"/>
<c:set value="<%=Constants.CONTEST_ID%>" var="CONTEST_ID"/>
<c:set value="<%=Constants.TERMS_OF_USE_ID%>" var="TERMS_OF_USE_ID"/>
<c:set value="<%=Constants.TERMS_AGREE%>" var="TERMS_AGREE"/>
<c:set var="NON_ELEC_AGREEABLE_TERMS_TYPE_ID" value="<%=new Integer(Constants.NON_ELEC_AGREEABLE_TERMS_TYPE_ID)%>"/>
<c:if test="${isSpecReview}">
    <c:set var="REGISTER_REVIEW_KEY" value="SpecReviewRegistration"/>
    <c:set var="VIEW_REVIEW_TERMS_KEY" value="SpecViewReviewTerms"/>
</c:if>
<c:if test="${not isSpecReview}">
    <c:set var="REGISTER_REVIEW_KEY" value="ReviewRegistration"/>
    <c:set var="VIEW_REVIEW_TERMS_KEY" value="ViewReviewTerms"/>
</c:if>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>TopCoder Studio : Reviewer Registration</title>
        <jsp:include page="style.jsp">
            <jsp:param name="key" value="tc_studio" />
        </jsp:include>
        <script src="/js/NewStyleHeaderFooter/jquery-1.2.6.min.js" type="text/javascript"></script>
        <script src="/js/NewStyleHeaderFooter/preloadCssImages.jQuery_v5.js" language="javascript"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                //Run the script to preload images from CSS
                $.preloadCssImages();
            });
        </script>
        <script src="/js/NewStyleHeaderFooter/jquery.hoverIntent.minified.js" type="text/javascript"></script>
        <script src="/js/NewStyleHeaderFooter/scripts.js" type="text/javascript"></script>
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
                    location.href = '/?module=${VIEW_REVIEW_TERMS_KEY}&${CONTEST_ID}=${contest.id}&tuid=' + tid + '&<%=Constants.PRE_PENDING_TERMS%>=' + pre;
                } else {
                    location.href = '/?module=${VIEW_REVIEW_TERMS_KEY}&${CONTEST_ID}=${contest.id}';
                }
                return false;
            }
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
                                        <a href="${sessionInfo.servletPath}?module=ViewReviewOpportunities">Review Opportunities</a> 
                                        &gt; ${contest.projectName}
                                    </div>
                                    <br />
                                    <h1>Review Registration</h1>
                                    
                                    <div align="center">
                                        <form action="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=${REGISTER_REVIEW_KEY}&<%=Constants.CONTEST_ID%>=${contest.id}&<%=Constants.PRE_PENDING_TERMS%>=${prePendingTerms}" method="POST" name="frmTerms">
                                        <table border="0" cellspacing="0" cellpadding="5" width="600" class="leftalign">
                                            <c:choose>
                                                <c:when test="${not empty terms}">
                                                    <c:choose>
                                                        <c:when test="${empty dependenciesTermsPending}">
                                                            <input type="hidden" name="<%=Constants.TERMS_OF_USE_ID%>"
                                                                value="${terms.termsOfUseId}"/>
                                                            <tr>
                                                                <td style="text-align:center;">
                                                                    <strong>${terms.title}</strong>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <iframe width="590" height="300" marginWidth="5"
                                                                        src="${sessionInfo.servletPath}?module=Terms&amp;${TERMS_OF_USE_ID}=${terms.termsOfUseId}">
                                                                    </iframe>
                                                                </td>
                                                            </tr>
                                                            <c:choose>
                                                                <c:when test="${terms.agreeabilityType.termsOfUseAgreeabilityTypeId != NON_ELEC_AGREEABLE_TERMS_TYPE_ID}">
                                                                    <tr>
                                                                        <td class="errorText">
                                                                            <font color="red"><tc-webtag:errorIterator id="err" name="${TERMS_AGREE}">${err}
                                                                            </tc-webtag:errorIterator></font>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            I Agree to the Terms and Conditions stated above&#160;
                                                                            <input name="${TERMS_AGREE}" type="checkbox" id="agreechk" onclick="if (this.checked) document.getElementById('conbtn').disabled = ''; else document.getElementById('conbtn').disabled = 'disabled';"/>
                                                                        </td>
                                                                    </tr>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <tr><td>
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
                                                                    </td></tr>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <tr><td style="text-align:center;"><strong>${terms.title}</strong></td></tr>
                                                            <c:if test="${not empty dependenciesTermsAgreed}">
                                                                <tr><td>You have the following terms (which you have agreed to) for ${terms.title}:</td></tr>
                                                                <tr><td><ul style="margin-left:40px;">
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
                                                                </ul></td></tr>
                                                            </c:if>
                                                            <c:if test="${not empty dependenciesTermsPending}">
                                                                <tr><td>You have the following terms pending for agreement before you can read and agree to ${terms.title}:</td></tr>
                                                                <tr><td><ul style="margin-left:40px;">
                                                                    <c:forEach items="${dependenciesTermsPending}" var="dep_terms_pending_item">
                                                                        <li>
                                                                            ${dep_terms_pending_item.title}
                                                                            <a href="/?module=${VIEW_REVIEW_TERMS_KEY}&${CONTEST_ID}=${contest.id}&${TERMS_OF_USE_ID}=${dep_terms_pending_item.termsOfUseId}&prePendingTerms=${prePendingTerms}">(View and agree)</a>
                                                                        </li>
                                                                    </c:forEach>
                                                                </ul></td></tr>
                                                            </c:if>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:if test="${not empty terms_agreed}">
                                                        <c:forEach items="${terms_agreed}" var="terms_agreed_item_grp" varStatus="vss">
                                                        <tr>
                                                            <td>
                                                                The following terms of use (that you already agreed to) apply to the review roles (${terms_agreed_roles[vss.index]}):
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <c:forEach items="${terms_agreed_item_grp}" var="terms_agreed_item">
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
                                                            </td>
                                                        </tr>
                                                        </c:forEach>
                                                    </c:if>
                                                    <c:choose>
                                                        <c:when test="${not empty terms_group}">
                                                            <tr>
                                                                <td>
                                                                    <div class="term_title">
                                                                    The following groups of terms of use apply to the roles:${common_resource_roles}. <br/>
                                                                    You need to agree to at least one of the groups of terms before you can register:
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <c:forEach items="${terms_group}" var="terms_group_item" varStatus="vars">
                                                            <tr>
                                                                <td>
                                                                    <div class="term_group term_group_exp" id="groupTitle${vars.index}"><a href="#" onclick="togGroup(this, ${vars.index});return false;" class="term_group_icon"></a><div class="term_group_box"><strong>Group ${vars.count}</strong></div><div style="clear:both;"></div></div>
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
                                                                                <a href="/?module=${VIEW_REVIEW_TERMS_KEY}&${CONTEST_ID}=${contest.id}&${TERMS_OF_USE_ID}=${tou_item.termsOfUseId}&prePendingTerms=${prePendingTerms}">(View and agree)</a>
                                                                            </li> 
                                                                        </c:if>
                                                                    </c:forEach>
                                                                    </ul>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            </c:forEach>
                                                        </c:when>
                                                    </c:choose>
                                                </c:otherwise>
                                            </c:choose>

                                        <c:choose>
                                            <c:when test="${not empty terms and empty dependenciesTermsPending}">
                                                <tr>
                                                    <td style="text-align:center;">
                                                        <c:set value="Go back" var="returnMessage"/>
                                                        <c:if test="${terms.agreeabilityType.termsOfUseAgreeabilityTypeId != NON_ELEC_AGREEABLE_TERMS_TYPE_ID}">
                                                            <input type="image" src="/i/v2/interface/btnContinue.png"/>
                                                            <c:set value="Cancel" var="returnMessage"/>
                                                        </c:if>

                                                        <input type="image" src="/i/v2/interface/btnCancel.png" onclick="return goBack()" name="Cancel" value="${returnMessage}"/>
                                                    </td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <c:if test="${empty terms_group and empty terms}">
                                                    <tr>
                                                        <td style="text-align:center;"><br/>
                                                            <input type="image" src="/i/v2/interface/btnContinue.png"/>
                                                        </td>
                                                    </tr>
                                                </c:if>
                                            </c:otherwise>
                                        </c:choose>
                                        </table>
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