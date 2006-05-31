<%@ page import="com.topcoder.web.reg.Constants"%>
<%@ page import="com.topcoder.web.common.BaseProcessor"%>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Registration</title>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_reg"/>
    </jsp:include>
<script language="javascript" type="text/javascript">
<!--
function openWin(url, name, w, h) {
   win = window.open(url, 'biowin', "scrollbars=yes,toolbar=no,resizable=no,menubar=no,width=" + w + ",height=" + h);
   win.location.href = url;
   win.focus();
}
var objPopUp = null;
function popUpUnder(event,objectID){
   objPopTrig = document.getElementById(event);
   alert(objPopTrig);
   objPopUp = document.getElementById(objectID);
   xPos = objPopTrig.offsetLeft;
   if(xPos + objPopUp.offsetWidth > document.body.clientWidth) xPos = xPos - objPopUp.offsetWidth;
   objPopUp.style.left = xPos + 'px';
   objPopUp.style.display = 'block';
}
function popUp(objectID){
   objPopUp = document.getElementById(objectID);
   objPopUp.style.visibility = 'visible';
}
function popHide(){
   objPopUp.style.visibility = 'hidden';
   objPopUp = null;
}

// -->
</script>
</head>

<body>
<div align="center" style="padding:6px 0px 6px; 0px;">
<A href="http://<%=ApplicationServer.SERVER_NAME%>"><img src="/i/registration/tc_logo.gif" alt="TopCoder" border="0" /></A>
</div>
<div align="center">
   <div style="padding: 0px 10px 10px 10px; width: 600px; text-align: left;">

     <jsp:include page="/page_title.jsp">
         <jsp:param name="image" value="registration_w"/>
         <jsp:param name="title" value="&#160;"/>
     </jsp:include>

       <c:if test="${sessionInfo.loggedIn}">
           <div style="float:right;"><A href="${sessionInfo.servletPath}?module=Logout" class="small">logout</A></div>
       </c:if>
      <c:if test="${!sessionInfo.loggedIn}">
      <div align="center" class="small" style="padding-bottom: 6px;">
         (<A href="/reg/?nrg=false">Click here</A> if you're already a registered member and would like to update your profile.)
      </div>
      </c:if>

      <strong>What would you like to do as a registered TopCoder member?<br>Check all that apply.</strong>
      <br><br>
      <c:if test="${!sessionInfo.loggedIn}">
      Before registering, please read our <A href="Javascript:openWin('/reg/message.jsp','message',600,600);">Message from the TopCoder Founder</A>
      <br><br>
      </c:if>


    <form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="selectionForm">
        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="Main"/>

        <c:set value="<%=Constants.REGISTRATION_TYPE%>" var="regType"/>
            <span class="bigRed"><tc-webtag:errorIterator id="err" name="${regType}">${err}<br/></tc-webtag:errorIterator></span>

        <c:set value="<%=BaseProcessor.DEFAULTS_KEY%>" var="defaults"/>
        <% int i=0;%>
        <c:forEach items="${registrationTypeList}" var="type">
            <c:set value="${regType}${type.id}" var="regTypeKey"/>
            <c:choose>
                <c:when test="${requestScope[defaults][regTypeKey]==null}"><tc-webtag:chkBox name="${regTypeKey}"/></c:when>
                <c:otherwise><img src="/i/interface/cbox_grayedout.gif" alt=""/><tc-webtag:hiddenInput name="${regTypeKey}" value="on"/></c:otherwise>
            </c:choose>
            ${type.name} <A href="javascript:void(0)" onmouseover="popUp('popUp<%=i%>')" onmouseout="popHide()" >tell me more...</A><br />

              <div id="container">
                 <div id="popUp<%=i%>" class="popUp">${type.description}
                 </div>
              </div>

              <br /><br />
            <%i++;%>
        </c:forEach>


        <c:set value="<%=Constants.TERMS_OF_USE_ID%>" var="termsId"/>
        <c:if test="${!regUser.agreedToSiteTerms}">
            <strong>Terms of Use</strong>
            <br>
          <IFRAME SRC="/tc?<%=Constants.MODULE_KEY%>=Terms&amp;<%=Constants.TERMS_OF_USE_ID%>=<%=Constants.REG_TERMS_ID%>" WIDTH="100%" HEIGHT="200"></IFRAME>
          <div align="center">
              <span class="bigRed"><tc-webtag:errorIterator id="err" name="${termsId}">${err}<br/></tc-webtag:errorIterator></span>
              <INPUT TYPE="checkbox" NAME="<%=Constants.TERMS_OF_USE_ID%>"/>I agree
                <br><br>
          </div>
        </c:if>
        <div align="center">
            <a href="#" onclick="Javascript:document.selectionForm.submit();">Submit</a>
        </div>




    </form>

   <br><br>
   Please read the <A href="/tc?module=Static&d1=about&d2=privacy">Privacy Policy</A>
   <br><br>
   All registered TopCoder members have the ability to read and post in our forums, as well as browse sections of the site that require login, such as detailed competition statistics.
   <br><br>
   You can always add to your registered capabilities later by clicking "Update My Profile".
   </div>
</div>

<br><br>

</body>
</html>
