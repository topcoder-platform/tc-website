<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Algorithm Competition Final Results" area="algorithm" menu="finalResults"/>

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

                <div class="bigColumn">
                    <div class="text">
                        <h2 class="pageTitle">Algorithm Competition Final Results</h2>

                        <p>By: <b><span style="color: rgb(255, 153, 51);">Nickolas</span></b><br/>
                            The on-line and on-site rounds of 2010 TopCoder Open Algorithm Competition featured a tough
                            competition, with relatively hard problems and plenty of loud names being knocked out of the
                            game early in the on-line rounds. However, the final round was a perfect show to end this
                            spectacular competition: <a class="red" href="http://www.topcoder.com/tc?module=MemberProfile&cr=19849563">ACRush</a> taking the lead in Coding phase and strengthening it after
                            Challenge, but failing one problem to System Testing and thus giving the Champion's title to
                            <a class="red" href="http://www.topcoder.com/tc?module=MemberProfile&cr=22692969">rng_58</a> who had all three problems correct. ACRush took second place and the crown of
                            vice-champion, and <a class="red" href="http://www.topcoder.com/tc?module=MemberProfile&cr=7428266">Klinck</a> won third place.</p>

						<p>Final Round Results:</p>

                        <p>
                            1. <a class="red" href="http://www.topcoder.com/tc?module=MemberProfile&cr=22692969">rng_58</a><br/>
                            2. <a class="red" href="http://www.topcoder.com/tc?module=MemberProfile&cr=19849563">ACRush</a><br/>
                            3. <a class="red" href="http://www.topcoder.com/tc?module=MemberProfile&cr=7428266">Klinck</a><br/>
                            4. <a class="red" href="http://www.topcoder.com/tc?module=MemberProfile&cr=7394165">PaulJefferys</a><br/>
                            5. <a class="red" href="http://www.topcoder.com/tc?module=MemberProfile&cr=251074">bmerry</a><br/>
                            6. <a class="red" href="http://www.topcoder.com/tc?module=MemberProfile&cr=22074135">dzhulgakov</a><br/>
                            7. <a class="red" href="http://www.topcoder.com/tc?module=MemberProfile&cr=22696552">Louty</a><br/>
                            8. <a class="red" href="http://www.topcoder.com/tc?module=MemberProfile&cr=7433858">liympanda</a><br/>
                        </p>

                        <h2 class="pageTitle">Congratulations to rng_58, our 2010 TopCoder Open Algorithm Competition
                            Champion!</h2><!-- page title -->
                        <div>
                            <div style="float: left;margin-right:10px;"><img
                                    src="/i/tournament/tco10/result/algorithm.jpg" alt=""></div>

                            <h3 class="subTitle">rng_58<br/>
                            <em>Japan</em></h3>

                            <p>TopCoder sat down with rng_58 to ask him some questions about being the new Algorithm
                                Champion.</p>

                            <p><span class="high">TC</span>: How did it feel to see your name on the scoreboard as the
                                TCO10 Algorithm Champion?<br/>
                                <b><span style="color: rgb(255, 153, 51);">rng_58</span></b>: I was very surprised.
                                After the challenge phase, I was 2nd on the scoreboard. When I read the top scorer's
                                solutions for the three problems, all of them seemed to be correct. I wasn't confident
                                about my solutions. So I hoped to keep 2nd place when the results are announced. I
                                replied "I was happy" to the same question after the ceremony. Japanese media invented
                                funny translation of it. Let's see how they translate this time</p>

                            <p><span class="high">TC</span>: What was the hardest problem you faced during the final
                                round?<br/>
                                <b><span style="color: rgb(255, 153, 51);">rng_58</span></b>: Hard (a problem about
                                jewels). When I opened it, it seemed approachable and I felt that I must solve it to
                                win. Fortunately I got the idea relatively quickly, but I was struggling with bugs.
                                Quoted from TCO official blog: "rng_58 has a bug in counting the number of Rs, Gs and
                                Bs: x and y swapped in one place." I had one more bug.</p>

                            <p><span class="high">TC</span>: What were you thinking about during the intermission? Were
                                you confident, nervous, or excited for the challenge round?<br/>
                                <b><span style="color: rgb(255, 153, 51);">rng_58</span></b>: I was a little nervous
                                because I dropped to 2nd place a few minutes before the intermission. But the difference
                                was only < 25 points, so I was prepared for the challenge phase, especially for Easy (a
                                problem about election). I was confused during the challenge phase because my Easy
                                solution was completely different from others'.</p>

                            <p><span class="high">TC</span>: Who do you think was your toughest opponent during the
                                TCO10 Algorithm Competition?<br/>
                                <b><span style="color: rgb(255, 153, 51);">rng_58</span></b>: ACRush. He won semifinal
                                room 2 (he was sleepy during the semifinal!) and got 2nd in the final. I beat him only
                                once in online rounds (there were 5 online rounds). I thought Petr would also be a tough
                                opponent, but I didn't have a chance to compete with him in the onsite rounds.</p>

                            <p><span class="high">TC</span>: Now that you've won, are you going to keep on competing at
                                TopCoder? What is your next goal?<br/>
                                <b><span style="color: rgb(255, 153, 51);">rng_58</span></b>: Of course I will keep on
                                competing at TopCoder. It's really interesting. I think TopCoder problems have by far
                                the best quality among all programming competitions. The next goal is difficult. I'm
                                satisfied with the result of this TCO and current rating - so the next goal is going to
                                Las Vegas next year.</p>

                            <p><span class="high">TC</span>: Of course, last but not least, what will you do with your
                                big prize?!<br/>
                                <b><span style="color: rgb(255, 153, 51);">rng_58</span></b>: I haven't decided yet.
                                Instead I'll write about the amount of my prize. I received money and a trophy. The
                                trophy was broken and TopCoder admins said they will send another trophy. I will receive
                                three trophies</p>

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
