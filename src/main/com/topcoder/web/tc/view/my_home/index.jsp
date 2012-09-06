<%--
  - Author: isv, pvmagacho, TCSDEVELOPER
  - Version: 1.5 (BUG#TCCC-3348)
  - Copyright (C) 2010 - 2012 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page renders the Home page displayed to TopCoder member. It renders the details on user
  - account (name, address, phone, etc) as well as navigation links to various areas providing other user account
  - details and web forms for setting the user preferences.
  -
  - Member Payment Improvements Release assembly v1.0 changes:
  - Added "Payment Preferences" link pointing to Edit Payment Preferences screen
  -
  - Member Payment Improvements Release assembly v1.0 changes:
  - Added photo modal window and corresponding logic.
  -
  - Changes in 1.2 (Assembly - Upload Avatar to TC):
  - - Removed old submit photo link.
  - - Image file name is retrieved from request attribute with path + filename.
  - 
  - Changes in 1.3 (BUG#TCCC-3348):
  - - Change image popup class for compatibily with Member Profile page.
  -
  - Changes in 1.4 (Release Assembly - TopCoder Member Photo Uploader Improvement):
  - - Changed the dimension of Uploaded Image area and text in photo uploaded popup to reflect 400x400 dimension.
  -
  - Version 1.5 (Release Assembly - TopCoder Member Photo Uploader Improvement) changes: updated logic for displaying 
  - member photos. Added logic for uploading member photo image.
--%>

<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=utf-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>

<head>
    <title>TopCoder - My TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    
    <script type="text/javascript" src="/js/jquery-1.4.1.min.js"></script>
    <script type="text/javascript" src="/js/jquery.form.js"></script>
    <script type="text/javascript" src="/js/jquery.Jcrop.js"></script>
    <script type="text/javascript" src="/js/photo.js"></script> 
    
    <link type="text/css" href="/css/jquery.Jcrop.css" rel="stylesheet"/>
    <link type="text/css" href="/css/photo.css" rel="stylesheet"/>
    
    <script type="text/javascript">
        var previewPath = <%= request.getParameter("previewPath") == null ? null : "\'"  + request.getParameter("previewPath") + "\'" %>;
        var originalFile = <%= request.getParameter("originalFileName") == null ? null : "\'"  + request.getParameter("originalFileName") + "\'" %>;
    </script>
    
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
                            <a href="https://www.topcoder.com/reg/?nrg=false">Update</a>
                        </td>
                    </tr>
                    <tr class="light">
                        <td class="valueC B" rowspan="10" nowrap="nowrap" style="vertical-align: middle;">
                            <c:choose>
                                <c:when test="${userImage!=null}">
                                    <div>
                                        <a href="/tc?module=MemberProfile&amp;cr=${regUser.id}">
                                            <img src="${cf:getResizedImagePath(pathImage, 126, 140)}" name="image_path" alt="" class="memberPhoto" />
                                        </a>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <a href="javascript:;" id="submitPhotoLink">
                                        <img src="/i/member_photo_upload_default.png" name="image_path" alt="" class="memberPhoto"/>
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
                            <p><a href="https://www.topcoder.com/reg/?nrg=false">Add registrations</a></p>
                            <c:if test="${isInHS}">
                                <p><a href="/tc?module=HSViewUnregister">Unregister from TCHS</a></p>
                            </c:if>
                            <p><a href="https://www.topcoder.com/reg/?nrg=false">Update my profile</a></p>
                            <p class="<c:if test='${userImage!=null}'>hide</c:if>"><a href="javascript:;" class="submitPhotoLink" >Submit a photo</a></p>
                            <p class="<c:if test='${userImage==null}'>hide</c:if>"><a href="javascript:;" id="removePhotoLink">Remove photo</a></p>
                            <c:choose>
                                <c:when test="${(payoneerActivated==false) && (not empty payoneerRegLink)}">
                                    <p><a href="${payoneerRegLink}">Register with Payoneer</a></p>
                                </c:when>
                            </c:choose>
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

<jsp:include page="../photoUploadPopup.jsp"/>

<c:if test="${userImage!=null}">
    <div class="photoPopup popupRemovePhoto transparent hide">
        <div class="popupWindow">
            <div class="title">REMOVE PHOTO</div>
            
            <div class="content">
                <img src="${cf:getResizedImagePath(pathImage, 126, 140)}" alt="" />
                
                <div class="text">
                    Are you sure to remove this photo?
                </div>
                
                <a href="javascript:;" class="btn1 btnNo">
                    <span class="rightSide">
                    <span class="inner">
                          No                                               
                       </span>                                                  
                   </span>                                         
                </a>
                
                <a href="javascript:;" class="btn1 red btnYes">
                    <span class="rightSide">
                    <span class="inner">
                          Yes                                               
                       </span>                                                  
                   </span>                                         
                </a>
                
            </div>
        </div>
    </div>        
</c:if>

</body>

</html>
