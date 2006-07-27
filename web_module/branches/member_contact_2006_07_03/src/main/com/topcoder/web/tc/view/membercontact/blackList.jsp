<%@ page language="java"
         import="com.topcoder.web.tc.controller.request.membercontact.BlackList" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Member Contact</title>
         
<script type="text/javascript" src="/js/taconite-client.js"></script>
<script type="text/javascript">

var iniUsers = new Array();

var i = 0;
<c:forEach items="${requestScope.recentUsers}" var="recentUser">
iniUsers[i++] = "<c:out value="${recentUser.id}" />";
</c:forEach>


var blockDisabled = false;
var iniBlocked = new Array();
i = 0;
<c:forEach items="${requestScope.blockedUsers}" var="blockedUser">
iniBlocked[i++] = "<c:out value="${blockedUser.id}" />";
</c:forEach>

function blockHandle(handle) {
    if (blockDisabled) return;
    

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

    blockDisabled = true;

    var ajaxRequest = new AjaxRequest('/tc?module=BlockHandle');
    ajaxRequest.addFormElementsById("handle");
    ajaxRequest.setPostRequest(afterRequest);
    ajaxRequest.sendRequest();

}

function afterRequest() 
{
    if (document.f.handleFound.value == "true") {
        addBlockedUser(document.f.blockId.value,document.f.blockHandle.value);
    }
}

function insertOrder(sel, option)
{
    handleLower = option.text.toLowerCase();
    var i;

    for (i = sel.length - 1; i >= 0; i--) {
        if (handleLower > sel.options[i].text.toLowerCase()) break;
    }

    var o = new Option(option.text, option.value, false);

    sel.options.add(o, i+1);
}

function block() {
    var selected = false;
    for(var i = 0; i < document.f.users.length; i++)
        if (document.f.users.options[i].selected) {
            insertOrder(document.f.blockedUsers, document.f.users.options[i]) ;
            selected = true;
        }
        
    if (!selected) alert("Please select one or more users to block");
    
    for(var i = document.f.users.length-1; i>= 0; i--)
        if (document.f.users.options[i].selected) {
            document.f.users.remove(i);
        }
    
}

function unblock() {
    var selected = false;
    for(var i = 0; i < document.f.blockedUsers.length; i++)
        if (document.f.blockedUsers.options[i].selected) {
            insertOrder(document.f.users, document.f.blockedUsers.options[i]) ;
            selected = true;
    }
    
    if (!selected) alert("Please select one or more users to unblock");
    
    for(var i = document.f.blockedUsers.length-1; i>= 0; i--)
        if (document.f.blockedUsers.options[i].selected) {
            document.f.blockedUsers.remove(i);
        }

}

function addBlockedUser(id, handle)
{
    insertOrder(document.f.blockedUsers, new Option(handle, id, false)) ;   
    blockDisabled= false;
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
        
    document.f.action = "/tc?module=BlackList" + ub + b;
    document.f.submit();
}

function keyPress(e) {
    var keycode;
    if (window.event) keycode = window.event.keyCode;
    else if (e) keycode = e.which;
    else return true;
    if (keycode == 13) {
       blockHandle(document.f.handle.value);
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
                <jsp:param name="node" value="contact"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="member_contact"/>
    <jsp:param name="title" value="Black List"/>
</jsp:include>

<div class="fixedWidthBody">

<form name="f" method="post">

<br>
<table>
<tr>
<td>
Users who recently sent you<br>
messages or who were previously<br>
blocked:<br>
<select name='users' multiple size="10" style="width: 180px;">
<c:forEach items="${requestScope.recentUsers}" var="recentUser">
<option value="<c:out value="${recentUser.id}" />"><c:out value="${recentUser.handle}" /></option>
</c:forEach>
</select>
</td>

<td valign='center'>
<A href="javascript:block()">Block &gt;</A><br>
<A href="javascript:unblock()">&lt; Unblock</A>
<td>
<br><br>
Blocked Users:<br>
<select name='blockedUsers' multiple size="10" style="width: 180px;">
<c:forEach items="${requestScope.blockedUsers}" var="blockedUser">
<option value="<c:out value="${blockedUser.id}" />"><c:out value="${blockedUser.handle}" /></option>
</c:forEach>
</select>
</td>
</tr>
</table>
<br>
<br>
Enter another user: <input type="text" name='handle' id='handle' onkeypress="return keyPress(event);"/>
&#160; 


<A href="javascript:blockHandle(document.f.handle.value)">Block</A>

<br>
<br>
<A href="javascript:save()">Save</A> &#160; <A href="/tc?module=MemberContact">Back</A>


<br><br>

<div id="blockHandleResult">
</div>

<c:set value="<%=BlackList.SAVED%>" var="saved"/>
<c:if test="${cf:containsMapKey(requestScope, saved)}" >
    <span class="bigRed">
       The blocked user list was saved.
    </span>
</c:if>

</form>
</div>
<br><br><br><br>
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
