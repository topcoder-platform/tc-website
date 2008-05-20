<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="features"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="features"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>

<span class="bigTitle">So I see you're a member of TopCoder&#8230;</span><br>

      <p>
      <img src="/i/m/timmac_mug.gif" alt="" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
      By&#160;<tc-webtag:handle coderId="10407399" /><br>
      <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
      </p>

&#8230;Tell me about that.
<br><br>
If your resume includes some mention of TopCoder, then you might have heard this during a job interview.  Although the member base represents a very enthusiastic and ever increasing group of people, the TopCoder community is still a bit of a subculture.  While the name alone is an obvious indication of what the community does, there are probably even more questions it raises.
<br><br>
I once had a job interview unlike any other.  After the formalities of "Hi, my name is John, and I'm the IT manager of Acme Widgets," the very next statement was, "Now, I've looked over your resume, and want to let you know that as a rule, I typically will not hire someone who hasn't gotten their college degree.  But, I did see written here that you're a member of TopCoder, and have been a Google Code Jam finalist.  Can you tell me about that?"  I knew, beyond any doubt, that this interview would go well, but in all of my job hunting preparation, I had never once thought about how to answer such a question.
<br><br>
So what does it mean to be a TopCoder?  More than likely, you know how to code &mdash; very well.  Even more importantly, you enjoy coding, and you love solving problems.  You would do it all for fun, even if there were no paycheck involved.  (If I had the free time, I would probably do that too, but lately I am too busy trying to solve the latest Marathon problem.  Err&#8230;wait.)
<br><br>
But let's get back to our day job for a moment.  What unique qualities does a TopCoder bring to the table?  The love of coding indicates an important set of intangible values: self-motivation, a desire to learn new skills, an ability to solve challenging problems, or maybe the ability to share some of these talents with coworkers.
<br><br>
In the business world, the variety of "challenging projects" can start to feel &mdash; over a long enough timeline &mdash; pretty much all the same.  My own observation has been that most applications involve a lot of editing, processing, transporting, and reporting on various sets of data.  While this might seem like a pessimistic oversimplification, there is some degree of truth to it.  For the TopCoder who craves the challenge of solving new and exciting problems, some creative effort may be required to make the job more interesting.
<br><br>
Of course, some perspective is also required.  Not all elements of the TopCoder mentality translate well into the workplace.  For instance, it might be tempting to "simplify" a code segment by rewriting it to be more concise, but this could backfire when someone else has to modify the code several years from now.
<br><br>
Two feature articles from days gone by, <A href="/tc?module=Static&d1=features&d2=040803">TopCoder Competitions vs. The Real World</A>, and <A href="/tc?module=Static&d1=features&d2=042904">All I really need to know about Software Development I learned from TopCoder</A>, are enjoyable to read and make some interesting observations.  My own experiences have also helped, allowing me to find a place within my organization, where I can both exercise my love of coding and be a valuable asset to my team. Some of the lessons I've learned are:
<ul>
<li><strong>Always be willing to teach others, but never force it upon them.</strong>  Your team should benefit from what you know, but there's no reason to show off. There can be a fine line between being seen as intelligent and competent versus being seen as egotistical and a detriment to others.</li>
<li><strong>Let your enjoyment for coding be the source of a positive attitude.</strong>  With so many people feeling jaded, unsatisfied, and generally stressed out, a smiling face is a welcome addition to any team.</li>
<li><strong>Be ready to make suggestions when appropriate.</strong>  Don't think of yourself as a "coder for hire," who just does what they are told &mdash; you've got a stake in the overall success of the project. If you can help, speak up &mdash; especially if a manager confronts you or your team with an issue.  Seize the opportunity to do some creative problem solving.</li>
</ul>
One more observation I can offer is that, often times, the challenging tasks that are the lifeblood of TopCoder competition are the same tasks that cause premature hair loss among many of my coworkers.  Rather than serving to differentiate team members, though, these difficult moments can bring teams together and give coworkers the opportunity to contribute based on their own individual strengths .
<br><br>
A great example of this took place at a previous job I held.  I was working with another developer on a reporting project, for an e-commerce client.  Of particular interest were sales reports that compiled information about promotional discounts, products exchanges, etc.  One day we get a call from the client, concerned that the reported data appeared out of sync with their expectations.  I was tasked with "fixing" the issue.  Before I could even begin explaining my intended course of action, my coworker cut me off, explaining, "Right now, I just need you to dig into the code and get it fixed as fast as you can.  You can tell me about it later."
<br><br>
No problem.  While I waded through complicated sets of queries, he talked with project managers about quirks in the sales process, and how certain types of discontinuities were inevitable.  And, the end result?  The customer and project manager were satisfied to understand the issue, and the report was adjusted to be in line with the expectations.  In the meantime, I got to code (which I love) without the distraction of trying to explain things to the customer (which I don't like). I was satisfied to get it fixed.  My coworker avoided having to do the tedious coding, and was thrilled to report back when it was completed.  Everyone was happy.
<br><br>
So, what does it mean that I am a TopCoder?  It means I fulfill a very unique role on the team, and I love every minute of it.
<br><br>




        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="defaults"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
