<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java" import="com.topcoder.web.admin.controller.request.VisaLetters"%>
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
function checkSearch() {
    if (!document.f.pending.checked && !document.f.sent.checked && !document.f.denied.checked) {
        alert("Please select a status");
        return false;
    }
    return true;
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
   
  return;
}
 function checkAll(check) {
   var e = document.f.elements;
   for (i=0; i<e.length; i++) {
     if (e[i].name=="selected") {
       e[i].checked = (check==true);
     }
   }
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
        <a href="/admin/?module=EventList">Manage Events</a>
        <br>
        
<c:choose>
<c:when test="${empty requestScope.eventList}">
No Visa Letter Events defined.
</c:when>
<c:otherwise>

        <c:if test="${not empty requestScope.rowsUpdated }" >
            <center>
                <font color="green" size="+1">
                    <c:out value="${requestScope.rowsUpdated }" /> rows updated
                </font>
               </center>
        </c:if>
        <form name="f" action="/admin/?" >
        <input type="hidden" name="module" value="VisaLetters">

<table width="30%"> 
    <tr>
        <td valign="top" width="50">Status:</td>
        <td>
            <input type="checkbox" name="<%= VisaLetters.VIEW_PENDING %>" value="true" ${requestScope.pending? "checked": "" }/>Pending<br>
            <input type="checkbox" name="<%= VisaLetters.VIEW_SENT %>" value="true" ${requestScope.sent? "checked": "" } >Sent      <br>    
            <input type="checkbox"name="<%= VisaLetters.VIEW_DENIED %>" value="true" ${requestScope.denied? "checked": "" } >Denied<br>
        </td>
    </tr>
    <tr>
        <td>Event:</td>
        <td><tc-webtag:listSelect name="<%= VisaLetters.FILTER_EVENT %>" list="${requestScope.eventList}" useTopValue="false" /></td>
    </tr>
    <tr>
        <td></td>
        <td>
        <input type="submit" value="Search" onClick="return checkSearch()">
        </td>
    </tr>
</table>    
    
<br>
<br>

        <input type="hidden" name="module" value="VisaLetters">
        
<a href="Javascript:checkAll(true)">check all</a> | 
<a href="Javascript:checkAll(false)">uncheck all</a>
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
    <td width="20px">
         <a href="javascript:toggleDisplay('ref_${req.id }','switch_${req.id }');" onfocus="this.blur();"><img src="/i/interface/exp_w.gif" alt="Open" name="switch_${req.id }" border="0"/></a>
    </td>
    <td width="20px">
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
            <td>    <c:out value="${req.fullName}" /></td>
        </tr>
        <tr>
            <td><b>Phone Number:</b></td>
            <td>    <c:out value="${req.phoneNumber}" /></td>
        </tr>
        <tr>
            <td><b>e-mail:</b></td>
            <td>    <c:out value="${req.user.primaryEmailAddress.address}" /></td>
        </tr>       
    </table>
    <br>
    <table border="1">
        <tr>
            <td><b>Passport Address</b></td>
            <td><b>Shipping Address</b></td>
        </tr>
        <tr>
            <td>
                <c:out value="${req.address.address1}" /><br>
                <c:out value="${req.address.address2}" /><c:if test="${not empty req.address.address2}"><br></c:if>
                <c:out value="${req.address.address3}" /><c:if test="${not empty req.address.address3}"><br></c:if>
                <c:out value="${req.address.city}" />, <c:out value="${req.address.state.name}" /><br>      
                <c:out value="${req.address.postalCode}" /><c:if test="${not empty req.address.postalCode}"><br></c:if>
                <c:out value="${req.address.province}" /><c:if test="${not empty req.address.province}"><br></c:if>
                <c:out value="${req.address.country.name}" />
            </td>
            <td>
                <c:out value="${req.shippingAddress.address1}" /><br>
                <c:out value="${req.shippingAddress.address2}" /><c:if test="${not empty req.shippingAddress.address2}"><br></c:if>
                <c:out value="${req.shippingAddress.address3}" /><c:if test="${not empty req.shippingAddress.address3}"><br></c:if>
                <c:out value="${req.shippingAddress.city}" />, <c:out value="${req.shippingAddress.state.name}" /><br>      
                <c:out value="${req.shippingAddress.postalCode}" /><c:if test="${not empty req.shippingAddress.postalCode}"><br></c:if>
                <c:out value="${req.shippingAddress.province}" /><c:if test="${not empty req.shippingAddress.province}"><br></c:if>
                <c:out value="${req.shippingAddress.country.name}" />
            </td>
        </tr>
    </table>
    
    </td>
    
</tr>
    <% even = !even; %>

</c:forEach>
</table>
<a href="Javascript:checkAll(true)">check all</a> | 
<a href="Javascript:checkAll(false)">uncheck all</a>
<br>
<br>
<br>
<input type="submit" value="Change status to " name="update" onClick="document.f.method='post'">
<select name="status">
    <option value="<%= VisaLetters.SENT %>">Sent</option>
    <option value="<%= VisaLetters.DENIED %>">Denied</option>
    <option value="<%= VisaLetters.PENDING %>">Pending</option>
</select>
</form>
</c:otherwise></c:choose>        
        </td>
    </tr>
</table>
</body>
</html>
