<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder</title>
    <link type="text/css" rel="stylesheet" href="/css/oracle/main.css">
    <link type="text/css" rel="stylesheet" href="/css/oracle/stats.css">
</head>

<body>

<div align="center">
    <div id="contentOut">
        <div id="contentIn">

            <div style="margin-bottom: 20px;">
                <A href="/"><img src="/i/oracle/layout/topcoder.png" alt="TopCoder" /></A>
            </div>
    
            <jsp:include page="nav.jsp" >
            <jsp:param name="selectedTab" value="introduction"/>
            <jsp:param name="tabLev2" value=""/>
            <jsp:param name="tabLev3" value=""/>
            </jsp:include>

            <div id="bodyColumn">

<%--
                <p align="center">
                <span class="bigRed"><A href="?module=ViewBallot&rm=1999" class="bigRed">Make your prediction now</A> for the Homepage Redesign Round 2!<br>
                You have until 2PM on Monday.</span>
                </p>
--%>
                <p>
                After the introduction of TopCoder Studio, TopCoder was faced with the challenge of effectively choosing contest winners.  We felt that we needed a mechanism that was efficient and didn't require a lot of additional TopCoder staff time or resources.  We also felt that with the nature of Studio competitions being subjective, no one individual or even set of individuals would necessarily be the best at judging submissions.  The mechanism would need to be effective in that it would need to be able to determine a winner well (well being a fairly subjective term that could mean anything from how much the community or client likes a submission to measurements such as traffic and so on).   Finally, it should be transparent so that there wouldn't be questions of impropriety.
                </p>
                <p>
                This system is the result of our efforts to meet those needs.  In essence, we are attempting to harness the <A target="_blank" href="<tc-webtag:linkTracking link='http://www.randomhouse.com/features/wisdomofcrowds/Q&A.html' refer='oracle intro' />">"wisdom of the crowd"</A>.
                </p>
                <p>
                The basic idea behind the wisdom of the crowd is that one can rely on the aggregation of the opinions of a large set of individuals to provide the answer to a given question.  In the case of TopCoder Studio, the question is "Which submission is the best?".  Best meaning most well suited for a particular need.
                </p>
                <p>
                A simple vote is probably the most obvious way to answer that question within the framework of a crowd.  However, votes aren't necessarily pragmatic.  One issue that we have run into is narrowing a large set of submissions down to a relative few.  To date, we have been using a rather traditional approach to this problem:  We take a large set of submissions, utilize a small number of people to choose a number that we like for one reason or another and then have the community vote.   As mentioned above we would like to try a different approach that we hope will produce a better outcome.  In true TopCoder fashion, we have decided to implement a new type of contest.  In this contest, competitors will be asked to guess what other competitors will chose as their favorite submission.  Doing this as a contest allows us to use relatively large groups of people to review relatively small sets of submissions.  Each competitor will be trying to predict what a subsequent large group will choose.  We hope that this contest will be both fun for the competitors and effective at determining the results of a Studio contest.  Competitors who can best predict the crowd's decision will be rewarded with prizes.
                </p>
                <p>
                We chose to organize this in the format of a competition because it is the core value on which TopCoder is based.  We feel that competition combined with the wisdom of crowds may be able to produce significantly better results than a few "experts" can.  We added prizes to attract competitors because we think that a larger crowd is a wiser crowd.   Please bear in mind that this is still experimental for us and it is likely that we will modify this approach over time.  We hope you will help us with vetting this new approach by giving us as much feedback as possible.
                </p>
                <p>
                Because of the experimental nature of this system, we will be using it for quite a few Studio contests, BUT THE OUTCOME MAY NOT BE BINDING ON THE ACTUAL STUDIO CONTEST BEING EVALUATED.  Of course the outcome of the judging competition from a prize standpoint will be.  We will have to judge the outcome for some time to gain comfort with the system.
                </p>
        
            </div>

        <div style="clear:both;">&nbsp;</div>
        <jsp:include page="foot.jsp"/>
        </div>
    </div>
</div>

</body>
</html>