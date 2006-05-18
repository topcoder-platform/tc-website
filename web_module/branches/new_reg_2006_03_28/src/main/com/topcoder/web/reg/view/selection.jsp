<%@ page import="com.topcoder.web.reg.Constants"%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags" prefix="tc-webtag" %>
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
//   objPopUp.style.display = 'block';
}
function popHide(){
   objPopUp.style.visibility = 'hidden';
//   objPopUp.style.display = 'none';
   objPopUp = null;
}

// -->
</script>
</head>

<body>
<div align="center" style="padding:6px 0px 6px; 0px;">
<A href="/"><img src="http://www.topcoder.com/i/registration/tc_logo.gif" alt="TopCoder" border="0" /></A>
</div>
<div align="center">
   <div style="padding: 0px 0px 10px 0px; width: 600px; text-align: left;">
   <table class="pageTitleTable" cellpadding="0" cellspacing="0">
       <tr>
           <td class="pageTitle" width="100%"><img src="http://www.topcoder.com/i/header_registration_w.gif" alt="registration_w" border="0"></td>
           <td class="pageSubtitle" align="right">&nbsp;</td>
       </tr>
   </table>

   <div id="regBcContainer">
      <div class="regBc">
         <div class="title">Step 1 of 6</div>
         <div class="on">Select Your Registration</div>
         <div class="off">General</div>
         <div class="off">Demographics</div>
         <div class="off">Confirm</div>
         <div class="off">Success</div>
         <div class="off">Activation</div>
      </div>
   </div>

   <strong>What would you like to do as a registered TopCoder member?<br>Check all that apply.</strong>
   <br><br>

    <form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="selectionForm">
        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="Main"/>

<c:set value="<%=Constants.REGISTRATION_TYPE%>" var="regType"/>
            <tc-webtag:errorIterator id="err" name="${regType}">${err}<br/></tc-webtag:errorIterator>

        <c:set value="<%=Constants.REGISTRATION_TYPE%>" var="regTypeKey"/>
        <c:forEach items="${registrationTypeList}" var="type">
            <tc-webtag:chkBox name="${regTypeKey}${type.id}"/> <c:out value="${type.name}" /> <A href="javascript:void(0)" onmouseover="popUp('popUp0')" onmouseout="popHide()" >tell me more...</A><br />

      <div id="container">
         <div id="popUp0" class="popUp">${type.description}
         </div>
      </div>

      <br /><br />
        </c:forEach>

        <a href="Javascript:document.selectionForm.submit();">Submit</a>

    </form>
   <br>
   All registered TopCoder members have the ability to read and post in our forums, as well as browse sections of the site that require login, such as detailed competition statistics.
   <br><br>
   You can always add to your registered capabilities later by clicking "Update My Profile".
   </div>
</div>

</body>
</html>
