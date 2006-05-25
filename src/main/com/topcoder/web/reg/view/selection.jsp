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
      <strong>A Message from the TopCoder Founder</strong>
      <br><br>
      Welcome to TopCoder. Before you register, there are a few things we think you should know:  First, and most importantly, TopCoder is a commercial
      site.  We charge sponsors for the right to advertise on our site.  This money pays for the operation of the site and the prizes awarded in competitions.
      <br><br>
      This has several implications. Because we feel it is our obligation to let our sponsors know who their message is reaching, we collect as much
      demographic information as possible without making the Registration process overly burdensome.  Furthermore, we require that you verify the accuracy of
      the information you provide.  This does not mean that sponsors have access to your personal information; in general, they do
      not. In certain circumstances such as participating in or opting in to certain events,
      sponsors will be given access to view your demographic information, educational and work
      experience (if provided by you), and contact information.
      <br><br>
      While we believe that sponsors have every right to expect that what we give them is accurate and valuable, we also believe that they must bring more
      than just money to our member base.  We want sponsors who provide true value to developers.  TopCoder intends to help developers increase their skill
      level as well as increase their value to employers. Therefore, we are careful to choose sponsors that represent this philosophy.
      <br><br>
      We are also very strict about the way in which sponsors present themselves to the member base&#151;no annoying banners, pop-ups, etc. We work with
      sponsors to get their message across in an appealing and non-intrusive manner.  Because we take our relationship with sponsors seriously, we
      believe that they have value to provide.  We ask that you listen to what they have to say.
      <%--
      <br><br>
      Please read the <A href="/tc?module=Static&d1=about&d2=terms" class="statTextBig">Terms of Use</A> and <A href="/tc?module=Static&d1=about&d2=privacy"class="statTextBig">Privacy Policy</A>, and let me be the first to say good luck in the arena.
      --%>
      <br><br>
      <em>Jack Hughes<br>
      Founder and Chairman, TopCoder, Inc.</em>
      <br><br>
      (<A href="/reg/?nrg=false">Click here</A> if you're already a registered member and would like to update your profile.)
      <br><br>
      </c:if>

      <strong>What would you like to do as a registered TopCoder member?<br>Check all that apply.</strong>
      <br><br>


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

      <div align="center">
        <a href="Javascript:document.selectionForm.submit();">Submit</a>
      </div>

    </form>
   <br>
   All registered TopCoder members have the ability to read and post in our forums, as well as browse sections of the site that require login, such as detailed competition statistics.
   <br><br>
   You can always add to your registered capabilities later by clicking "Update My Profile".
   </div>
</div>

<br><br>

</body>
</html>
