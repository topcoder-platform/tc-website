<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<jsp:include page="../../script.jsp" />
<link type="text/css" rel="stylesheet" href="/css/TCCC05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/style.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="join_us"/>
<jsp:param name="tabLev3" value="showdown"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class=bodySpacer>
            
      <div align="center">
		<img src="/i/tournament/tccc05/ss_logo.gif" border=0 />
      </div>

        <p>Want a chance to meet other TopCoder members and compete for prizes? Are you new to TopCoder and want to see what 
        our tournaments are all about? Do you live in the San Jose area and need an excuse to get away from work on a Friday 
        afternoon? If so, then the TCCC Spectator Showdown is for you!</p>

<%-- uncomment this when SS starts --%>
<%--
		<p align=right><A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=ss_leaderboard_website">view the leaderboard</A>
--%>
<%-- uncomment this when SS photos are up --%>
<%--
		&#160;&#160;/&#160;&#160;<A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=photos">photos</A>
--%>
		</p>

		<p><span class="bodySubtitle">OPEN COMPETITION!</span><br/>TopCoder is introducing a competition for attendees of the 2004 TopCoder Open. The TCCC Spectator Showdown is a 
		competition open to members of the event audience who want to join in the competitive spirit and battle for prizes.  
		It's is an exciting way to see how your algorithmic skills match up against others' skills on TopCoder problems. </p> 

		<p><span class="bodySubtitle">TEST YOUR SKILLS!</span><br/>We will have a separate competition room at the Santa Clara Marriott that is open from 9:00AM to 3:30PM PT on Friday, 
		November 12. The room will be home to eight competition machines, which are being provided by Intel&#174;. Spectators 
		at the TCCC can stop in on Friday and test their skills on one of two possible questions.</p>

		<p><span class="bodySubtitle">PRIZES!</span><br/>Two grand prizes will be given away right before the Championship announcements are made for the Algorithm and 
		Component Competitions. Each grand prize includes a <strong>Microsoft&#174; Xbox video game console</strong>, an <strong>NVIDIA&#174; graphics 
		card</strong> and a <strong>Yahoo!&#174; gift pack</strong>.  <a href="Javascript:openWin('/tc?module=Static&d1=tournaments&d2=tccc05&d3=ss_rules','comp',545,655);">Click here</a> for the complete <a href="Javascript:openWin('/tc?module=Static&d1=tournaments&d2=tccc05&d3=ss_rules','comp',545,655);">rules</A>.</p>

		<p>We hope to see you there!</p>

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
