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
<jsp:param name="tabLev2" value="design"/>
<jsp:param name="tabLev3" value="summary"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class=bodySpacer>
            
        <p class=pageTitle>adic</p>

		<img src="/i/clear.gif" width="1" height="10" border="0"/><br/>
		<div class="leadPhoto">
		<span class="bodyText" align="center"><p align="center"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=photos">See more photos!</a></p></span>
		<img src="/i/tournament/tco04/onsite_photos/shot_design.jpg" alt="" width="200" height="350" class="photoFrameBig" /><br/>
		<span class="leadPhotoCaption">Caption<br/><br/></span>
		</div>

		<img src="/i/m/ivern_mug.gif" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/>
		<p>by ivern, <br/>
		<em>TopCoder Staff</em><br />
		Thursday, November 12, 2004<br/>
		<br/><br/>
The TCO component competition was actually two separate competitions:  design and development.  For the design competition, the finalists were given a requirements specification for a component and were expected to submit a complete design for it.  For development, they were given a complete design and had to submit a complete implementation and unit test suite for it.
<br/><br/>
Before getting to the finals, the competitors had to progress through three rounds of online competition.  The four competitors who obtained the highest aggregate score among their top three components advanced to the finals, which were also held online.
<br/><br/>
The URL History component maintains a dynamic list of URLs on a per-user basis.  The URLs are added to the list as they become available, and the user is allowed to retrieve them in sorted order.  The component is required to be extensible to allow the user to define new ways to sort the URLs.
<br/><br/>
Another important requirement for this component is to handle the URL list’s persistence mechanism.  Besides managing the persistence itself, the component also needs to administer this storage to automatically purge URLs once they reach a configurable expiration age or once the storage reaches a configurable size.
<br/><br/>
The component also allows the user to place URLs in groups, to blacklist them so they never show up in the history, or to flag them so they never expire.
<br/><br/>
When asked what he liked the most about the winning submission, reviewer TheCois replied that he admired the great amount of flexibility it offered.  He also liked how the design was both easy to implement and to use.
		</p>
<p>
<br/><br/>
</p>
            
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
