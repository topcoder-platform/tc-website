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
<jsp:param name="tabLev1" value="algorithm"/>
<jsp:param name="tabLev2" value="details"/>
<jsp:param name="tabLev3" value="description"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class=bodySpacer>
            
        <p class=pageTitle>Description of the Algorithm Competition</p>

        <p>
            The 2004 TopCoder Open is bigger and better than ever! 24 Algorithm finalists will be invited to compete live at the onsite finals in Santa Clara, CA.</p>
            <ul>
                <li><strong>Registration</strong><br />
                    STARTS: Monday, August 16 at 9:00 AM ET<br/>
                    ENDS: Tuesday, September 7 at 9:00 AM ET</li>
                    
                <li><strong>Qualification Round</strong><br />
                    STARTS: Tuesday, September 7 at 12:00 PM ET (noon)<br/>
                    ENDS: Wednesday, September 8 at 12:00 PM ET (noon)</li>
                    
                <li><strong>Elimination Rounds Start</strong><br/>
                     September 11</li>
                <li><strong>Onsite Finals</strong><br />
                    November 11 & 12 at the Santa Clara Marriott in Santa Clara, CA, USA</li>
                <li><strong>Free Competition</strong></li>
                <li><strong>Open to all registered TopCoder members over the age of 18.</strong></li>
            </ul>
            
            <p>See the official rules and regulations for more details.</p>

         <p><br/></p>
            
        </div>
		</td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
        	<a href="/"><img src="/i/tournament/tco04/topcoder_logo.gif" width=170 height=24 border=0></a><br/>
            <jsp:include page="../../public_right.jsp">
            <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
		
	</tr>
	
</table>
	
	


<jsp:include page="../../foot.jsp" />

</body>

</html>
