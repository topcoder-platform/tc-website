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
  
  <style type="text/css">
.calendar,
.calendar table { width: 250px; height: 200px; }
</style>
</head>

<body>
<jsp:include page="top.jsp"/>
<table border="1">
    <tr valign="top">
        <td width="200">
            <jsp:include page="left.jsp"/>
        </td>
        <td>
                <br>
        
<form name="f" action="/admin/" method="post">
<center>
<table border="1">
    <tr>
        <td colspan="2">
            <tc-webtag:errorIterator id="err" name="error">
                <font color="#FF0000"><%=err%></font><br/>
            </tc-webtag:errorIterator>
        </td>
    </tr>
	<tr>
		<td width="100 px">Event Name:</td>
		<td width="250 px"><tc-webtag:textInput name="name" size="50" editable="true" /></td>
	</tr>
	<tr>
		<td>School:</td>
		<td><tc-webtag:textInput name="sid" size="6" editable="true" /> (use ajax!)</td>
	</tr>
	<tr>
		<td>Forum:</td>
		<td><tc-webtag:textInput name="fid" size="6" editable="true" /> (use ajax!)</td>
	</tr>
	<tr>
		<td>Timezone:</td>
        <td class="value">
            <tc-webtag:objectSelect name="tz" list="${timezones}" valueField="id" textField="description"  topText="[Select one]" topValue="-1" />
        </td>
   </tr>

	<tr>
		<td>Image:</td>
        <td class="value">
            <tc-webtag:objectSelect name="tz" list="${images}" valueField="id" textField="fileName" topText="[Select one]" topValue="-1" /> use ajax!
        </td>
   </tr>
	
<c:forEach items="${config}" var="cfg" >
<c:if test="${cfg.type==1 || (hasAlgo && cfg.type==2) || (hasComp && cfg.type==3) }">
	<tr>
		<td>${cfg.description }</td>
		<td><tc-webtag:textInput name="cfg${cfg.id}" size="30" editable="true" /></td>
   </tr>
</c:if>		
</c:forEach>	
<!-- 
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
	
 -->		
</table>
</center>
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
<script language="javascript" type="text/javascript">
</script>

<input type="submit" value="Save Event">

</form>
        </td>
    </tr>
</table>


</body>
</html>
