<%--
  - Author: isv, pvmagacho, TCSASSEMBLER
  - Version: 1.5
  - Copyright (C) 2010 - 2013 TopCoder Inc., All Rights Reserved.
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
  - Changes in 1.4 (Release Assembly - TopCoder Password Recovery Revamp v1.0 ):
  - - Add a link to add second mail.
  -
  - Changes in 1.5 (Release Assembly - Social Login Linking for Existing User):
  - - Add Add/Remove social login link and auth0 logic.
--%>

<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ page import="com.topcoder.web.tc.Constants"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
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

    <script type="text/javascript" src="/js/jquery.form.js"></script>
    <script type="text/javascript" src="/js/jquery.Jcrop.js"></script>
    <script type="text/javascript" src="/js/photo.js"></script>
    <%--<script type="text/javascript" src="/js/tcscript.js"></script>--%>
    
    <script src="//d19p4zemcycm7a.cloudfront.net/w2/auth0-widget-2.3.6.min.js"></script>
    
    
    <script type="text/javascript">
        var widget = new Auth0Widget({
            domain: '<%=Constants.DOMAIN_AUTH0%>',
            clientID: '<%=Constants.CLIENT_ID_AUTH0%>',
            callbackURL: 'https://<%=ApplicationServer.SERVER_NAME%><%=Constants.BIND_CALLBACK_URL_AUTH0%>'
        });

        function showAuth0Widget(){
            widget.signin({
                icon: 'http://www.topcoder.com/i/24x24_brackets.png', 
                showIcon: true}).on('signin_ready', function() {
                $('.a0-email input').each(function() {
                    $(this)
                    .clone()
                    .attr('type','text')
                    .attr('placeholder', 'Username')
                    .attr('title', 'Username')
                    .insertAfter($(this)).prev().remove();
                });
            });  
        }    
            
        $(function() {
            $('#addSocialLink').click(function() {
                showAuth0Widget();
            });
            
            $('#removeSocialLink').click(function(e) {
                e.preventDefault();
                closeModal();
                adjustAndShow('#removeSocialConfirmModal');
            });
            
            $('.confirmRemoveBtn').click(function() {
                closeModal();
                adjustAndShow('#preloaderModal');
                window.location = $('#removeSocialLink').attr('href');
            });
        });
    </script>    
    
    <link type="text/css" href="/css/jquery.Jcrop.css" rel="stylesheet"/>
    <link type="text/css" href="/css/photo.css" rel="stylesheet"/>

    <script type="text/javascript">
        var previewPath = <%= request.getParameter("previewPath") == null ? null : "\'"  + URLEncoder.encode(request.getParameter("previewPath"), "UTF-8").replaceAll("%2F", "/") + "\'" %>;
        var originalFile = <%= request.getParameter("originalFileName") == null ? null : "\'"  + URLEncoder.encode(request.getParameter("originalFileName"), "UTF-8") + "\'" %>;
    </script>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<%
    Boolean isNewStyle = request.getAttribute("isNewStyle") == null ? false : (Boolean) request.getAttribute("isNewStyle");
%>

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="myHome">
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
        <td width="100%" align="center" class="bodyColumn" id="my-home">
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
                        <td class="valueC B" rowspan="8" nowrap="nowrap" style="vertical-align: middle;">
                            <c:choose>
                                <c:when test="${userImage!=null}">
                                    <div>
                                        <a href="/tc?module=MemberProfile&amp;cr=${regUser.id}">
                                            <img src="${pathImage}" name="image_path" alt="" class="memberPhoto" />
                                        </a>
                                    </div>
                                </c:when>
                                <c:otherwise>
								        <%-- BUGR9488 trigger the submit photo modal if there is no photo yet--%>
                                    <a href="javascript:;" id="submitPhotoLink" class="submitPhotoTrigger">
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
                                <c:out value="${regUser.firstName}" /> <c:out value="${regUser.lastName}" />
                            </div>
                        </td>
                    </tr>
                    <tr class="dark">
                        <td class="field">
                            Company:
                        </td>
                        <td class="value">
                                <c:out value="${regUser.contact.company.name}" />
                        </td>
                    </tr>
                    <tr class="light">
                        <td class="field">
                            Address:
                        </td>
                        <td class="value">
                            ${regUser.homeAddress.address1}
                            <c:if test="${not empty regUser.homeAddress.address2}"><br /><c:out value="${regUser.homeAddress.address2}" /></c:if>
                            <c:if test="${not empty regUser.homeAddress.address3}"><br /><c:out value="${regUser.homeAddress.address3}" /></c:if>
                            <br /><c:out value="${regUser.homeAddress.city}"/>,
                            <c:if test="${not empty regUser.homeAddress.state.name}">${regUser.homeAddress.state.name}</c:if>
                            <c:if test="${not empty regUser.homeAddress.province}"><c:out value="${regUser.homeAddress.province}"/></c:if>
                            <c:out value="${regUser.homeAddress.postalCode}" />
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
                            <c:out value="${regUser.primaryPhoneNumber.number}"/>
                        </td>
                    </tr>
                    <tr class="dark">
                        <td class="field">
                            Email:
                        </td>
                        <td class="value">
                            <a href="mailto:${regUser.primaryEmailAddress.address}">${regUser.primaryEmailAddress.address}</a>

                        </td>
                    </tr>
                </tbody>
                </table>

                <div style="clear: both;">
                <table cellpadding="0" cellspacing="0" class="stat links" width="100%">
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
							   <p class="<c:if test='${userImage!=null}'>hide</c:if>"><a href="javascript:;" id="submitPhotoLink" class="submitPhotoTrigger">Submit a photo</a></p>
                            <p class="<c:if test='${userImage==null}'>hide</c:if>"><a href="javascript:;" id="removePhotoLink">Remove photo</a></p>
                            <p>
                                <c:choose>
                                <c:when test="${ regUser.secondEmailAddress == null }">
                                    <a href="/tc?module=AddSecondEmail">Add Secondary Email</a>
                                </c:when>
                                <c:otherwise>
                                    <form id="addfrm" action="/tc?module=AddSecondEmail" method="post" name="frm">
                                        <input type="hidden" name="<%=Constants.SECOND_EMAIL_ADDRESS%>" value="${regUser.secondEmailAddress.address}" />
                                    </form>
                                    <a href="#" onclick="javascript:$('#addfrm').submit();">Update Secondary Email</a>
                                </c:otherwise>
                                </c:choose>
                            </p>
                            <p>
                                <c:choose>
                                    <c:when test="${hasSocialAccount}">
                                        <a href="/tc?module=RemoveSocialLogin" id="removeSocialLink">Remove Social Login</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="javascript:;" id="addSocialLink">Add Social Login</a>
                                    </c:otherwise>
                                </c:choose>
                            </p>
                        </td>
                        <td class="value">
                            <p><a href="/tc?module=EditPreferences&amp;group=10">Privacy</a></p>
                            <p><a href="http://thecloud.appirio.com/email_prefs_request.html">Email notification</a></p>
                            <p><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Settings">Forums preferences</a></p>
                            <p><a href="/tc?module=EditPaymentPreferences">Payment preferences</a></p>
                            <p><a href="/tc?module=EditTheme">Theme preference</a></p>
                        </td>
                        <td class="value">
<!--                            <p><a href="/PactsMemberServlet?module=AffidavitHistory">Affidavits</a></p> -->
                            <p><a href="/PactsMemberServlet?module=PaymentHistory">Payments</a></p>
<!--                            <p><a href="/PactsMemberServlet?module=AssignmentDocumentHistory">Assignment documents</a></p> -->
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

<div class="photoPopup popupUploadPhoto transparent hide">
    <div class="popupWindow">
        <div class="title">UPLOAD YOUR PHOTO</div>

        <div class="content" id="uploadDiv">
            <div id="photoUploadLeft">
                <div class="locateInput">
                    <div class="inner"></div>
                </div>

                <form action="photo?module=upload&photoAction=preview" method="post" enctype="multipart/form-data" id="photoUploadForm">
                    <a href="javascript:;" class="btn1 btnBrowse">
                        <span class="rightSide">
                            <span class="inner">
                                Browse
                                <span class="file-wrapper">
                                <input type="file" name="photoFile" id="inputFile" />
                                </span>
                            </span>
                        </span>
                    </a>
                </form>

                <div id="uploadImage">
                    <p>Uploaded Image</p>
                </div>
            </div>
            <div id="photoUploadRight">
                <div id="previewDiv">
                    <img src="i/previewPhoto.jpg" alt="" />
                </div>

                <div class="alert">
                    Please upload your photo in JPG or PNG format. For best quality, upload a 400X400 pixel image. Drag your mouse over your photo to crop it (optional) and then view the final results above. If you are happy with the results, click "upload" below.
                </div>
                <div>
                    <a class="link" href="http://topcoder.com/home/help/?p=866">Photo Policy</a>
                </div>
                <a href="javascript:;" class="btn1 btnCancel">
                    <span class="rightSide">
                        <span class="inner">
                            Cancel
                        </span>
                    </span>
                </a>
                <a href="javascript:;" class="btn1 red btnUpload">
                    <span class="rightSide">
                        <span class="inner">
                            Upload
                        </span>
                    </span>
                </a>
                <form action="photo?module=upload&photoAction=commit" method="post" id="submitPhotoForum">
                    <input type="hidden" name="previewPath"></input>
                    <input type="hidden" name="lx"></input>
                    <input type="hidden" name="ly"></input>
                    <input type="hidden" name="rx"></input>
                    <input type="hidden" name="ry"></input>
                    <input type="hidden" name="picWidth"></input>
                    <input type="hidden" name="picHeight"></input>
                </form>
            </div>
        </div>
    </div>
</div>

<c:if test="${userImage!=null}">
    <div class="photoPopup popupRemovePhoto transparent hide">
        <div class="popupWindow">
            <div class="title">REMOVE PHOTO</div>

            <div class="content">
                <img src="${pathImage}" alt="" />

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

<% if(isNewStyle) { %>

<div class="popup-wrapper">
    <div class="overlay">
    </div>
    <section class="popup" id="secondary-email">
        <span class="close close-popup"></span>
        <div class="content">
            <h1>Add Secondary Email</h1>
            <p>Providing a secondary email is optional, but will help us verify your account if you forget your password.</p>
            <label>
                <span class="caption">Secondary Email:</span>
                <input type="text" name="email">
            </label>
            <div class="controls">
                <a href="javascript:;" class="btn">Submit</a><a href="javascript:;" class="btn btnBlue close-popup">Cancel</a>
            </div>
        </div>
    </section>
    <section class="popup" id="remove-photo">
        <span class="close close-popup"></span>
        <div class="content">
            <h1>Remove Photo</h1>
            <span class="memberPhoto"><img src="${pathImage}" alt=""/></span>
            <div class="controls">
                <p>Are you sure to remove this photo?</p>
                <a href="javascript:;" class="btn" id="removePhotoButton">Yes</a><a href="javascript:;" class="btn btnBlue close-popup">No</a>
            </div>
        </div>
    </section>
</div>

<% } %>



<!-- AJAX preloading indicator -->
<div id="modal-background"></div>
<div id="new-modal-window">
    <!-- ajax preloader modal -->
    <div class="outLay" id="preloaderModal" style="display: none;">
        <div class="modalHeaderSmall">
            <div class="modalHeaderSmallRight">
                <div class="modalHeaderSmallCenter"></div>
            </div>
        </div>
        <div class="modalBody">
            <span id="preloaderAnimation">
            <img alt="Loading" src="/i/modal/preloader-loading.gif">
            </span>
            <div class="preloaderTips">Loading...</div>
        </div>
        <div class="modalFooter">
            <div class="modalFooterRight">
                <div class="modalFooterCenter">
                    <div class="&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;"></div>
                </div>
            </div>
        </div>
    </div>
    <!-- end ajax preloader modal -->

    <div id="removeSocialConfirmModal" class="outLay" style="display: none;">
        <div class="modalHeader">
            <div class="modalHeaderRight">
                <div class="modalHeaderCenter">
                    <h2>Remove Social Login</h2>
                    <a href="javascript:;" class="closeModal" title="Close">Close</a>
                </div>
            </div>
        </div>
        <!-- end .modalHeader -->

        <div class="modalBody">
            <ul class="modalContent">
                <li>In order to remove your social login, please confirm on this action.</li>
                <li>Are you sure to remove it?</li>
            </ul>
            <div class="modalCommandBox">
                <a href="javascript:;" class="newButton1 defaultBtn confirmRemoveBtn" style="text-decoration: none;"><span class="btnR"><span
                        class="btnC">Yes</span></span></a>
            </div>
        </div>
        <!-- end .modalBody -->

        <div class="modalFooter">
            <div class="modalFooterRight">
                <div class="modalFooterCenter"></div>
            </div>
        </div>
        <!-- end .modalFooter -->
    </div>
    <!-- end #errorModal -->
</div>

</body>

</html>
