<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java"
         import="com.topcoder.web.tc.controller.request.membercontact.MemberContact,
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

function validateHandle(send) {
    var ajaxRequest = new AjaxRequest('/tc?module=ValidateHandle');
    ajaxRequest.addFormElementsById("<%= MemberContact.TO_HANDLE %>");
    if (send) {
        ajaxRequest.addFormElementsById("<%= MemberContact.SEND %>");
    }
    ajaxRequest.sendRequest();
}

function canSend() {
   return document.f.<%= MemberContact.TEXT %>.value != "" &&
           document.f.handleValid.value == "true";
}

function showButton() {
    document.f.submitBtn.disabled=!canSend();
}

function keyPress(e) {
    var keycode;
    if (window.event) keycode = window.event.keyCode;
    else if (e) keycode = e.which;
    else return true;
    if (keycode == 13) {
       document.f.<%= MemberContact.TEXT %>.focus();
       return false;
    } else return true;
  }


</script>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>

</head>

<body>

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

<c:set value="<%=Helper.NOT_RATED%>" var="notRated"/>
<c:choose>
    <c:when test="${cf:containsMapKey(requestScope, notRated)}" >
        <span class="bigRed">
           You must be a rated member (in either algorithm or component competitions) to contact other members.
        </span>
     </c:when>
     <c:otherwise>

<form name='f' action='/tc?module=MemberContact' method='post' >

<c:set value="<%=MemberContact.CAN_RECEIVE%>" var="canReceive"/>
<c:if test="${cf:containsMapKey(requestScope, canReceive)}" >
    To enable other members to contact you, click <a href='/tc?module=MemberContactEnable'>here</a>
    <br>
</c:if>
<br>
<input type="hidden" id="<%= MemberContact.SEND %>" name="<%= MemberContact.SEND %>" value="true" />
<input type="hidden" id="handleValid" name="handleValid" value="false" />

To: <input type='text' name='<%= MemberContact.TO_HANDLE %>' id='<%= MemberContact.TO_HANDLE %>' size='12' onBlur='validateHandle(false)' onkeypress='return keyPress(event);' />
<div id="validationHandle"> </div>
<span class="smallText">(enter member handle only)</span>
<br/><br/>

<textarea name='<%= MemberContact.TEXT %>' cols='50' rows='10' onKeyUp='showButton()'></textarea>
<br/><br/>
<input type='checkbox' name='<%= MemberContact.SEND_COPY %>' />Send a copy to myself.
<br/><br/>

<%-- added text link instead 
<input type='button' name="submitBtn" value='Send' onClick="validateHandle(true)" disabled="true"/> --%>
<A href="">Send</A>

<div id="runJS">
</div>
</form>

<c:set value="<%=MemberContact.CONFIRM%>" var="confirm"/>
<c:if test="${cf:containsMapKey(requestScope, confirm)}" >
    <span class="bigRed">
       Your email was sent.
    </span>
</c:if>
     
     </c:otherwise>
</c:choose>
<br>
To block certain members from contacting you, go to the <a href='/tc?module=BlackList'>black list</a> page.
<br><br><br><br><br>
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
