<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/style.css"/>
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
		<td valign=top align=center>
		<div class=bodySpacer>
            
        			
               <div align="center"><img src="/i/tournament/tccc05/motorola_header.gif" alt="" border="0" /></div>

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
					
					<p>Check out the <a href="/">jobs available to TopCoder members</a>.</p>

        </div>
		</td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../../public_right.jsp">
            <jsp:param name="level1" value="motorola"/>
            </jsp:include>
         </td>
		
	</tr>
	
</table>
	
	


<jsp:include page="../../foot.jsp" />

</body>

</html>
