<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>                 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>TopCoder Admin</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

 <style type="text/css">
.showText{ display: table-row }
.hideText{ display: none }
</style>

    
<script language="javascript" type="text/javascript">
function update(action,rid) {
	 document.search.rid.value = rid;
	 document.search.action.value = action;	 
	 document.search.submit();
}

function toggleDisplay(objectID,imageID,linkID){
   var object = document.getElementById(objectID) 
   if(object.className == 'odd hideText') {
        object.className = 'odd showText'; 
        document.images[imageID].src = '/i/interface/exp_ed_w.gif'; 
   }else if(object.className == 'odd showText') {
        object.className = 'odd hideText'; 
        document.images[imageID].src = '/i/interface/exp_w.gif';
   }else if(object.className == 'even showText') {
        object.className = 'even hideText'; 
        document.images[imageID].src = '/i/interface/exp_w.gif';
   }else {
        object.className = 'even showText';
        document.images[imageID].src = '/i/interface/exp_ed_w.gif';
   }
  linkID.blur();
  return;
}

 </script>  
 
  
</head>

<body>
<jsp:include page="top.jsp"/>
<table>
    <tr valign="top">
        <td width="200">
            <jsp:include page="left.jsp"/>
        </td>
        <td>
        <form name="search"action="/admin/?" >
        <input type="hidden" name="module" value="VisaLetters">
        <input type="hidden" name="rid" value="">

<table width="300" border="1"> 
	<tr>
		<td valign="top" width="50">Status:</td>
		<td>
			<input type="checkbox" name="pending" value="true" ${requestScope.pending? "checked": "" }/>Pending<br>
			<input type="checkbox" name="sent" value="true" ${requestScope.sent? "checked": "" } >Sent		<br>	
			<input type="checkbox"name="denied" value="true" ${requestScope.denied? "checked": "" } >Denied<br>
		</td>
 	</tr>
 	<tr>
 		<td>Event:</td>
 		<td><tc-webtag:listSelect name="event" list="${requestScope.eventList}" useTopValue="false"/></td>
 	</tr>
 	<tr>
 		<td colspan="2" align="center">
 		<input type="submit" value="Search">
 		</td>
 	</tr>
</table> 	
	
	</form>		
<br>
<br>

<table width="100%" >
<tr class="header">
	<td></td>
	<td></td>
	<td>Request Date</td>
	<td>Handle</td>
	<td>Status</td>
</tr>
<% boolean even = true; %>
<c:forEach items="${requestScope.reqs}" var="req">
<tr class="<%=even?"even":"odd"%>">
	<td>
	     <a href="javascript:toggleDisplay('ref_${req.id }','switch_${req.id }');" onfocus="this.blur();"><img src="/i/interface/exp_w.gif" alt="Open" name="switch_${req.id }" /></a>
	</td>
	<td>
		<input type="checkbox" name="selected" value="${req.id }">
	</td>
	<td><fmt:formatDate value="${req.requestDate}" pattern="MM/dd/yyyy" /></td>
	<td><c:out value="${req.user.handle }" /></td>
	<td>
	<c:choose>
	<c:when test="${not empty req.sentDate}">
		Sent on: <fmt:formatDate value="${req.sentDate}"  pattern="MM/dd/yyyy" />
	</c:when>
	<c:when test="${req.denied }">
		Denied
	</c:when>
	<c:otherwise>
		Pending
	</c:otherwise>
	</c:choose>
	</td>
</tr>
<tr class="<%=even?"even":"odd"%> hideText" id="ref_${req.id }">
	<td colspan="5">

	<table width="50%">
		<tr>
			<td width="30"><b>Full Name:</b></td>
			<td>	<c:out value="${req.fullName}" /></td>
		</tr>
		<tr>
			<td><b>Phone Number:</b></td>
			<td>	<c:out value="${req.phoneNumber}" /></td>
		</tr>
	</table>
	<br>
	<table border="1">
		<tr>
			<td>&nbsp;</td>
			<td><b>Passport Address</b></td>
			<td><b>Shipping Address</b></td>
		</tr>
		<tr>
			<td>Address 1:</td>
			<td><c:out value="${req.address.address1}" />&nbsp;</td>
			<td><c:out value="${req.shippingAddress.address1}" />&nbsp;</td>
		</tr>
		<tr>
			<td>Address 2:</td>
			<td><c:out value="${req.address.address2}" />&nbsp;</td>
			<td><c:out value="${req.shippingAddress.address2}" />&nbsp;</td>
		</tr>
		<tr>
			<td>Address 3:</td>
			<td><c:out value="${req.address.address3}" />&nbsp;</td>
			<td><c:out value="${req.shippingAddress.address3}" />&nbsp;</td>
		</tr>
		<tr>
			<td>City:</td>
			<td><c:out value="${req.address.city}" />&nbsp;</td>
			<td><c:out value="${req.shippingAddress.city}" />&nbsp;</td>
		</tr>
		<tr>
			<td>State:</td>
			<td><c:out value="${req.address.state.name}" />&nbsp;</td>
			<td><c:out value="${req.shippingAddress.state.name}" />&nbsp;</td>
		</tr>
		<tr>
			<td>Postal Code:</td>
			<td><c:out value="${req.address.postalCode}" />&nbsp;</td>
			<td><c:out value="${req.shippingAddress.postalCode}" />&nbsp;</td>
		</tr>
		<tr>
			<td>Province:</td>
			<td><c:out value="${req.address.province}" />&nbsp;</td>
			<td><c:out value="${req.shippingAddress.province}" />&nbsp;</td>
		</tr>
		<tr>
			<td>Country:</td>
			<td><c:out value="${req.address.country.name}" />&nbsp;</td>
			<td><c:out value="${req.shippingAddress.country.name}" />&nbsp;</td>
		</tr>
	</table>
	
	</td>
	
</tr>
	<% even = !even; %>

</c:forEach>
</table>

        </td>
    </tr>
</table>
</body>
</html>
