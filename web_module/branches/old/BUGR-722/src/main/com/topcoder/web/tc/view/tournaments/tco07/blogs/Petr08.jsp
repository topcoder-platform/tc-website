<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="content">

        <jsp:include page="../header.jsp" />

        <table cellpadding="0" cellspacing="0" id="spacer">
        <tbody>
            <tr>
                <td id="navSpacer">

                    <jsp:include page="../nav.jsp" >
                    <jsp:param name="tabLev1" value="overview"/>
                    <jsp:param name="tabLev2" value="onsiteevents"/>
                    <jsp:param name="tabLev3" value="blogs"/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">
                        <h1><span>Algorithm Wildcard Round - 06.28.07 9:00 PM EDT</span></h1>
                    
                        <div style="float:right;">
                            <tc-webtag:forumLink forumID="516303" message="Discuss" />
                        </div>

                        <img src="/i/m/Petr_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                        By&#160;<tc-webtag:handle coderId="10574855" context="algorithm"/><br />
                        <span class="smallText"><em>TopCoder Member</em></span>
                        <br clear="all" />
                        
                        <br>
                    
                        <p>3:49 - ten minutes before the start of the wildcard round. As usual for the wildcard, the competition is even tougher than that of the semifinals. Good luck to all contestants!</p>

                        <p>3:55 - as always, <tc-webtag:handle coderId="11829284" context="algorithm"/>
                         will be helping me today.</p>
                        
                        <p>3:56 - in fact, the wildcard is probably the most intense competition here. When people lose in the semifinals, some of them get a second chance. When people get to the finals, they are really competing at the best level they can, and nervousness steps away. But in the wildcard, people get more nervous than ever, as many of them feel they 'should' get to the finals.</p>
                        
                        <p>4:01 - the competition has started. 11 competitors read the easy, <tc-webtag:handle coderId="144400" context="algorithm"/> reads the hard.</p>
                        
                        <p>4:08 - the easy problem is finding the inverse of a power series, which is achieved by applying simple formulas, and the only difficulty is that the answer is expected to be presented precisely with fractions. <tc-webtag:handle coderId="7446789" context="algorithm"/> has already submitted it.</p>
                        
                        <p>4:11 - another concern here might be intermediate values not fitting long long bounds, but that seems to be impossible given the answer's numerator and denominator are bounded by 100000 and all the denominators are obtained from the powers of start[0] (and thus the common denominator will not be too big).</p>
                        
                        <p>4:14 - <tc-webtag:handle coderId="7442498" context="algorithm"/>, <tc-webtag:handle coderId="7390224" context="algorithm"/> and <tc-webtag:handle coderId="272072" context="algorithm"/> have submitted the easy, too. All the four submissions look similar.</p>
                        
                        <p>4:16 - in fact, I don't see an easy formal proof of the intermediate numbers not overflowing long long. Just a feeling.</p>
                        
                        <p>4:16 - <tc-webtag:handle coderId="311170" context="algorithm"/> submits.</p>
                        
                        <p>4:19 - and resubmits.</p>
                        
                        <p>4:19 - the medium turns out to be an implementation problem. Let's see if I can find some easy way to do it.</p>
                        
                        <p>4:20 - <tc-webtag:handle coderId="10157606" context="algorithm"/>, <tc-webtag:handle coderId="293874" context="algorithm"/> and <tc-webtag:handle coderId="7462740" context="algorithm"/> submit the easy.</p>
                        
                        <p>4:22 - I don't see anything easier than keeping track of the current 'picture' by having a set of 
                        'important' coordinates where the thickness changes. That requires a bit of accuracy and involves some corner cases, but is not too difficult after all.</p>
                        
                        <p>4:24 - <tc-webtag:handle coderId="7433858" context="algorithm"/> and <tc-webtag:handle coderId="7390467" context="algorithm"/> have also submitted the easy.</p>
                        
                        <p>4:26 - <tc-webtag:handle coderId="272072" context="algorithm"/> has compiled some clever solution for the 550. He has noted that one can actually solve two one-dimension cases (for the horizontal folds and for the vertical ones) and multiply the results. That makes the solution quite easy to implement.</p>
                        
                        <p>4:30 - <tc-webtag:handle coderId="9927526" context="algorithm"/> submits the easy, Snap is in with the medium.</p>
                        
                        <p>4:35 - <tc-webtag:handle coderId="144400" context="algorithm"/> is the only one with zero points now.</p>
                        
                        <p>4:35 - <tc-webtag:handle coderId="11829284" context="algorithm"/>
                         suggested a solution for the hard problem. The last paragraph from the problem statement implies that every query contains a number from some of the recent adds (like the last 10), and thus we can do the following DP: what is the minimal possible cost of remaining operations,
                        if the first k add operations were performed in such a way that the skiplist has x elements, and the subset A of the last 10 adds were added to the skiplist. The state space is n^2*2^10, and n can be as much as about 600, so this won't probably be enough. However, as Per suggested, we really don't need to keep the size of the skiplist, because the answer depends on that number linearly (i.e., is C+a*x for some constants C and a): every time we put a number in the cache, all the remaining costs increase by one.</p>
                        
                        <p>4:46 - no submission recently.</p>
                        
                        <p>4:50 - the medium from <tc-webtag:handle coderId="9927526" context="algorithm"/>, and the hard from <tc-webtag:handle coderId="144400" context="algorithm"/>. Strangely enough, he opens the easy then.</p>
                        
                        <p>4:53 - <tc-webtag:handle coderId="144400" context="algorithm"/>'s solution is pretty much like what we've invented here.</p>
                        
                        <p>4:58 - <tc-webtag:handle coderId="7390224" context="algorithm"/>, <tc-webtag:handle coderId="7462740" context="algorithm"/> and <tc-webtag:handle coderId="7390467" context="algorithm"/> submit the medium. <tc-webtag:handle coderId="7390224" context="algorithm"/> and <tc-webtag:handle coderId="9927526" context="algorithm"/> are not compressing the coordinates - so they could probably time out, because the processing can get as long as about 800*100000 iterations. Some borderline situation here. <tc-webtag:handle coderId="272072" context="algorithm"/>, <tc-webtag:handle coderId="7462740" context="algorithm"/> and <tc-webtag:handle coderId="7390467" context="algorithm"/> do compress the coordinates.</p>
                        
                        <p>5:02 - it seems that the situation will change soon as we see more submissions on 950.</p>
                        
                        <p>5:02 - and <tc-webtag:handle coderId="293874" context="algorithm"/> does that change. <tc-webtag:handle coderId="144400" context="algorithm"/> has submitted the easy, too.</p>
                        
                        <p>5:04 - <tc-webtag:handle coderId="293874" context="algorithm"/>'s code seems to decide whether to keep an item in the skiplist with some sort of greedy procedure. I believe it should be wrong.</p>
                        
                        <p>5:07 - <tc-webtag:handle coderId="10157606" context="algorithm"/> has submitted the 950, too. His DP dimensions look right :)</p>
                        
                        <p>5:11 - 15 minutes to go. Will <tc-webtag:handle coderId="144400" context="algorithm"/> submit the medium? Will <tc-webtag:handle coderId="272072" context="algorithm"/> submit the hard?</p>
                        
                        <p>5:13 - <tc-webtag:handle coderId="7442498" context="algorithm"/> submits the medium. However, he will need several challenges to get back in play.</p>
                        
                        <p>5:16 - <tc-webtag:handle coderId="144400" context="algorithm"/> compiles the medium, without compressing the coordinates, too. <tc-webtag:handle coderId="272072" context="algorithm"/> submits the hard, although his solution seems to be wrong in the same way as <tc-webtag:handle coderId="293874" context="algorithm"/>'s.</p>
                        
                        <p>5:18 - in fact, <tc-webtag:handle coderId="272072" context="algorithm"/> does some backtracking when his greedy routines don't work in some sense. A really complicated solution here.</p>
                        
                        <p>5:19 - <tc-webtag:handle coderId="144400" context="algorithm"/> submits the medium.</p>
                        
                        <p>5:21 - <tc-webtag:handle coderId="270505" context="algorithm"/> has arrived. He'll be doing the webcast tomorrow.</p>
                        
                        <p>5:21 - currently we have only 4 people not submitting the medium - <tc-webtag:handle coderId="293874" context="algorithm"/> and <tc-webtag:handle coderId="10157606" context="algorithm"/> got the hard instead, and <tc-webtag:handle coderId="7433858" context="algorithm"/> and <tc-webtag:handle coderId="311170" context="algorithm"/> still didn't advance further than the easy.</p>
                        
                        <p>5:23 - <tc-webtag:handle coderId="272072" context="algorithm"/> is using the Arena to generate some tough testcases.</p>
                        
                        <p>5:25 - no last-second submissions this time, the coding is over.</p>
                        
                        <p>5:25 - currently the top two are far ahead, however should any of them fail the cost of a single challenge might be immensely big.</p>
                        
                        <p>5:30 - the challenge is underway, <tc-webtag:handle coderId="7390467" context="algorithm"/>'s medium has died.</p>
                        
                        <p>5:30 - as are <tc-webtag:handle coderId="7390224" context="algorithm"/>'s and <tc-webtag:handle coderId="7442498" context="algorithm"/>'s. Is that TL?</p>
                        
                        <p>5:31 - <tc-webtag:handle coderId="7446789" context="algorithm"/> is at +100, <tc-webtag:handle coderId="9927526" context="algorithm"/> at +50. Still no action at the top.</p>
                        
                        <p>5:32 - <tc-webtag:handle coderId="9927526" context="algorithm"/> loses his medium, too. Meanwhile, <tc-webtag:handle coderId="144400" context="algorithm"/> gets -25.</p>
                        
                        <p>5:33 - another fine shot by <tc-webtag:handle coderId="7446789" context="algorithm"/>, it's <tc-webtag:handle coderId="7462740" context="algorithm"/> now.</p>
                        
                        <p>5:33 - <tc-webtag:handle coderId="272072" context="algorithm"/>'s medium is down! Even if <tc-webtag:handle coderId="144400" context="algorithm"/> is safe, the fight for the second spot is wide open.</p>
                        
                        <p>5:39 - little action recently. Another -25 for <tc-webtag:handle coderId="144400" context="algorithm"/>.</p>
                        
                        <p>5:39 - <tc-webtag:handle coderId="272072" context="algorithm"/> has left his workstation. He left a note saying his hard will fail.</p>
                        
                        <p>5:42 - the challenge is over, waiting for the systests.</p>
                        
                        <p>5:44 - it's <tc-webtag:handle coderId="7446789" context="algorithm"/> and <tc-webtag:handle coderId="144400" context="algorithm"/> in the finals, in that order.</p>
                        
                        <p>5:44 - the problems surviving systests are: <tc-webtag:handle coderId="144400" context="algorithm"/>'s and <tc-webtag:handle coderId="7446789" context="algorithm"/>'s mediums, and all the easys except <tc-webtag:handle coderId="144400" context="algorithm"/>'s <tc-webtag:handle coderId="10157606" context="algorithm"/>'s and <tc-webtag:handle coderId="9927526" context="algorithm"/>'s.</p>
                        
                        <p>5:46 - we're leaving now. The coverage of the finals tomorrow will be <a href="http://petr.mitrichev.ru/r5.html" target="_blank">petr.mitrichev.ru/r5.html</a> at 1:30 PM PDT!</p>

                        <br /><br />
                        
                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="../footer.jsp" />
    </div>
</div>

</body>

</html>