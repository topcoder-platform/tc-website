<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder News Archive</title>

<jsp:include page="../../script.jsp" />

</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
		<td width="180">
			<jsp:include page="../includes/global_left.jsp">
				<jsp:param name="level1" value=""/>
				<jsp:param name="level2" value=""/>
			</jsp:include>
		</td>
<!-- Left Column Ends -->
 
<!-- Center Column Begins -->
         <td width="100%" align="center">

         <div class="myTCBody">
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="news_archive"/>
            <jsp:param name="title" value="Algorithm Competitions"/>
        </jsp:include>

            <table border=0 cellpadding=2 cellspacing=0 width="100%">
            <tr class="bodyText"><td nowrap="nowrap">06.02.05 7:50 PM&#160;-&#160</td><td width="100%"><A href="/tc">Top 10 Countries Now Linkable</A></td></tr>
            <tr class="bodyText"><td nowrap="nowrap">05.13.05 11:50 AM&#160;-&#160</td><td width="100%"><A href="/rtables/viewThread.jsp?forum=7167&thread=496779&mc=1">Unused Code Checker in Arena</A></td></tr>
            <tr class="bodyText"><td nowrap="nowrap">05.05.05 12:30 PM&#160;-&#160</td><td width="100%"><A href="/rtables/viewThread.jsp?forum=7167&thread=495563&mc=1">Compilers & testers have been updated with Java 5</A></td></tr>
            <tr class="bodyText"><td nowrap="nowrap">03.18.05 3:45 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=help&d2=ratedEvent#extracoderule">Small change to Unused Code Rule, new problem timeout limit, and more...</A></td></tr>
            <tr class="bodyText"><td nowrap="nowrap">02.23.05 12:45 PM&#160;-&#160</td><td width="100%">SRM calendar updated for <A href="/index?t=schedule&c=may_05">May</A>, <A href="/index?t=schedule&c=jun_05">June</A>, and <A href="/index?t=schedule&c=jul_05">July</A></td></tr>
            <tr class="bodyText"><td nowrap="nowrap">02.14.05 5:14 PM&#160;-&#160</td><td width="100%"><A href="/?t=support&c=ratings_cal">Algorithm rating formulas updated</A></td></tr>
            </table>

        </div>
        <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
