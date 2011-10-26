<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java" import="com.topcoder.web.admin.controller.request.EditEvent"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>                 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>TopCoder Admin</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    
<script language="javascript" type="text/javascript">
 </script>  
 
    <link type="text/css" rel="stylesheet" href="/js/jscal/skins/aqua/theme.css">
    <script type="text/javascript" src="/js/jscal/calendar.js"></script>
    <script type="text/javascript" src="/js/jscal/lang/calendar-en.js"></script>
    <script type="text/javascript" src="/js/jscal/calendar-setup.js"></script>
    <script language="javascript" type="text/javascript" src="/js/tcdhtml.js"></script>
  
  <script type="text/javascript">
  function contestChanged(n) {
  	if (n != 0) {
  		document.f.<%= EditEvent.NAME %>.value = document.f.<%= EditEvent.CONTEST_ID %>.options[n].text;
  	}
  }
  </script>
  
  <style type="text/css">
.calendar,
.calendar table { width: 250px; height: 200px; }
</style>
</head>

<body>
<jsp:include page="top.jsp"/>
<table>
    <tr valign="top">
        <td width="200">
            <jsp:include page="left.jsp"/>
        </td>
        <td>
                <a href="/admin/?module=EventList">Back to Manage Events</a>
                <br>
        
<form name="f" action="/admin/" method="post">
<input type="hidden" name="module" value="UpdateEvent">
<c:if test="${not empty param.eid }">
<input type="hidden" name="eid" value="${param.eid }">
</c:if>

<table>
    <tr>
        <td colspan="2">
            <tc-webtag:errorIterator id="err" name="error">
                <font color="#FF0000"><%=err%></font><br/>
            </tc-webtag:errorIterator>
        </td>
    </tr>
	<tr>
		<td>Contest:</td>
		<td>
			<tc-webtag:rscSelect name="<%= EditEvent.CONTEST_ID %>" list="${requestScope.tournament_contests}" fieldText="name" fieldValue="contest_id" topText="No Contest" topValue="0" onChange="contestChanged(this.selectedIndex)"/>
		</td>
	</tr>    
	<tr>
		<td width="150 px">Event Name:</td>
		<td width="200 px"><tc-webtag:textInput name="<%= EditEvent.NAME %>" size="50" editable="true" /></td>
	</tr>
	<tr>
		<td>Start Date:</td>
		<td><tc-webtag:textInput name="<%= EditEvent.START_DATE %>" id="<%= EditEvent.START_DATE %>" size="18" format="MM/dd/yyyy HH:mm" editable="true" />  
			<button id="<%="trigger_" + EditEvent.START_DATE %>">Set</button>     
		</td>
	</tr>
	<tr>
		<td>End Date:</td>
		<td><tc-webtag:textInput name="<%= EditEvent.END_DATE %>" id="<%= EditEvent.END_DATE %>" size="18" format="MM/dd/yyyy HH:mm" editable="true" />  
			<button id="<%="trigger_" + EditEvent.END_DATE %>">Set</button>
		</td>
	</tr>
</table>

<script language="javascript" type="text/javascript">
    <!--
Calendar.setup(
{
 inputField  : "<%= EditEvent.START_DATE %>",  
                    ifFormat    : "%m/%d/%Y %H:%M",  
                    button      : "trigger_<%= EditEvent.START_DATE %>",     
                    showsTime   : true,
                    singleClick  : false,
                    cache       : true
}
);

Calendar.setup(
{
 inputField  : "<%= EditEvent.END_DATE %>",  
                    ifFormat    : "%m/%d/%Y %H:%M",    
                    button      : "trigger_<%= EditEvent.END_DATE %>",     
                    showsTime   : true,
                    singleClick  : false,
                    cache       : true
}
);

                -->
</script>

<input type="submit" value="Save Event">

</form>
        </td>
    </tr>
</table>


</body>
</html>
