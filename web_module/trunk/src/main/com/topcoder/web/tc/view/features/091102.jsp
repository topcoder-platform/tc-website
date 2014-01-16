<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
<script language="JavaScript">
function changeImage(image, newImage) {
document[image].src=newImage;
return;
}
function open_window(url) {
mywin =
window.open(url,"win",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=433,height=288');
}
</script>
</head>

<body>

<jsp:include page="/top.jsp" >
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
<TD class="bodyText" width="100%" valign="top">
<div style="margin: 0px 10px 0px 10px;">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="features"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>

<P><FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>...A Problem is Born</B></FONT><BR/>
<!-- <I>"If you take it slow you'll move up."</I><BR/><BR/> -->
Wednesday, September 11, 2002<BR/>
By&#160;KaiEl,<I>TopCoder Member</I><BR/>
</P>

<P>
	You probably haven't put much thought into the problem creation process before, have you? You probably just take it for granted that every week there will be new and well-written problems waiting for you in the TopCoder Arena, don't you? Well, someone has to write those problems before you can code them. Someone has to test the solutions to those problems before you can challenge them. These often-neglected members code feverishly just so that you can have the privilege of competing in TopCoder every week! I went into the administrator's lobby during one match to de-mystify the process of how a problem gets from the writer's imagination on to your screen.
</P>
	
<P>
<B>Starting off the Process</B>
</P>


<P>
	The problem creation process starts every month when TopCoder's head problem writer, <B>lars2520</B>, sends out an e-mail to TopCoder's 100-plus registered member-writers. "There are a lot of people who have written at some point, but only about 10 or so respond in any given month," <B>lars2520</B> says of the demand for the writing duties in each match, for which the writer gets paid $500. "Becoming [a writer] is just a matter of asking to be one, for the most part.  We'll generally let people write if they've been around for a while."
</P>
	
<P>
	Once selected, a writer doesn't submit a completed problem all at once. First, a rough draft is put into TopCoder's writing and testing system, the Member Problem Submission Quality Assurance System (MPSQAS). At this point, the writer has to give "just the basic idea," according to <B>lars2520</B>. "Enough that I know what's going on, and can see what the solution will be." 
</P>
	
<P>
	"You usually write up the problem sans details/test cases," adds <B><B>brett1479</B></B>, the problem writer for SRM109. Each idea is checked against the hundreds of problems in the TopCoder database by <B>lars2520</B>, to make sure no two problems are ever alike. "Writers try not to repeat problems already done, and then Lars hits us if we do," <B>brett1479</B> jokes. 
</P>
	
<P>
	Some may think that writing the problem statement is secondary to coding an elegant solution, but for problem writers this is often not the case. "The statement is really the core," <B>brett1479</B> says of the most important part of problem writing. "A good statement can take an impossible 'nobody gets it' problem, and make it doable. Coding is usually the easiest part."
</P>


<P>
<B>Inspiration</B>
</P>

<P>
	So where do those myriad problem statements come from? It can vary from match to match. "Sometimes I try to give a problem that is a good learning experience," says <B>brett1479</B>. "Something that'll introduce the coders to a particular algorithm. Other times, I just get a problem that sounds so good, and try to see what the algorithm is."
</P>
	
<P>
	<B>lars2520</B> says he sometimes gets ideas from classes at school. "We would be doing something, and I would think, such and such, which was vaguely related, would make a good problem," he recalls.
</P>
	
<P>
	Sometimes, however, the most inspired problem ideas are the hardest to actually use. "The only problem I have with the truly inspirational, 'aha that's a great problem,' problem is that I usually don't get anyone solving them," <B>brett1479</B> says. "I have definitely come up with ones that I determined were algorithmically impossible given the constraints." 
</P>

<P>
<B>lars2520</B> agrees: "Often the most interesting things are too hard for a competition. It happens a lot actually. It's always sort of tricky to make the problems hard enough that they are interesting, but easy enough that people can get them in 75 minutes."
</P>


<P>
<B>Coding, Testing, Coding Again, Testing Again...</B>
</P>


<P>
	Once the basic idea for a problem is approved, it's time to write up the first of many solutions that will make sure the problem is perfect before the match. An average solution can take anywhere from two to ten hours to write, depending on the problem and who's coding it. "The writer/tester solutions have to be written extremely cleanly, since all the code is combed through," says <B>brett1479</B>.  "So there is a balance between 'Code it as fast as possible' and 'Make it so clean.'"
</P>

<P>
"Usually all the problems end up with at least 3 solutions," <B>lars2520</B> says, only one of which is from the person who wrote the problem. The others come from a group of testers who are paid to look over the problems before they get to the Coding Arena. "There is an elaborate writing/testing harness in place," <B>brett1479</B> said of the MPSQAS system. "The functionality is quite nice."
</P>

<P>
	<B>lars2520</B> describes the testing process: "All of the system test cases are run against all solutions. Differences mean someone's wrong, and they have to fix their solution." This process often uses randomly generated test cases, and is pretty good at finding all the errors in the solutions, according to <B>lars2520</B>.
</P>

<P>
	But even one little error can cause problems, as <B>brett1479</B> found out in SRM109. In that match, a "versioning error" forced TopCoder to re-run system tests and challenges for the Division I Hard problem, delaying results and causing headaches for many members. "It was the right solution on my machine, but the wrong version on MPSQAS," <B>brett1479</B> says of the error. "If fate decided that I need to have a blemish, this is a good one to have." dok, a TopCoder administrator, said that a problem like this hasn't happened "in quite a while."
</P>


<P>
<B>Being a Writer</B>
</P>


<P>
	As the above example shows, a writer's job does not end when the match starts. The writer for each challenge has to stay in the administrative lobby during his or her match to help address questions and concerns from other TopCoder members.  These usually amount to outright requests for help on the tougher problems, which TopCoder writers and administrators can't give. In SRM109, <B>brett1479</B> had to deny these requests of about half-a-dozen participants with responses such as, "We can't give out too much help," or "You have to reread the problem, I'm sorry."
</P>
	
<P>
	Despite these annoyances, <B>brett1479</B> says that writing for TopCoder is a "pretty nice job. You interact with smart, nice people, you learn a lot, and you get paid, all from home." The best part for <B>brett1479</B>, though, comes after the match is over, "and you realize that your problem set was just used by 300+ users, and they all put an hour and a half into it, and they got something out of it, and that is something nice."
</P>



<IMG SRC="/i/m/KaiEl_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;KaiEl<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=264761" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
      
<P><A HREF="mailto:editorial@topcoder.com" CLASS="bodyGeneric">Would you like to write a feature?</A></P>



   <br><br>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="/foot.jsp" />

</body>

</html>
