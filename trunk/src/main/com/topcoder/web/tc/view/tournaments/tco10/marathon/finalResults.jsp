<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Marathon Competition Final Results" area="marathon" menu="finalResults"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../includes/htmlhead.jsp"/>
    <style type="text/css">
        a.red{color:#E00 !important;font-weight:bold;text-decoration:none;}
        a.red:hover{color:#E00 !important;text-decoration:underline;}
        a.yellow{color:#DC0 !important;font-weight:bold;text-decoration:none;}
        a.yellow:hover{color:#DC0 !important;text-decoration:underline;}
        a.blue{color:#66F !important;font-weight:bold;text-decoration:none;}
        a.blue:hover{color:#66F !important;text-decoration:underline;}
        a.white{color:#fff !important;font-weight:bold;text-decoration:none;}
        a.white:hover{color:#fff !important;text-decoration:underline;}
        a.green{color:#00A900 !important;font-weight:bold;text-decoration:none;}
        a.green:hover{color:#00A900 !important;text-decoration:underline;}
    </style>
</head>

<body>

<div id="wrapper" class="homepage singlePage"><!-- the outest whole website wrapper -->

    <jsp:include page="../includes/logo.jsp"/>

    <div id="content">
        <div class="contentInner">

            <jsp:include page="../includes/menu.jsp"/>

            <div id="mainbody" class="singleMainBody"><!-- below menu ,main content -->
                <span class="leftTop"></span><!-- main content left top corner -->
                <span class="rightTop"></span><!-- main content right top corner -->
                <span class="leftBottom"></span><!-- main content left bottom corner -->
                <span class="rightBottom"></span><!-- main conent right bottom corner -->

                <jsp:include page="subMenu.jsp"/>

                <div class="bigColumn" style="margin-bottom:30px">
                    <div class="text">
                        <h2 class="pageTitle">Marathon Competition Final Results</h2>

                        <p>By: <b><span style="color: rgb(255, 153, 51);">Nickolas</span></b><br/>
                            2010 TopCoder Open Marathon Competition featured a variety of problems which required
                            untangling a graph on the plane, exploring cellular automaton, learning graph isomorphism
                            properties and finally finding your way out of a collapsing maze - meaning that any finalist
                            had to be really erudite, as well as tough enough to code through the 24-hours final round.
                            They turned out to be both, and put up an impressive struggle for the top position in the
                            final ranklist. The champion's title went to <a class="red" href="http://www.topcoder.com/tc?module=MemberProfile&cr=22689544">wata</a> who took part in both Algorithm and
                            Marathon finals - an impressive achievement on itself. The second place was taken by
                            <a class="red" href="http://www.topcoder.com/tc?module=MemberProfile&cr=22682274">chokudai</a> who took the lead on provisional tests, and <a class="red" href="http://www.topcoder.com/tc?module=MemberProfile&cr=9987185">doudouille</a> climbed to third place all
                            way from 8th provisional rank.
                            <br/>
                            1. <a class="red" href="http://www.topcoder.com/tc?module=MemberProfile&cr=22689544">wata</a><br/>
                            2. <a class="red" href="http://www.topcoder.com/tc?module=MemberProfile&cr=22682274">chokudai</a><br/>
                            3. <a class="red" href="http://www.topcoder.com/tc?module=MemberProfile&cr=9987185">doudouille</a><br/>
                            4. <a class="red" href="http://www.topcoder.com/tc?module=MemberProfile&cr=7462740">ploh</a><br/>
                            5. <a class="red" href="http://www.topcoder.com/tc?module=MemberProfile&cr=10597114">Psyho</a><br/>
                            6. <a class="red" href="http://www.topcoder.com/tc?module=MemberProfile&cr=11789293">nhzp339</a><br/>
                            7. <a class="red" href="http://www.topcoder.com/tc?module=MemberProfile&cr=22653720">ainu7</a><br/>
                            8. <a class="red" href="http://www.topcoder.com/tc?module=MemberProfile&cr=19849563">ACRush</a><br/>
                            9. <a class="yellow" href="http://www.topcoder.com/tc?module=MemberProfile&cr=22269126">irakli</a><br/>
                            10. <a class="red" href="http://www.topcoder.com/tc?module=MemberProfile&cr=7459326">jdmetz</a><br/>
                            11. <a class="yellow" href="http://www.topcoder.com/tc?module=MemberProfile&cr=274498">O_O</a><br/>
                            12. <a class="red" href="http://www.topcoder.com/tc?module=MemberProfile&cr=22689499">tpelkone</a><br/>
                        </p>

                        <h2 class="pageTitle">Congratulations to wata, our 2010 TopCoder Open Marathon Competition
                            Champion!</h2><!-- page title -->
                        <div>
                            <div style="float: left;margin-right:10px;"><img
                                    src="/i/tournament/tco10/result/marathon.jpg" alt=""></div>
                            <h3 class="subTitle">wata<br/>
                            <em>Japan</em></h3>

                            <p>
                                TopCoder got the chance to interview Marathon Champion, wata.

                            <p><span class="high">TC</span>: How did it feel to see your name on the scoreboard as the
                                TCO10 Marathon Champion?<br/>
                                <b><span style="color: rgb(255, 153, 51);">wata</span></b>: I was in second in the
                                preliminary scoreboard, so I was really surprised to become champion.</p>

                            <p><span class="high">TC</span>: How did you approach the problem at the same time you
                                fought the lack of sleep during the 24 hours?<br/>
                                <b><span style="color: rgb(255, 153, 51);">wata</span></b>: Around the dinner, I became
                                really tired and sleepy. I'm not so tough, so I laid down and rested my mind with
                                drinking much coffee.</p>

                            <p><span class="high">TC</span>: After the 24 hours were up, what is the first thing you
                                did?<br/>
                                <b><span style="color: rgb(255, 153, 51);">wata</span></b>: Because I had an Algorithm
                                semifinal, I returned to the hotel room and slept in a hurry.</p>

                            <p><span class="high">TC</span>: Who do you think was your toughest opponent during the
                                TCO10 Marathon Competition?<br/>
                                <b><span style="color: rgb(255, 153, 51);">wata</span></b>: It's chokudai. He is a
                                really tough guy. I heard that he did 24-hours coding for practice many times during the
                                summer vacation.</p>

                            <p><span class="high">TC</span>: Now that you've won, are you going to keep on competing at
                                TopCoder? What is your next goal?<br/>
                                <b><span style="color: rgb(255, 153, 51);">wata</span></b>: Of course, I'll keep on
                                competing.
                                This year, I became Marathon and Algorithm finalist, and Marathon champion, so my next
                                goal is to become dual champion!</p>

                            <p><span class="high">TC</span>: Of course, last but not least, what will you do with your
                                big prize?!<br/>
                                <b><span style="color: rgb(255, 153, 51);">wata</span></b>: I'll use it to improve my
                                English so that I can answer interviews smoothly next year</p>

                            <div class="clear"></div>
                        </div>


                    </div>
                </div>

                <jsp:include page="../includes/sponsors.jsp"/>

                <div class="clear"></div>
            </div>
            <!--End .mainbody-->

        </div>
        <!--End .contentInner-->
    </div>
    <!--End .content-->

    <jsp:include page="../includes/footer.jsp"/>

</div>
<!--End .wrapper-->

</body>
</html>
