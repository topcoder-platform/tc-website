<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Mod Dash Competition Final Results" area="moddash" menu="finalResults"/>

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
                        <h2 class="pageTitle">Mod Dash Competition Final Results</h2>
                        <p>By: <b><span style="color: rgb(255, 153, 51);">Ghostar</span></b><br/>
                        In the Mod Dash Finals, competitors were given small changes to make to existing systems. There were 3 rounds with 6 changes in each round. For each change, competitors were given 10 minutes to complete the task and were scored on what order they submitted and whether or not the change they submitted met the requirements.</p>

<p>For the first round of the Mod Dash Finals, the competitors were given a local install of Cruise Control (cruisecontrol.sourceforge.net) and were asked to make small changes to it. They had all the necessary build tools to be able to make the changes and had some setup time before the rounds started to get their environment setup and get familiar with the development and build tools.</p>

<p><a class="blue" href="http://www.topcoder.com/tc?module=MemberProfile&cr=22651137">Margarita</a> jumped into the lead, winning two of the 6 bug races with successful submissions and left everyone behind her.</p>

<p>The tasks for Mod Dash Round 2 were much more HTML and Javascript focused. The competitors were given a Django site deployed and were asked to make changes to the site. Some were look and feel changes, which required more HTML, CSS, and Javascript, and others required Python knowledge, which should have been kind of an equalizer for competitors. The submission rate was overall much higher than in Round 1 indicating that the tasks were easier to complete in the 10 minutes allotted for each round.</p>

<p>The final Mod Dash round was focused on the same Django application from Round 2, but with harder problems to solve. A number of the problems also built on problems from Round 2. While they were harder items to address, the competitors had more experience with the application so they should have been more able to jump in and make the changes. That being said, the submission rate was lower today than Round 2, indicating that the problems were much harder to solve in the 10 minutes given for each one. Overall, this year’s mod dash finals showed how quickly members can absorb an application and make changes.</p>

<p>Here were the final scores. <a class="blue" href="http://www.topcoder.com/tc?module=MemberProfile&cr=22651137">Margarita</a> had 200 points after the first round, so everyone was just playing catch-up in rounds 2 and 3.
                        </p>
                        <p>Congratulations to all the winners!</p>

                        <%--<div style="float: left"><br /><img src="http://www.topcoder.com/i/m/argolite_big.jpg" alt="argolite" style="margin: 0 10px 3px 0" /></div>--%>
                        <p>1 <a class="blue" href="http://www.topcoder.com/tc?module=MemberProfile&cr=22651137">Margarita</a><br/>
                            2 <a class="green" href="http://www.topcoder.com/tc?module=MemberProfile&cr=22774655">supercharger</a><br/>
                            3 <a class="yellow" href="http://www.topcoder.com/tc?module=MemberProfile&cr=15604762">Yeung</a><br/>
                            4 <a class="blue" href="http://www.topcoder.com/tc?module=MemberProfile&cr=22650894">2PaVeL</a><br/>
                            5 <a class="blue" href="http://www.topcoder.com/tc?module=MemberProfile&cr=22692261">rac_</a><br/>
                            6 <a class="red" href="http://www.topcoder.com/tc?module=MemberProfile&cr=16096823">hohosky</a><br/>
                            7 <a class="yellow" href="http://www.topcoder.com/tc?module=MemberProfile&cr=22771277">HumbleSunflower</a><br/>
                            8 <a class="white" href="http://www.topcoder.com/tc?module=MemberProfile&cr=22724890">rst9288</a><br/>
                            9 <a class="blue" href="http://www.topcoder.com/tc?module=MemberProfile&cr=22746428">TeCNoYoTTa</a><br/>
                        </p>

                        <h2 class="pageTitle">Congratulations to Margarita, our 2010 TopCoder Open Mod Dash Competition
                            Champion!</h2><!-- page title -->
                        <div>
                        <div style="float: left;margin-right:10px;"><img src="/i/tournament/tco10/result/moddash.jpg" alt=""></div>
                        <h3 class="subTitle">Margarita<br/>
                            <em>Ukraine</em></h3>

                        <p>TopCoder sat down to interview the champion, Margarita so check it out!</p>

                        <p><span class="high">TC</span>: How did it feel to see your name on the scoreboard as the TCO10
                            Mod Dash Champion?<br/>
                            <b><span style="color: rgb(255, 153, 51);">Margarita</span></b>: I was feeling pretty happy,
                            as it was something I always wanted to achieve!</p>

                        <p><span class="high">TC</span>: What was your strategy for the competition?<br/>
                            <b><span style="color: rgb(255, 153, 51);">Margarita</span></b>: The first and most
                            important was to choose the right track My strategy for Mod Dash was to quickly introduce
                            myself with the application during setup time, namely - what is its purpose, what are main
                            pages/components, where sources are located and how to build it.

                            And then, when the task is revealed, I reproduce it (go to the requested page, click or look
                            at something) and try to quickly find the sources I need. The faster you find sources, the
                            more time remains for actual fix. So, it is important to keep digging into sources even if
                            you don't know how to fix, as knowledge about app the structure is valuable and can help in
                            next tasks.

                        <p><span class="high">TC</span>: You are the first female TCO champion. Tell us a little about
                            how you were inspired to compete and what advice can you give to other young girls just
                            starting out?<br/>
                            <b><span style="color: rgb(255, 153, 51);">Margarita</span></b>: I have been interested in
                            computers since I've got one when I was at school, and taking part in competitions from that
                            time too. I was inspired to participate because the TopCoder Open is a major, world famous
                            competition, because it is held in Vegas (nice place to visit!) and to see some friends, as
                            attending the same competition seems to be the easiest way to meet! The advice for girls in
                            Computer Science: the main thing is to realize that when you are interested in something,
                            don't worry if it doesn't fit the common pattern. Having uncommon interests is both
                            rewarding and challenging, and when you do what you like, it's not so hard to compete as it
                            seems!

                        <p><span class="high">TC</span>: What is it that attracted you to Mod Dash competitions?<br/>
                            <b><span style="color: rgb(255, 153, 51);">Margarita</span></b>: First, this track was new.
                            All the other tracks already have some sets of competitors who are likely to win, and there
                            was no such thing in Mod Dash. Next, I like the qualification process, because the time for
                            reviewing submissions is much less than in Design or Assembly tracks, and actual time to
                            solve the problem is less. And of course the onsite event for this competition is real fun!
                            Unlike other tracks, we had to solve not the same kind of tasks as during qualifications.
                            You can never know what will be on the finals! The funniest thing of this year's finals was
                            the Python project while I had no experience with Python before.

                        <p><span class="high">TC</span>: Who do you think was your toughest opponent during the TCO10
                            Mod Dash Competition?<br/>
                            <b><span style="color: rgb(255, 153, 51);">Margarita</span></b>: I thought hohosky to be
                            toughest opponent, as during the qualification round he was submitting quick and correct
                            solutions to complex bugs, and the lowest rating in his profile is yellow.

                        <p><span class="high">TC</span>: Now that you've won, are you going to keep on competing at
                            TopCoder? What is your next goal?<br/>
                            <b><span style="color: rgb(255, 153, 51);">Margarita</span></b>: Yeah, I'll keep on
                            competing at TopCoder. Now I am focused on studying and improving my skills.

                        <p><span class="high">TC</span>: Of course, last but not least, what will you do with your big
                            prize?!<br/>
                            <b><span style="color: rgb(255, 153, 51);">Margarita</span></b>: I'm not sure yet. Maybe I
                            will spend it on travelling, as this is something I really enjoy.</p>

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
