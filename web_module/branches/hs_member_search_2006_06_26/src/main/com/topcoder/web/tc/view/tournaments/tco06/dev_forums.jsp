<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO06style.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="join_us"/>
<jsp:param name="tabLev3" value="dev_forums"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
   <tr valign=top>
      <td valign=top align=center>
      <div class=bodySpacer>
            
<span class="bigTitle">Developer Forums</span>
<br><br>
Three reasons to join us at the Aladdin Resort and Casino for the 2006 TopCoder Open:
<br><br>
<span class="bodySubtitle">Thursday, May 4th</span>
<br><br>
<b>10:00AM - 10:45AM<br>
Secondhand Shopping:  Efficient Component Reuse</b><br>
Component based software engineering only works if the components developed are reused on a regular basis.  When a library grows very large and diverse it becomes increasingly difficult for designers and developers to locate relevant components.  If it becomes too difficult they are likely to decide to redesign / redevelop the functionality themselves, or duplicate it in a similar component, thus negating the advantages of component based software engineering and reuse.  The search feature then becomes key, and raises the question: what to search on?  Utilizing reuse metric information by tracking who is downloading what components in what applications will provide access to hardened assets to improve quality and time to market.
<br><br>
<span class="bodySubtitle">Friday, May 5th</span>
<br><br>
<b>11:00AM - 11:45AM<br>
Bringing It All Together Using SOA Architectures</b><br>
In today's IT environments, it is rare that an organization has the opportunity to reinvent itself from the ground up. Often we find ourselves saddled with stovepipe systems, a plethora of technologies, and software purchased but not implemented (shelfware) thanks to our "if it isn't broken, don't fix it" rationale. The conventional wisdom has been to either continue to exist disconnected or to invest heavily in cross-system enterprise integration platforms. The first is inefficient and the second frightens CEOs and CIOs equally due to the risk, scope, cost, and complexity of such endeavors.  Both new and legacy solutions, from internal and external sources, are being hidden behind a SOA architecture.  This discussion will address the various ways to properly utilize SOA to solve these types of problems.
<br><br>
<b>2:00PM - 2:45PM<br>
Next Generation Development Round Table Discussion</b><br>
This round table discussion will discuss the implications of next generation development. Find out how the paradigm of User Interfaces changes when considering how to design and build systems using next generation software. 
<br><br>
        </div>
      </td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />

</body>

</html>
