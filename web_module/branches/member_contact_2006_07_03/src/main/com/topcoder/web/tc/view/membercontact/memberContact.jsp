<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java"
         import="com.topcoder.web.tc.controller.request.membercontact.MemberContact" %>
<html>
<script type="text/javascript" src="/js/taconite-client.js"></script>
<script type="text/javascript">

function validateHandle(send) {
    var url = 'membercontact/validateHandle.jsp';
    var ajaxRequest = new AjaxRequest(url);
    ajaxRequest.addFormElementsById("<%= MemberContact.TO_HANDLE %>");
    if (send) {
        ajaxRequest.addFormElementsById("<%= MemberContact.SEND %>");
    }
    ajaxRequest.sendRequest();
}


</script>
<% if (request.getAttribute(MemberContact.CONFIRM) != null) { %>
    <div style="font-weight:bold;color:green;">
       Your email was sent.
    </div>
<% } %>

<form name='f' action='/tc?module=MemberContact' method='post' >
<input type="hidden" id="send" name="<%= MemberContact.SEND %>" value="true" />

To: <input type='text' name='<%= MemberContact.TO_HANDLE %>' id='<%= MemberContact.TO_HANDLE %>' size='12' onBlur='validateHandle(false)' />
<div id="validationHandle"> </div>
<br/><br/>
Subject: <input type='text' name='<%= MemberContact.SUBJECT %>' size='50'/> <br/><br/>

<textarea name='<%= MemberContact.TEXT %>' cols='50' rows='10'></textarea>
<br/><br/>
<input type='checkbox' name='<%= MemberContact.SEND_COPY %>' />Send a copy to myself.
<br/>

<input type='button' name="submitBtn" value='Send' onClick="validateHandle(true)" disabled="true"/>
<div id="runJS">
</div>
</form>

</html>