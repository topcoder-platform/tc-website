<%@ page contentType="text/html;charset=utf-8" %>
<html>

<center>
Do you want to enable other members to contact you?
</center>
<form action="/tc" >
<input type="hidden" name="enable" value="true">
<input type="hidden" name="module" value="MemberContactEnable">

<input type="submit" value="Enable">
<input type="button" value="Cancel" onClick="window.close()">
</form>

</html>