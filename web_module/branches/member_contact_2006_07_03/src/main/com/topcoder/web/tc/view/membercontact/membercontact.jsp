<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java"
         import="com.topcoder.web.tc.Constants" %>
<html>
<form action='/tc?module=MemberContact' method='post'>

To: <input type='text' name='<%= Constants.TO_HANDLE %>' width='12'/> <br/>
Subject: <input type='text' name='<%= Constants.SUBJECT %>' width='50'/> <br/>

<textarea name='<%= Constants.TO_HANDLE %>' cols='50' rows='10'></textarea>

<input type='submit' value='Send'/>
</form>

</html>