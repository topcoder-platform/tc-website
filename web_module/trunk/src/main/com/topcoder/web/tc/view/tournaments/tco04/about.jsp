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

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
	<tr valign="top">
		<td valign=top align=center>
			<div class=bodySpacer>
            
            <p class=pageTitle>Algorithm Overview Page</p>

            <p>Tonight, TopCoder kicked off what promises to be its biggest and best event ever. 30 TopCoders, 
            representing 16 different countries, spent the evening getting to know one another at the opening 
            reception in the stylish Park Plaza hotel.  These coders are the best of the best, having survived 
            an extremely competitive month of online rounds, in which over 95% of coders were eliminated.</p>
            
            <p>Newcomers to the prestiguous onsite round used the time to their advantage, grilling competitors 
            who have been here before about the format and strategies of the onsite event.  But, for the most part, 
            the competitors relaxed and tried to forget about the extreme 75 minutes of furious coding that they 
            must undertake tomorrow.  Popular topics of discussion included the recent ACM competition and the 
            ImagineCup, two other competitions in which TopCoders did well.  Competitors also recounted humorous 
            anecdotes from prior competitions, the crowd favorite of which was related to Floyd's algorithm.  
            And of course, it wouldn't be a coding competition if there wasn't talk about algorithms.  
            In addition, representatives from sponsors Yahoo! and NVIDIA were present, chatting with members 
            and handing out goodies.</p>
            
            <p>The next two days promise to be exciting -- the top designer and developer will be decided and 
            the final four algorithm coders will advance and vie for the $25,000 grand prize.  Congratulations 
            to all the coders who have made it so far, and good luck to everyone in the upcoming events.</p>
            
         	</div>
		</td>
        
         
<!-- Right Column-->
        <td width="170" align="right">
        	<a href="/"><img src="/i/tournament/tco04/topcoder_logo.gif" width="170" height="24" border="0"></a><br/>
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
		
	</tr>
	
</table>
	
	


<jsp:include page="../../foot.jsp" />

</body>

</html>
