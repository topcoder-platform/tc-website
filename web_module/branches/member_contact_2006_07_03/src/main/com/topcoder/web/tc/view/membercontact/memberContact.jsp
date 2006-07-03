<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java"
         import="com.topcoder.web.tc.Constants" %>
<html>
<script type="text/javascript" src="/js/taconite-client.js"></script>
<script type="text/javascript">

function validateHandle() {
    var url = 'validateHandle.jsp';
    var ajaxRequest = new AjaxRequest(url);
    ajaxRequest.addFormElementsById("<%= Constants.TO_HANDLE %>");
    ajaxRequest.sendRequest();
}

</script>
<form action='/tc?module=MemberContact' method='post'>

To: <input type='text' name='<%= Constants.TO_HANDLE %>' size='12' onBlur='validateHandle()' />
<div id="validationHandle"> </div>
<br/><br/>
Subject: <input type='text' name='<%= Constants.SUBJECT %>' size='50'/> <br/><br/>

<textarea name='<%= Constants.TO_HANDLE %>' cols='50' rows='10'></textarea>
<br/><br/>
<input type='submit' value='Send'/>
</form>

</html>