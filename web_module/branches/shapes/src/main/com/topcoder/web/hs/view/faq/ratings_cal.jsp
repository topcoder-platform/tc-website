<html>

<head>

<title>TopCoder | High School</title>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

<jsp:include page="../includes/css.jsp" />

</head>

<body>

<!-- Top begins -->
<jsp:include page="../includes/top.jsp" />
<!-- Top ends -->

<table border="0" cellspacing="0" cellpadding="0" width="100%">
    <tr valign="top">

<!-- Left Column begins -->
        <td width="170" bgcolor="#001934">
            <jsp:include page="../includes/left_nav.jsp" />
            <jsp:include page="../includes/left_calendar.jsp" />
        </td>
<!-- Left Column begins -->
        
<!-- Center Column begins -->
        <td valign="top" background="/i/hs/bluegradiant_bg.gif" bgcolor="#FFFFFF" width="99%">
            <table cellspacing="0" cellpadding="10" border="0" width="100%">
                <tr><td width="100%" bgcolor="#001934"><img src="/i/hs/headinginside_faq.gif" width="348" height="44" alt="Support" border="0"></td></tr>
                
                <tr valign="top">
                    <td width="100%" class="bodyText">
                        <h3>How Ratings Work (continued)</h3><a name="top"></a>
                        
                        <b>New ratings are calculated as follows:</b><br><br>
                After each competition, each coder who attended the competition is re-rated according
                the following algorithm.  Keep in mind that only coders who shared the same problem set are rated against one another.  The average rating of everyone in the competition is calculated:
                <br><br><img border="0" align="center" src="/i/hs/rating/avg.gif" width="167" height="58" alt="average rating"><br><br>
                Where NumCoders is the number of coders in the competition and Rating is the
                rating without the volatility of the coder in the competition before the competition.
                <br><br><b>The competition factor is calculated:</b><br><br><img border="0" align="center" src="/i/hs/rating/cf.gif" width="356" height="62" alt="competition factor"><br><br>
                Where Volatility is the volatility of the coder in the competition before the competition.
                <br><br><b>The skill of the coder is calculated:</b><br><br><img border="0" align="center" src="/i/hs/rating/skill.gif" width="138" height="34" alt="skill"><br><br>
                Where Rating is the coder's rating before the competition.
                <br><br><b>The deviation of the coder is calculated:</b><br><br><img border="0" align="center" src="/i/hs/rating/dev.gif" width="141" height="34" alt="deviation"><br><br>
                Where Volatility is the volatility of the coder before the competition.
                <br><br>
                The probability of the coder getting a higher score than another coder in the
                competition (WPi for i from 1 to NumCoders) is estimated.  See below for the 'Estimation Algorithm'.
                The expected rank of the coder is calculated:
                <br><br><img border="0" align="center" src="/i/hs/rating/er.gif" width="118" height="39" alt="expected rank"><br><br><b>The expected performance of the coder is calculated:</b><br><br><img border="0" align="center" src="/i/hs/rating/ep.gif" width="170" height="34" alt="expected performance"><br><br>
                Where <img border="0" src="/i/hs/rating/phi.gif" width="11" height="11" alt="inverse standard normal">
                is the inverse of the standard normal function.
                <br><br><b>The actual performance of each coder is calculated:</b><br><br><img border="0" align="center" src="/i/hs/rating/ap.gif" width="170" height="34" alt="expected performance"><br><br>
                Where ARank is the actual rank of the coder in the competition based on score
                (1 for first place, NumCoders forlast).  If the coder tied with another coder,
                the rank is the average of the positions covered by the tied coders.
                <br><br><b>The performed as rating of the coder is calculated:</b><br><br><img border="0" align="center" src="/i/hs/rating/pa.gif" width="286" height="14" alt="performed as"><br><br><b>The weight of the competition for the coder is calculated:</b><br><br><img border="0" align="center" src="/i/hs/rating/wt.gif" width="223" height="37" alt="weight of the competition"><br><br>
                Where TimesPlayed is the number of times the coder has been rated before.
                <br><br>
                To stabilize the higher rated members, the Weight of members whose rating is
                between 2000 and 2500 is decreased 10% and the Weight of members whose rating
                is over 2500 is decreased 20%.
                <br><br><b>A cap is calculated:</b><br><br><img border="0" align="center" src="/i/hs/rating/cap.gif" width="186" height="37" alt="cap"><br><br><b>The new volatility of the coder is calculated:</b><br><br><img border="0" align="center" src="/i/hs/rating/nv.gif" width="421" height="46" alt="new volatility"><br><br><b>The new rating of the coder is calculated:</b><br><br><img border="0" align="center" src="/i/hs/rating/nr.gif" width="253" height="37" alt="new rating"><br><br>
                If |NewRating - Rating| &gt; Cap the NewRating is adjusted so it is at most Cap different than Rating.
                <br><br><hr><br><br><b>Estimation Algorithm:</b><br><br>
Estimating the probability a coder gets a higher score than another coder is done by looking at either coder's
expected performance rating on a range of good to bad days.  Each coder's performance is modeled as a
normal distribution with a mean (the rating) and standard deviation (the volatility).  Using this model, a coder's
performance can be turned into a percentage using the normal distribution, so that 50% represents expected
performance and 25% represents better three days out of four, etc.  Then, to estimate the probability that the
coder beats coder i, the range from 0% to 100% is broken into 1% blocks, and the midpoint is taken of each
block and the corresponding performance is computed.  The win probability is the number of blocks where the
midpoint favors coder i.  If it's a tie, the block is split between both coders.
                <br><br>
Here is the psuedo-code function to estimate the probability of coder A beating coder B
(<span style="font-family:Symbol;">f</span> is the inverse of the
standard normal function):
                <br><br>
WinProbability( SkillA, DeviationA, SkillB, DeviationB)
                <br>
         Set count, a, b to 0.
                <br>
         Set fa = SkillA + f((a + .5)/100)*DeviationA
                <br>
         Set fb = SkillB + f((b + .5)/100)*DeviationB
                <br>
         While (a&lt;100)
                <br>
 &nbsp;&nbsp;        If fa&lt;fb:
                <br>
 &nbsp;&nbsp;&nbsp;&nbsp;         Add 100-b to count
                <br>
  &nbsp;&nbsp;&nbsp;&nbsp;        Increment a
                <br>
&nbsp;&nbsp;&nbsp;&nbsp; Set fa = SkillA + f((a + .5)/100)*DeviationA
                <br>
&nbsp;&nbsp;         If fa == fb:
                <br>
&nbsp;&nbsp;&nbsp;&nbsp;          Add 100-b-.5 to count
                <br>
&nbsp;&nbsp;&nbsp;&nbsp;          Increment a
                <br>
&nbsp;&nbsp;&nbsp;&nbsp;          Increment b
                <br>
&nbsp;&nbsp;&nbsp;&nbsp;         Set fa = SkillA + f((a + .5)/100)*DeviationA
                <br>
&nbsp;&nbsp;&nbsp;&nbsp;         Set fb = SkillB + f((b + .5)/100)*DeviationB
                <br>
&nbsp;&nbsp;         If fa&gt;fb:
                <br>
&nbsp;&nbsp;&nbsp;&nbsp;            Increment b
                <br>
&nbsp;&nbsp;&nbsp;&nbsp;            Set fb = SkillB + f((b + .5)/100)*DeviationB
                <br>
            Return count  (count is the win probability)
	                <p><br></p>
	                
                    </td>
                </tr>
            </table>
        </td>
        
        
        <td width="" bgcolor="#001934" valign="top">
            <jsp:include page="../includes/right_resources.jsp" />
        </td>
    </tr>
</table>

<jsp:include page="../includes/foot.jsp" />

</body>
</html>
