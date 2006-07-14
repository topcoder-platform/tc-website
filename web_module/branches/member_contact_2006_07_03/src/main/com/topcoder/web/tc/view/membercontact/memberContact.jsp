<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java"
         import="com.topcoder.web.tc.controller.request.membercontact.MemberContact,
         com.topcoder.web.tc.Constants" %>
<html>
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


</script>
<% if (request.getAttribute(MemberContact.CONFIRM) != null) { %>
    <div style="font-weight:bold;color:green;">
       Your email was sent.
    </div>
<% } %>

<form name='f' action='/tc?module=MemberContact' method='post' >
<% if (!"true".equals(request.getAttribute(MemberContact.CAN_RECEIVE))) { %>
To enable other members to contact you, 
<a href='/tc?module=MemberContactEnable' target="_blank" onClick="window.open(this.href, this.target, 'width=200,height=150,resizable=no,toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no'); return false;">
click here</a>
<br>
<% } %>
<br>

<input type="hidden" id="<%= MemberContact.SEND %>" name="<%= MemberContact.SEND %>" value="true" />
<input type="hidden" id="handleValid" name="handleValid" value="false" />

To: <input type='text' name='<%= MemberContact.TO_HANDLE %>' id='<%= MemberContact.TO_HANDLE %>' size='12' onBlur='validateHandle(false)' />
<div id="validationHandle"> </div>
<br/><br/>

<textarea name='<%= MemberContact.TEXT %>' cols='50' rows='10' onKeyUp='showButton()'></textarea>
<br/><br/>
<input type='checkbox' name='<%= MemberContact.SEND_COPY %>' />Send a copy to myself.
<br/>

<input type='button' name="submitBtn" value='Send' onClick="validateHandle(true)" disabled="true"/>
<div id="runJS">
</div>
</form>

</html>