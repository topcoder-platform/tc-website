<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java"
         import="com.topcoder.web.tc.Constants" %>
<html>
<script type="text/javascript" src="/js/taconite-client.js"></script>
<script type="text/javascript">

function validateHandle(send) {
    var url = 'membercontact/validateHandle.jsp';
    var ajaxRequest = new AjaxRequest(url);
    ajaxRequest.addFormElementsById("<%= Constants.TO_HANDLE %>");
    if (send) {
	    ajaxRequest.addFormElementsById("send");
    }
    ajaxRequest.sendRequest();
}

function check(form) {
	validateHandle();
	return !form.submitBtn.disabled;	
}



</script>
<form name='f' action='/tc?module=MemberContact' method='post' >
<input type="hidden" name="send" value="true" />

To: <input type='text' name='<%= Constants.TO_HANDLE %>' id='<%= Constants.TO_HANDLE %>' size='12' onBlur='validateHandle(false)' />
<div id="validationHandle"> </div>
<br/><br/>
Subject: <input type='text' name='<%= Constants.SUBJECT %>' size='50'/> <br/><br/>

<textarea name='<%= Constants.MESSAGE %>' cols='50' rows='10'></textarea>
<br/><br/>
<input type='checkbox' name='sc' />Send a copy to myself.
<br/>

<input type='button' name="submitBtn" value='Send' onClick="validateHandle(true)" disabled="true"/>
<div id="runJS"> 
</div>
</form>

</html>