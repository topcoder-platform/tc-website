<%--
  - Author: isv
  - Version: 1.1 (Member Payment Improvements Release assembly v1.0)
  - Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page renders the Home page displayed to TopCoder member. It renders the details on user
  - account (name, address, phone, etc) as well as navigation links to various areas providing other user account
  - details and web forms for setting the user preferences.
  -
  - Member Payment Improvements Release assembly v1.0 changes:
  - Added "Payment Preferences" link pointing to Edit Payment Preferences screen
--%>

<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>

<head>
    <title>TopCoder - My TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="my_topcoder"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="maxWidthBody" align="left">
            
                <jsp:include page="../page_title.jsp" >
                    <jsp:param name="image" value="my_tc"/>
                    <jsp:param name="title" value="&nbsp;"/>
                </jsp:include>

                <table cellspacing="0" cellpadding="0" class="stat" style="width: 100%; margin-bottom: 15px;">
                <tbody>
                    <tr>
                        <td class="header">
                            Personal Information
                        </td>
                        <td class="headerR" colspan="2">
                            <a href="/reg/?nrg=false">Update</a>
                        </td>
                    </tr>
                    <tr class="light">
                        <td class="valueC B" rowspan="10" nowrap="nowrap" style="vertical-align: middle;">
                        <c:choose>
                            <c:when test="${regUser.coder.memberPhoto!=null}">
                                <div>
                                    <a href="/tc?module=MemberProfile&amp;cr=${regUser.id}">
                                        <img src="${regUser.coder.memberPhoto.path.path}${regUser.coder.memberPhoto.fileName}" name="image_path" alt="" class="memberPhoto" />
                                    </a>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <a href="/tc?module=MemberProfile&amp;cr=${regUser.id}">
                                    <img src="/i/m/nophoto_submit.gif" name="image_path" alt="" class="memberPhoto"/>
                                </a>
                            </c:otherwise>
                        </c:choose>
                            <div>                        
                                <tc-webtag:handle coderId='${regUser.id}' />
                                <br /><strong>Member Since:</strong>
                                <br /><fmt:formatDate value="${regUser.coder.memberSince}" pattern="MM.dd.yyyy"/>
                            </div>
                        </td>
                        <td class="field" width="100%">
                            Name:
                        </td>
                        <td class="value">
                            <div style="width: 200px;">
                                ${regUser.firstName} ${regUser.lastName}
                            </div>
                        </td>
                    </tr>
                    <tr class="dark">
                        <td class="field">
                            Company:
                        </td>
                        <td class="value">
                                ${regUser.contact.company.name}
                        </td>
                    </tr>
                    <tr class="light">
                        <td class="field">
                            Address:
                        </td>
                        <td class="value">
                            ${regUser.homeAddress.address1}
                            <c:if test="${not empty regUser.homeAddress.address2}"><br />${regUser.homeAddress.address2}</c:if>
                            <c:if test="${not empty regUser.homeAddress.address3}"><br />${regUser.homeAddress.address3}</c:if>
                            <br />${regUser.homeAddress.city}, 
                            <c:if test="${not empty regUser.homeAddress.state.name}">${regUser.homeAddress.state.name}</c:if>
                            <c:if test="${not empty regUser.homeAddress.province}">${regUser.homeAddress.province}</c:if>
                            ${regUser.homeAddress.postalCode}
                        </td>
                    </tr>
                    <tr class="dark">
                        <td class="field">
                            Country:
                        </td>
                        <td class="value">
                            ${regUser.homeAddress.country.name}
                        </td>
                    </tr>
                    <tr class="light">
                        <td class="field">
                            Country to represent:
                        </td>
                        <td class="value">
                            ${regUser.coder.compCountry.name}
                        </td>
                    </tr>
                    <tr class="dark">
                        <td class="field">
                            Timezone:
                        </td>
                        <td class="value">
                            ${regUser.timeZone.description}
                        </td>
                    </tr>
                    <tr class="light">
                        <td class="field">
                            Phone number:
                        </td>
                        <td class="value">
                            ${regUser.primaryPhoneNumber.number}
                        </td>
                    </tr>
                    <tr class="dark">
                        <td class="field">
                            Email:
                        </td>
                        <td class="value">
                            ${regUser.primaryEmailAddress.address}
                        </td>
                    </tr>
                </tbody>
                </table>

                <div style="clear: both;">
                <table cellpadding="0" cellspacing="0" class="stat" width="100%">
                <tbody>
                    <tr>
                        <td class="header">
                            My Account
                        </td>
                        <td class="header">
                            Preferences
                        </td>
                        <td class="header">
                            Documentation
                        </td>
                        <td class="header">
                            Community
                        </td>
                    </tr>
                    <tr class="light">
                        <td class="value">
                            <p><a href="/reg/?nrg=false">Add registrations</a></p>
                            <c:if test="${isInHS}">
                                <p><a href="/tc?module=HSViewUnregister">Unregister from TCHS</a></p>
                            </c:if>
                            <p><a href="/reg/?nrg=false">Update my profile</a></p>
                            <p>
                                <a href="/tc?module=UserStatic&amp;d1=my_home&amp;d2=submitPhoto">
                                    <c:choose>
                                        <c:when test="${regUser.coder.memberPhoto!=null}">
                                            Submit a photo                                        
                                        </c:when>
                                        <c:otherwise>
                                            Submit a different photo
                                        </c:otherwise>
                                    </c:choose></a>
                            </p>
                        </td>
                        <td class="value">
                            <p><a href="/tc?module=EditPreferences&amp;group=10">Privacy</a></p>
                            <p><a href="/tc?module=EditNotifications">Email notification</a></p>
                            <p><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Settings">Forums preferences</a></p>
                            <p><a href="/tc?module=EditPaymentPreferences">Payment preferences</a></p>
                        </td>
                        <td class="value">
                            <p><a href="/PactsMemberServlet?module=AffidavitHistory">Affidavits</a></p>
                            <p><a href="/PactsMemberServlet?module=PaymentHistory">Payments</a></p>
                            <p><a href="/PactsMemberServlet?module=AssignmentDocumentHistory">Assignment documents</a></p>
                            <p><a href="/tc?module=VisaSelection">Visa letter status</a></p>
                        </td>
                        <td class="value">
                            <p><a href="/tc?module=ViewReferrals">Referrals</a></p>
                            <p><a href="/tc?module=Static&amp;d1=card&amp;d2=description">Cards/Badges</a></p>
                            <%--<p><a href="/wiki/display/~<handle>">Wiki space</a></p>--%>
                        </td>
                    </tr>
                </tbody>
                </table>
                </div>

            </div>
        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
</tbody>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>