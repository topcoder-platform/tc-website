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
		<td valign=top align=center>
		<div class=bodySpacer>
            
        <p class=pageTitle>2004 TopCoder Open - Overview</p>

        <p>If you're looking for information on the premier international programming tournament, you've come to the right place!  
        The 2004 TopCoder Open, Sponsored by Microsoft&#174; will set as rivals some of the IT industry's top professionals and 
        international collegiate coders.  Software will be designed and developed.  Seemingly unsolvable algorithmic problems 
        will be solved. $150,000 will be awarded over the course of 14 weeks.</p>
        
        <h3>ARE YOU READY?</h3>
        
        
		<blockquote>
  		<h3>Who</h3>
  		<ul>
       		<li>All registered TopCoder members over the age of 18</li>
       	</ul>
       	
       	<h3>What</h3>
       	<ul>
       		<li>Algorithm Competition</li>
       		<li>Component Design Competition</li>
       		<li>Component Development Competition</li>
       	</ul>

       	
       	<h3>Where</h3>
       	<ul>
       		<li>Santa Clara Marriott in Santa Clara, CA</li>
       	</ul>

		<h3>When</h3>
		<ul>
       		<li>Component Development Competition starts August 10th</li>
       		<li>Component Design Competition starts August 12th</li>
       		<li>Algorithm Competition registration opens August 16th; competition starts September 7th</li>
       	</ul>

       	
       <h3>How Much</h3>
       <ul>
       		<li>$100,000 will be awared to Component Design & Development competitors</li>
       		<li>$50,000 will be awared to Algorithm competitors</li>
       	</ul>
       	
       	<p>See the official rules and regulations for full details.</p>
       	</blockquote>
            
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
