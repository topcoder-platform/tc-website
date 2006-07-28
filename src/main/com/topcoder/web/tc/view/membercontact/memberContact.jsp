<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java"
         import="com.topcoder.web.tc.controller.request.membercontact.MemberContact,
		         com.topcoder.web.tc.controller.request.membercontact.SendMail,
                 com.topcoder.web.tc.controller.request.membercontact.Helper"
          %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Member Contact</title>
         
<script type="text/javascript" src="/js/taconite-client.js"></script>
<script type="text/javascript">

var prevCanSend = false;

function canSend() {
   return document.f.<%= SendMail.TEXT %>.value != "" &&
           document.f.handleValid.value == "true";
}


function validate(send) {
    var ajaxRequest = new AjaxRequest('/tc?module=ValidateHandle');
    ajaxRequest.addFormElementsById("<%= SendMail.TO_HANDLE %>");
    ajaxRequest.addFormElementsById("<%= SendMail.TEXT %>");    
    if (send) {
        ajaxRequest.addFormElementsById("<%= SendMail.SEND %>");
    }
    ajaxRequest.setPostRequest(afterRequest);
    ajaxRequest.sendRequest();
}

function textChanged() {
    if (prevCanSend != canSend()) {
		validate(false);
	    prevCanSend = canSend();
    }
}

function afterRequest() 
{
    if (canSend() && document.f.doSend.value == "true") {
        document.f.submit();
    }    
}


function canSend() {
   return document.f.<%= SendMail.TEXT %>.value != "" &&
           document.f.handleValid.value == "true";
}




function keyPress(e) {
    var keycode;
    if (window.event) keycode = window.event.keyCode;
    else if (e) keycode = e.which;
    else return true;
    if (keycode == 13) {
       document.f.<%= SendMail.TEXT %>.focus();
       return false;
    } else return true;
  }

function init() {
    document.f.<%= SendMail.TO_HANDLE %>.focus();
<c:if test="${not empty param.th}" >
	validate(false);
    document.f.<%= SendMail.TEXT %>.focus();	
</c:if>
}

</script>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>

</head>

<body onLoad="init()">

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">

<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value=""/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="member_contact"/>
    <jsp:param name="title" value="Send a Message"/>
</jsp:include>

<div class="fixedWidthBody">
<br>
The Member Contact area allows you to send emails to other TopCoder members.* 
You can access this message area by clicking the "Send a message" link on members' profile pages. 
Use the message form below to contact the member of your choice, only one recipient per message.

<br><br>
To block specific TopCoder members from contacting you, go to the <a href='/tc?module=BlackList'>black list</a> page.
<br>
<c:set value="<%=MemberContact.CAN_RECEIVE%>" var="canReceive"/>
<c:if test="${cf:containsMapKey(requestScope, canReceive)}" >
	To enable other rated TopCoder members to contact you, <a href='/tc?module=MemberContactEnable'>click here</a>
    <br>
</c:if>
<br>
<span class="bodySubtitle">Send a message:</span><br>

<c:set value="<%=Helper.NOT_RATED%>" var="notRated"/>
<c:choose>
    <c:when test="${cf:containsMapKey(requestScope, notRated)}" >
        <span class="bigRed">
           You must be a rated member (in either algorithm or component competitions) to contact other members.
        </span>
     </c:when>
     <c:otherwise>

<form name='f' action='/tc?module=SendMail' method='post' >

<br>
<input type="hidden" id="<%= SendMail.SEND %>" name="<%= SendMail.SEND %>" value="true" />

To: &#160; <input type='text' name='<%= SendMail.TO_HANDLE %>' id='<%= SendMail.TO_HANDLE %>' size='12' onBlur='validate(false)' onkeypress='return keyPress(event);' value='<c:out value="${param.th}" />'/>
<div id="validationHandle"> </div>
<span class="smallText">(Enter TopCoder member handle only)</span>
<br/><br/>

<textarea name='<%= SendMail.TEXT %>' id='<%= SendMail.TEXT %>' cols='50' rows='10' onKeyUp='textChanged()'></textarea>
<br/><br/>
<input type='checkbox' name='<%= SendMail.SEND_COPY %>' />Send a copy to the email address in my TopCoder profile.
<br/><br/>

<div id="btnSendDiv">
<img src="/i/interface/btn_send_disabled.gif" border="0"/>
</div>

<div id="runJS">
<input type="hidden" id="handleValid" name="handleValid" value="false" />
<input type="hidden" id="doSend" name="doSend" value="false" />       
</div>
</form>

<c:if test="${not empty param.conf}" >
    <span class="bigRed">
       Your message was sent.
    </span>
</c:if>
     
     </c:otherwise>
</c:choose>
<br><br><br><br>
* All messages sent to TopCoder members from the Member Contact area will be logged and may be occasionally reviewed. 
Using the member contact function for any commercial purposes is strictly prohibited. Any TopCoder member who deems a member 
contact message from another TopCoder member to be inappropriate is encouraged to report this activity at <A href="mailto:service@topcoder.com">service@topcoder.com</A>.
<br><br><br>
</div>


        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="about"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
