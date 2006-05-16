<%@ page import="com.topcoder.web.reg.Constants"%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registration</title>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_main"/>
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
<STYLE TYPE="text/css">
/*div{ border: solid 1px black; }*/
div.popUp
{
float: left;
clear: both;
width: 450px;
font-size: 11px;
background-color: #FFFFCC;
visibility: hidden;
position: absolute;
top: 0px;
left: 0px;
padding: 5px;
border: solid 1px black;
}
#container
{
clear: both;
display: block;
position: relative;
}
</STYLE>
</head>

<body>
<div align="center">
   <div style="padding: 10px; width: 500px; text-align: left;">
   <span class="bigTitle">Registration</span>
   <br><br>
   <strong>What would you like to do as a registered TopCoder member?<br>Check all that apply.</strong>
   <br><br>

    <form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="selectionForm">
        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="Main"/>
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
   You can always add to your registered capabilities later by clicking "Update My Profile".
   </div>
</div>

</body>
</html>
