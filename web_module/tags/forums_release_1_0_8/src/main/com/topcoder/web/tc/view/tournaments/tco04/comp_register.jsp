<%@ page import="java.util.Calendar,
                 java.util.Date"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Open - Computer Programming Tournament</title>
<jsp:include page="../../script.jsp" />
<link type="text/css" rel="stylesheet" href="/css/TCO04style.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="component"/>
<jsp:param name="tabLev2" value="register"/>
<jsp:param name="tabLev3" value=""/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class=bodySpacer>

                <%
        Calendar now = Calendar.getInstance();
        now.setTime(new Date());
        Calendar end = Calendar.getInstance();
        end.set(2004, Calendar.SEPTEMBER, 7, 9, 0);
        Calendar beginning = Calendar.getInstance();
        beginning.set(2004, Calendar.AUGUST, 9, 9, 0);
        %>


        <p class=pageTitle>Component Competition Registration</p>
        <% if (now.before(beginning)) { %>
        <p>Registration for the Component Competition opens Monday, August 9 at 9:00 AM ET</p>
        <% } %>
        <% if (now.after(beginning) && now.before(end)) { %>
        <p><span class="bodySubtitle">Click <a href="/tc?module=TCO04ComponentTerms">here</a> to register for the Component Competition now.</span></p>
        <% } %>
        <% if (now.after(end)) { %>
        <p>Registration for the Component Competition is closed.</p>
        <% }%>

         <p><br/></p>

        </div>
		</td>


<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../../public_right.jsp">
            <jsp:param name="level1" value="tco04"/>
            </jsp:include>
         </td>
		
	</tr>
	
</table>
	
	


<jsp:include page="../../foot.jsp" />

</body>

</html>
