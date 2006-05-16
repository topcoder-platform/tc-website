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
            <tc-webtag:chkBox name="${regTypeKey}${type.id}"/> <c:out value="${type.description}" /> <A href="javascript:void(0)" onmouseover="popUp('popUp0')" onmouseout="popHide()" />tell me more...</A><br />
      <div id="container">
         <div id="popUp0" class="popUp">
         <span class="bodySubtitle">TopCoder Competitions</span><br>
         How do you stand up among your peers?
         <ul>
         <li><strong>Algorithm Competitions:</strong> The tournament is a timed contest where all participants compete online to solve the same problems under the same time constraints. The competition is available in four programming languages - Java, C++, C#, and VB.</li>
         <li><strong>Component Design Competitions:</strong> You convert a set of requirements into a set of diagrams and a component specification document.</li>
         <li><strong>Component Development Competitions:</strong> You are tasked to convert a component design, prepared by the designer and reviewed by the Design Review Board, into a functional component.</li>
         <li><strong>Marathon Matches:</strong> TopCoder has created Marathon Matches in an effort to provide a more flexible competition format with an extended timeline that offers different types of problems than what can be offered in a traditional TopCoder algorithm round.</li>
         </ul>
         </div>
      </div>
      <br><br>
        </c:forEach>

        <a href="Javascript:document.selectionForm.submit();">Submit</a>

    </form>
   <br>
   You can always add to your registered capabilities later by clicking "Update My Profile".
   </div>
</div>

</body>
</html>
