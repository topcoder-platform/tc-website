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
<jsp:param name="tabLev1" value="component"/>
<jsp:param name="tabLev2" value="development"/>
<jsp:param name="tabLev3" value="summary"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class="bodySpacer">
            
        <p class="bigTitle">Component Development Competition Summary</p>

		<div class="leadPhoto">
		<span class="bodyText" align="center"><p align="center"><a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=photos">See more photos!</a></p></span>
		<img src="/i/tournament/tccc05/onsite_photos/shot_development.jpg" alt="" class="photoFrameBig" /><br/>
		<span class="leadPhotoCaption">$13,000 of happiness<br/><br/></span>
		</div>

		<img src="/i/m/ivern_mug.gif" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/>
		<p>by ivern, <br/>
		<em>TopCoder Staff</em><br />
		Friday, March 11, 2005<br/>
		<br/><br/>
The TCCC component competition was actually two separate competitions: design and development. For the development competition, the participants were given a finished component on which they were required to perform a number of enhancements.  Each enhancement on the list had an associated point score, which along with its review score determined how many points the submitter received for that task. 
<br><br>
Before getting to the finals, the competitors had to progress through four rounds of online competition. The four competitors who obtained the highest aggregate  score among their top three components advanced to the finals, which were also held online.
<br><br>
The development finals component was a Dependency Map Renderer.  This component displays a complex dependency map as an image.  The image created by this component will be in different formats depending on the renderer used to create the image.  A pluggable interface allows multiple renderers to be added to the component.  The initial renderer supplied with the component creates SVG graphics.  In addition to supporting multiple renderers, a pluggable
layout engine is also included with the component.  The layout engine
allows different style formatting for the produced image.  TopCoder
intends to use this component to graphically depict relationships
between components.  Now developers will be able to browse and view the
hierarchy of components.  
<br><br>
The enhancements the submitters worked on ranged from adding a method to render a number of diagrams at once to altering the layout manager to compress the resulting images.
         <p><br/></p>

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
