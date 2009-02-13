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

        <p>If you're looking for information on <strong>THE</strong> premier international programming tournament, you've come to the right place!  
        The 2004 TopCoder Open, Sponsored by Microsoft&#174; will set as rivals some of the IT industry's top professionals and 
        international collegiate coders.  Software will be designed and developed.  Seemingly unsolvable algorithmic problems 
        will be solved. $150,000 will be awarded over the course of 14 weeks.</p>
        
        <h3>ARE YOU READY?</h3>
        
        
		<ul>
		<li><span class="bodySubtitle">Who:</span><br/>	
       		All registered TopCoder members over the age of 18</li>

		<li><span class="bodySubtitle">What:</span><br/>
       		Algorithm Competition<br/>
       		Component Design Competition<br/>
       		Component Development Competition
       	</li>

		<li><span class="bodySubtitle">Where:</span><br/>	
			Santa Clara Marriott in Santa Clara, CA, USA</li>

		<li><span class="bodySubtitle">When:</span><br/>	
			Algorithm and Component registration opens August 9th<br/>
			Component Development Competition starts August 10th<br/>
       		Component Design Competition starts August 12th	<br/>
       	</li>

		<li><span class="bodySubtitle">How Much:</span><br/>	
			$100,000 will be awarded to Component Design & Development competitors<br/>
       		$50,000 will be awarded to Algorithm competitors	
       	</li>
       	</ul>       		
       	<p>See the official rules and regulations for full details.</p>

            
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
