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
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="details"/>
<jsp:param name="tabLev3" value=""/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
<table width="510" border=0 cellpadding=0 cellspacing=0>
<tr>
<td>
            
        <img src="/i/tournament/tco04/microsoft_header.jpg" width=510 height=136 border=0>

        <p>As an elite TopCoder, you represent the best and the brightest of 
        the coding world. Microsoft welcomes the participants to the 2004 TopCoder Open 
        and wishes you luck as you go head-to-head in this year's competition.  You've 
        already come a long way; how much farther can you go?</p>

		<p>Imagine having the resources to create tomorrow's technology today, using 
		your skills to create products and solutions that will touch the lives of 
		millions of people. And having fun while you do it. That's Microsoft. People 
		at Microsoft love their work because they get to think big and dream big. A 
		proud sponsor of this year's competition, Microsoft is looking for the next 
		generation of technology innovators. If you have talent and a passion for 
		technology, this could be your big moment.</p>

		<p>Visit <a href="http://www.microsoft.com/careers">www.microsoft.com/careers</a> 
		to search for jobs.</p>

		<p>Or if you're a college student, check out our college career site: 
		<a href="http://www.microsoft.com/college">www.microsoft.com/college</a> </p>

   </td>
   </tr>
   </table>

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
