<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder - The Digital Run</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
<jsp:include page="../script.jsp" />
</head>
<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="digital_run"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<td width="100%" align="center" class="bodyColumn">

<div class="fixedWidthBody">
<div align="center" style="margin-bottom: 20px;">
<img src="/i/digital_run/digital_run_logo.png" alt="Digital Run" style="border-bottom: 1px solid #999999;"/>
</div>

<div align="center">
<table cellpadding="0" cellspacing="0" border="0" class="bodyText">
<tr>
<td align="left" style="padding-right:10px;border-right: 1px solid #999999;">
<span class="subtitle">Design Cup Series</span><br>
<A href="/tc?module=Static&d1=digital_run&d2=2006_des_overview">Details</A><br>
<A href="/tc?&ph=112&module=LeaderBoard">Current leaderboard</A><br>
<A href="/tc?module=RookieBoard&ph=112">Current ROTY leaderboard</A>
</td>
<td align="left" style="padding-left:10px;">
<span class="subtitle">Development Cup Series</span><br>
<A href="/tc?module=Static&d1=digital_run&d2=2006_dev_overview">Details</A><br>
<A href="/tc?&ph=113&module=LeaderBoard">Current leaderboard</A><br>
<A href="/tc?module=RookieBoard&ph=113">Current ROTY leaderboard</A>
</td>
</tr>
</table>
</div>
<br><br>
<span class="subtitle">Announcing the Digital Run: Stage 1 winners</span><br>
Stage 1 of the Digital Run concluded on August 3. While some contests are still being finalized, and a few potential points remain to be assigned, the two top winners have clearly emerged:
<ul>
<li>Design Cup: <tc-webtag:handle coderId="11797255" context="design" />  won Stage 1 with 7,060 points and total prizes of $29,664.</li>
<li>Development Cup:  <tc-webtag:handle coderId="15073791" context="development" />  won Stage 1 with 3,990 points and total prizes of $14,088.</li>
</ul>
<br>
<span class="subtitle">An Interview with aubergineanode</span><br>
The following is a brief interview with <tc-webtag:handle coderId="11797255" context="design" /> on his impressive Digital Run performance. Watch for the final rankings of the other Digital Run competitors to be revealed on the leaderboards soon &mdash; and if you haven't joined in yet, it's not too late to make your move for <A href="/dr">Rookie of the Year</A>.
<br><br>
<strong>Over Stage 1, how much time did you devote to the Digital Run?</strong><br>
It normally takes me a total of 20-30 hours on a component - from initial thoughts about a design through to answering development questions. With 24 components this summer, I'm guessing that I spent 600 hours, possibly more.
<br><br>
I didn't really have to change my lifestyle much for this. I only had one class that I needed to finish in order to graduate this summer, so I had the majority of my time free to do Digital Run stuff.  Basically it just served as my equivalent of work for the summer. If I had been doing the Digital Run while also being a full-time student or working full-time, then I think it would have required some major changes in order to do this many components.
<br><br>
<strong>How would you compare your effort in the Digital Run to other summer jobs you've had?</strong><br>
As far as the work is concerned, it's pretty similar to the stuff I've done in other summer jobs, albeit that as a designer I don't actually have to touch any code, which I've done quite a lot of in previous summer jobs. The great thing about TopCoder is you get to pick the components that you find the most interesting, as well as the hours that you work. The flexibility is great. There are some downsides though, like having to do all communication through the forums, and never really getting to see a fully finished application.
<br><br>
<strong>What advice would you have for a new TopCoder member who is considering the Digital Run?</strong><br>
The most important thing about components, especially design, is communication. All designing is about communicating your ideas to reviewers and developers. It doesn't matter how great the underlying design is if you can't effectively explain it to reviewers and developers. 
<br><br>
I feel that the best way to get started is to copy a winning submission. A component that has already been designed for another language (Java instead of .NET, or vice versa) is a great place to get started, since all you need to worry about is translating between the details of the languages, as well as fixing any areas that the initial design didn't receive a full score in. If you can't find such a component, then the best technique for a beginner is to copy the style (documentation, component spec organization, etc) of a recent winning submission.
<br><br>
<strong>You're going to work for Google soon -- how has the Digital Run, or TopCoder in general, prepared you for that?</strong><br>
The short answer is that I don't know yet. Give me another month and I'll probably have an idea.
<br><br>
<strong>Twenty-four submissions is pretty impressive. In hindsight, are there things you'd have done differently?</strong><br>
For me, the most important thing when picking a component is to choose one that I'm interested in. Already knowing the technologies involved is a plus, but I'm also willing to learn new ones. I think I did fairly well in choosing components that I was interested in this summer. If I had to do the first Digital Run quarter again, I'd choose the same components. Also, like Pops repeatedly says, jumping on the forums immediately and resolving any questions you have is essential to being successful as a designer.
<br><br>
As for the individual components, there are certainly some things I would have designed differently. I'm not going to list them all &mdash; it would be quite a long list. No design is perfect, and there are always things that you wish you had done differently.
 <br><br>
<strong>Between your Digital Run winnings and component winnings, you're going to bring in more than $50,000 from your work in Stage 1. What are you going to do with it?</strong><br>
I figure I'll start with a generous 'donation' to the IRS. Then I'll probably buy a car. I figure these two should take care of the majority of my winnings. I also bought a new desktop to replace the four-year-old laptop I've used throughout college (and which conveniently fried its motherboard last week). I have no idea what I'll do with the rest of my winnings.
<br><br>
<strong>All in all, how would you sum up your Digital Run experience?</strong><br>
It's been a lot of fun (and winning a lot of money certainly helps in that regard) &mdash; but I'm looking forward to having more free time in my life. I'm going to let other designers compete for the prizes in the second quarter.
<br><br>
</div>
</td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>