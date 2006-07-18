<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<script type="text/javascript" src="/js/taconite-client.js"></script>
<script type="text/javascript">

function blockHandle() {
    var ajaxRequest = new AjaxRequest('/tc?module=Static&d1=membercontact&d2=blockUser&block=true');
    ajaxRequest.addFormElementsById("handle");
    ajaxRequest.sendRequest();
}

</script>

<form action="/tc?module=Static&d1=membercontact&d2=memberContactEnable">
<table>
<tr>
<td>
Recent messages:<br>
<select name='users' multiple size=10 width=200>
<option>dok               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
<option>nick</option>
<option>pulky</option>
<option>ivern</option>
<option>cucu</option>
</select>

</td>
<td valign='center'>
<input type='button' value='Block &gt;'/>
<br>
<input type='button' value='&lt; Unblock'/>
</td>

<td>
Blocked Users:<br>
<select name='blockedUsers' multiple size=10 width=200>
<option>digibomb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
<option>theSpammer</option>
</select>

</td>
</tr>
</table>
<br>
<br>
Block anoter user: <input type="text" name='handle' id='handle'/><input type='button' value='Block' onClick='blockHandle()'/>
<br>
<input type="submit" />
</form>
<div id="messageDiv"> </div>
</html>