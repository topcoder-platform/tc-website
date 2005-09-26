<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<title>Development FAQ</title>

<jsp:include page="../../script.jsp" />

</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="level1" value="development"/>
                <jsp:param name="level2" value="support"/>
                <jsp:param name="level3" value="ratings"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br />

<h2>Development Faq</h2>
<p>If you have any questions concerning Design and Development Ratings that are not answered here, please send an email to <A href="mailto:service@topcoder.com">service@topcoder.com</A>.</p>

                <a name="des_dev"></a>
                <h3>Design / Development Ratings</h3>

                <p>
                After each competition, each coder who submitted a solution to the competition is re-rated according to the following algorithm. Keep in mind that software competitions consist of the last 50 scored components, excluding the coder's own previous component submissions.  The ranking of each coder is then determined based on the score the coder received compared to the scores of the last 50 scored components.  The rating used for the previous scores is the rating of the coder at the time the coder submitted the solution.
                The average rating of everyone is then calculated:
                <BR/>
                                    <BR/>
                                    <IMG ALT="average rating" HEIGHT="58" WIDTH="167" SRC="/i/rating/avg.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
                Where NumCoders is the number of coders in the competition and Rating is the
                rating without the volatility of the coder in the competition before the competition.
                <BR/>
                                    <BR/>
                <B>The competition factor is calculated:</B>
                <BR/>
                                    <BR/>
                                    <IMG ALT="competition factor" HEIGHT="62" WIDTH="356" SRC="/i/rating/cf.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
                Where Volatility is the volatility of the coder in the competition before the competition.
                <BR/>
                                    <BR/>
                  <b>Win Probability Estimation Algorithm::</b>
                                    <BR/>
                                    <IMG ALT="win probability" SRC="/i/rating/wp.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
Where Rating1 &amp; Vol1 are the rating and volatility of the coder being compared to, and Rating2 &amp; Vol2 are the rating and volatility of the coder whose win probability is being calculated.  Erf is the "<A href="http://mathworld.wolfram.com/Erf.html" target="_blank">error function</A>".

                <BR/>
                                    <BR/>
                The probability of the coder getting a higher score than another coder in the
                competition (WPi for i from 1 to NumCoders) is estimated.
                The expected rank of the coder is calculated:
                <BR/>
                                    <BR/>
                                    <IMG ALT="expected rank" SRC="/i/rating/er.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
                <B>The expected performance of the coder is calculated:</B>
                <BR/>
                                    <BR/>
                                    <IMG ALT="expected performance" SRC="/i/rating/ep.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
                Where <IMG ALT="inverse standard normal" HEIGHT="11" WIDTH="11" SRC="/i/rating/phi.gif" BORDER="0"/>
                is the inverse of the standard normal function.
                <BR/>
                                    <BR/>
                <B>The actual performance of each coder is calculated:</B>
                <BR/>
                                    <BR/>
                                    <IMG ALT="expected performance" SRC="/i/rating/ap.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
                Where ARank is the actual rank of the coder in the competition based on score
                (1 for first place, NumCoders forlast).  If the coder tied with another coder,
                the rank is the average of the positions covered by the tied coders.
                <BR/>
                                    <BR/>
                <B>The performed as rating of the coder is calculated:</B>
                <BR/>
                                    <BR/>
                                    <IMG ALT="performed as" SRC="/i/rating/pa.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
                <B>The weight of the competition for the coder is calculated:</B>
                <BR/>
                                    <BR/>
                                    <IMG ALT="weight of the competition" SRC="/i/rating/wt.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
                Where TimesPlayed is the number of times the coder has been rated before.
                <BR/>
                                    <BR/>
                To stabilize the higher rated members, the Weight of members whose rating is
                between 2000 and 2500 is decreased 10% and the Weight of members whose rating
                is over 2500 is decreased 20%.
                <BR/>
                                    <BR/>
                <B>A cap is calculated:</B>
                <BR/>
                                    <BR/>
                                    <IMG ALT="cap" HEIGHT="37" WIDTH="186" SRC="/i/rating/cap.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
                <B>The new volatility of the coder is calculated:</B>
                <BR/>
                                    <BR/>
                                    <IMG ALT="new volatility" SRC="/i/rating/nv.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
                <B>The new rating of the coder is calculated:</B>
                <BR/>
                                    <BR/>
                                    <IMG ALT="new rating" HEIGHT="37" WIDTH="253" SRC="/i/rating/nr.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
                If |NewRating - Rating| &#62; Cap the NewRating is adjusted so it is at most Cap different than Rating.
                <BR/>
                                    <BR/>
                                    <BR/>
                                    <BR/>


            <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="180">
            <jsp:include page="../right.jsp"/>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
