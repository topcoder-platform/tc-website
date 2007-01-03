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
	 document.f.rid.value = rid;
	 document.f.action.value = action;	 
	 document.f.submit();
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
        <form action="/admin/?" >
        <input type="hidden" name="module" value="VisaLetters">
        <input type="hidden" name="rid" value="">
        <input type="hidden" name="action" value="">        
        	View request letters with status:<br>
			<input type="checkbox" name="pending" value="true" ${requestScope.pending? "checked": "" }/>Pending<br>
			<input type="checkbox" name="sent" value="true" ${requestScope.sent? "checked": "" } >Sent		<br>	
			<input type="checkbox"name="denied" value="true" ${requestScope.denied? "checked": "" } >Denied<br>
			<br>
			
			<tc-webtag:listSelect name="event" list="${requestScope.eventList}" useTopValue="false"/>
			<br>
			<input type="submit" value="Search" onClick="docyment.f.action.value='search'">
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

	<table>
		<tr>
			<td width="100"><b>Full Name:</b></td>
			<td>	<c:out value="${req.fullName}" /></td>
		</tr>
		<tr>
			<td><b>Phone Number:</b></td>
			<td>	<c:out value="${req.phoneNumber}" /></td>
		</tr>
	</table>
	<br>
	<table>
		<tr>
			<td></td>
			<td><b>Passport Address</b></td>
			<td><b>Shipping Address</b></td>
		</tr>
		<tr>
			<td>Address 1:</td>
			<td><c:out value="${req.address.address1}" /></td>
			<td><c:out value="${req.shippingAddress.address1}" /></td>
		</tr>
		<tr>
			<td>Address 2:</td>
			<td><c:out value="${req.address.address2}" /></td>
			<td><c:out value="${req.shippingAddress.address2}" /></td>
		</tr>
		<tr>
			<td>Address 3:</td>
			<td>Address 3:</td>
			<td><c:out value="${req.shippingAddress.address3}" /></td>
		</tr>
		<tr>
			<td>City:</td>
			<td>City:</td>
			<td><c:out value="${req.shippingAddress.city}" /></td>
		</tr>
		<tr>
			<td>State:</td>
			<td><c:out value="${req.address.state.name}" /></td>
			<td><c:out value="${req.shippingAddress.state.name}" /></td>
		</tr>
		<tr>
			<td>Postal Code:</td>
			<td><c:out value="${req.address.postalCode}" /></td>
			<td><c:out value="${req.shippingAddress.postalCode}" /></td>
		</tr>
		<tr>
			<td>Province:</td>
			<td><c:out value="${req.address.province}" /></td>
			<td><c:out value="${req.shippingAddress.province}" /></td>
		</tr>
		<tr>
			<td>Country:</td>
			<td><c:out value="${req.address.country.code}" /></td>
			<td><c:out value="${req.shippingAddress.country.code}" /></td>
		</tr>
	</table>
	
	</td>
	
</tr>
	<% even = !even; %>

</c:forEach>
</table>

		</form>
        </td>
    </tr>
</table>
</body>
</html>
