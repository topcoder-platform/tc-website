<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<script type="text/javascript" src="/js/taconite-client.js"></script>
<script type="text/javascript">

var iniUsers = new Array();

var i = 0;
<c:forEach items="${requestScope.recentUsers}" var="recentUser">
iniUsers[i++] = "<c:out value="${recentUser.id}" />";
</c:forEach>



var iniBlocked = new Array();
i = 0;
<c:forEach items="${requestScope.blockedUsers}" var="blockedUser">
iniBlocked[i++] = "<c:out value="${blockedUser.id}" />";
</c:forEach>

function blockHandle(handle) {
	handle = handle.toLowerCase();

	for(var i = 0; i < document.f.users.length; i++) {
		if (document.f.users.options[i].text.toLowerCase() == handle) {
			document.f.blockedUsers.options.add(document.f.users.options[i]);
			return;
		}
	}

	for(var i = 0; i < document.f.blockedUsers.length; i++) {
		if (document.f.blockedUsers.options[i].text.toLowerCase() == handle) {
			alert("The user is already blocked");
			return;
		}
	}

    var ajaxRequest = new AjaxRequest('/tc?module=BlockHandle');
    ajaxRequest.addFormElementsById("handle");
    ajaxRequest.sendRequest();

}

function block() {
    var selected = false;
	for(var i = 0; i < document.f.users.length; i++)
		if (document.f.users.options[i].selected) {
			document.f.blockedUsers.options.add(document.f.users.options[i]);
			i--;
			selected = true;
		}
	if (!selected) alert("Please select one or more users to block");
}

function unblock() {
    var selected = false;
	for(var i = 0; i < document.f.blockedUsers.length; i++)
		if (document.f.blockedUsers.options[i].selected) {
			document.f.users.options.add(document.f.blockedUsers.options[i]);
			i--;
			selected = true;
	}
	if (!selected) alert("Please select one or more users to unblock");
}

function getNewElements(initial, current)
{
	var newElements = new Array();
	for (var i=0; i < current.length; i++) {
		var found = false;
		for (var j = 0; j < initial.length; j++) {

			if (current[i].value == initial[j]) {
				found = true;
			}
		}
		if (!found) newElements.push(current[i].value);

	}
	return newElements;

}

function save()
{
	var ub = getNewElements(iniUsers, document.f.users.options).join("&ub=");
	if (ub != "") ub = "&ub=" + ub;

    var b = getNewElements(iniBlocked, document.f.blockedUsers.options).join("&b=");
    if (b != "") b = "&b=" + b;
	    
    document.f.action = "/tc?module=UpdateBlocked" + ub + b;
	document.f.submit();
}


</script>

<form name="f" method="post">
<table>
<tr>
<td>
Users that recently <br>
sent you messages or <br>
that were previously blocked:<br>
(needs rewording!)<br>
<select name='users' multiple size=10 width=200>
<c:forEach items="${requestScope.recentUsers}" var="recentUser">
<option value="<c:out value="${recentUser.id}" />"><c:out value="${recentUser.handle}" /></option>
</c:forEach>
</select>

</td>
<td valign='center'>
<input type='button' value='Block &gt;' onClick='block()' />
<br>
<input type='button' value='&lt; Unblock' onClick='unblock()' />
</td>

<td>
Blocked Users:<br>
<select name='blockedUsers' multiple size=10 width=200>
<c:forEach items="${requestScope.blockedUsers}" var="blockedUser">
<option value="<c:out value="${blockedUser.id}" />"><c:out value="${blockedUser.handle}" /></option>
</c:forEach>
</select>

</td>
</tr>
</table>
<br>
<br>
Block another user: <input type="text" name='handle' id='handle'/>
<input type='button' value='Block'  onClick='blockHandle(document.f.handle.value)'/>
<br>

<input type="button" value="Save" onClick="save()" />

<div id="messageDiv"> </div>
</form>

</html>