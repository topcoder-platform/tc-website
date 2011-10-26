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
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="details"/>
<jsp:param name="tabLev3" value=""/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class=bodySpacer>
            
        <p class=bigTitle>2005 TopCoder Collegiate Challenge - Overview</p>
		<p>Welcome to the official site of the 2005 TopCoder&#174; Collegiate Challenge, Sponsored by Yahoo!&#174; - a battle of some of the world's top international collegiate coders along two exciting competitive tracks.  Software components will be crafted and implemented.  Algorithmic problems of astounding difficulty will be solved.  $150,000 will be awarded over the course of 10 weeks.
		<br/><br/>
		<h3>HERE ARE THE FACTS...</h3>
		<ul>
		<li>
		<span class=bodySubtitle>Who</span><br/>
		All registered TopCoder members over the age of 18 who are matriculated full time at an accredited college or university
		</li>

		<li>
		<span class=bodySubtitle>What</span><br/>
		Algorithm Competition<br/>
		Component Design Competition<br/>
		Component Development Competition
		</li>

		<li>
		<span class=bodySubtitle>Where</span><br/>
		Santa Clara Marriott in Santa Clara, CA
		</li>

		<li>
		<span class=bodySubtitle>When</span><br/>
		Registration opens December 20, 2004<br/>
		Component Development Competition starts January 4, 2005<br/>
		Component Design Competition starts January 6, 2005<br/>
		Algorithm Competition starts January 11, 2005
		</li>

		<li>
		<span class=bodySubtitle>How much</span><br/>
		$90,000 for Component Design & Development competitors<br/>
		$60,000 for Algorithm competitors
		</li>
		</ul>

		See the official <A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=alg_rules">Algorithm</A> and <A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=comp_rules">Component</A> rules and regulations for full details.
		</p>

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
