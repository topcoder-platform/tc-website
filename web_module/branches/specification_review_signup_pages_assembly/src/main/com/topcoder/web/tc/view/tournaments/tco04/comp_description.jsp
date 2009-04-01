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
<jsp:param name="tabLev2" value="details"/>
<jsp:param name="tabLev3" value="description"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class=bodySpacer>
            
        <p class=pageTitle>Description of the Component Design and Development Competition</p>

        <p>Eight Component finalists will be invited to attend the onsite finals in Santa Clara, CA, USA.</p>
            <ul>
                <li><strong>Registration</strong><br />
                    STARTS: Monday, August 9 at 9:00 AM ET<br/>
                    ENDS: Tuesday, September 7 at 9:00 AM ET</li>
                <li><strong>Competition Starts</strong><br />
                    August 10, 2004<br />
                <li><strong>Onsite Review of Competition</strong><br />
                    November 12, 2004 at the Santa Clara Marriott in Santa Clara, CA, USA</li>
                <li><strong>Free Competition</strong><br />
                <a href="/tc?module=ViewActiveContests&ph=112">View eligible components</a></li>
                <li><strong>Open to all registered TopCoder members over the age of 18.</strong></li>
            </ul>

            <p>See the official rules and regulations for more details.</p>

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