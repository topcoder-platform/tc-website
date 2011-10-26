<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/tcStyles.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="algorithm"/>
<jsp:param name="tabLev2" value="details"/>
<jsp:param name="tabLev3" value="description"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class=bodySpacer>
            
        <p class=bigTitle>Description of the Algorithm Competition</p>

            Once again, 24 of the world's best collegiate coders will be invited to compete live at the onsite finals in Santa Clara, CA, USA.</p>
            <ul>
                <li><strong>Registration</strong><br />
                    STARTS: Monday, December 20, 2004 at 9:00 AM EST<br/>
                    ENDS: Tuesday, January 11, 2005 at 9:00 AM EST</li>
                    
                <li><strong>Qualification Round</strong><br />
                    STARTS: Tuesday, January 11, 2005 at 12:00 PM EST (noon)<br/>
                    ENDS: Wednesday, January 12, 2005 at 12:00 PM EST (noon)</li>
                    
                <li><strong>Elimination Rounds</strong><br/>
                     January 15<br/>
                     January 19<br/>
                     January 26<br/>
                     February 2
                     </li>
                <li><strong>Onsite Finals</strong><br />
                    March 10 & 11 at the Santa Clara Marriott in Santa Clara, CA, USA</li>
                <li><strong>Free Competition</strong></li>
                <li><strong>Open to all eligible college students over the age of 18.</strong></li>
                <li><strong>Login to the <a href="/tc">member homepage</a> to view your registration information.</strong></li>
            </ul>
            
            See the official <A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=alg_rules">rules and regulations</A> for more details.

        </div>
		</td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../../public_right.jsp">
            <jsp:param name="level1" value="tccc05"/>
            </jsp:include>
         </td>
		
	</tr>
	
</table>
	
	


<jsp:include page="../../foot.jsp" />

</body>

</html>
