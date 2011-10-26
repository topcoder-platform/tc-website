<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Press Room</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="../script.jsp" />
<jsp:include page="../style.jsp">
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
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">


            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                    <jsp:include page="../page_title.jsp" >
                        <jsp:param name="image" value="press_room"/>
                        <jsp:param name="title" value="Article"/>
                    </jsp:include>

<div align="right"><tc-webtag:forumLink forumID="520558" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">Multicore boom needs new developer skills</span><br>
<span class="bodySubTitle"><em>Microsoft exec warns of "a worldwide shortage of people experienced in parallel computing experience."</em></span></p>
</div>
                        
<p>Chris Kanaracus<br />
PC World<br />
Friday, March 21, 2008; 11:19 AM</p>

<p>More than charity lies behind <a target="_blank" href="http://financial.washingtonpost.com/custom/wpost/html-qcn.asp?dispnav=business&amp;mwpage=qcn&amp;symb=MSFT&amp;nav=el">Microsoft</a> and Intel's announcement this week that they will donate US$20 million to a pair of U.S. colleges in the hope of spurring advances in parallel, or multicore, programming research, as a Microsoft research scientist readily acknowledged.</p>

<p>"There is a worldwide shortage of people experienced in parallel computing experience, for sure," said Dan Reed, director of scalable and multicore computing at Microsoft. "One of the collateral reasons is to raise awareness in the academic community, because that's where the next generation of developers will come from."</p>

<p>While for years, ever-higher clock speeds almost guaranteed that application code would run faster and faster, the rules are different for the multicore processors of today.</p>

<p>The difference has been compared to a sports car and a school bus. While the first is capable of blazing speed, the other moves more slowly but can move far more people at once.</p>

<p>The problem is, simply adding more cores to a computer's CPU doesn't increase the speed or power of conventional application code, as a recent Forrester Research report notes.</p>

<p>"To gain performance from quad-core processors and prepare for the denser multicore CPUs that will follow, application developers need to write code that can automatically fork multiple simultaneous threads of execution (multithreading) as well as manage thread assignments, synchronize parallel work, and manage shared data to prevent concurrency issues associated with multithreaded code," the authors wrote.</p>

<p>In other words, complex work is required to fill all those seats on the bus.</p>

<p>And the quad-core processors common today will soon give way to radically more advanced designs, Forrester notes. "Expect x86 servers with as many as 64 processor cores in 2009 and desktops with that many by 2012."</p>

<p>The situation has had chip makers and major software vendors making broad-based efforts to raise awareness of both the promise and challenges of programming for multiple cores.</p>

<p>TopCoder, a software development company that invites its membership to work on various aspects of a project through competitions, just began a series ofspecial contests,along with chipmaker AMD, that focuses on multithreading.</p>

<p>Mike Lydon, TopCoder's chief technology officer, said multicore programming remains the province of an elite few. "What we've seen from the skill set perspective is, it varies quite a bit," he said. "As you would expect, the high-end developers are familiar with threading. After that it drops off pretty quickly."</p>

<p>"It's surprising to me because multithreading programming isn't new," he added. Indeed, one instructionalarticleavailable on a Microsoft's MSDN Web site dates to 1993.</p>

<p>"I think it stems primarily from the collegiate level," Lydon said. "I've heard very little about colleges teaching multithreaded programming, but I would think and hope that it's changing very quickly."</p>

<p>However, Forrester's report suggests the urgency isn't being felt across the board. It notes that major operating systems and most middleware products are already prepared for multithreaded operation and for "near term" multicore processors, and that corporate development shops may look to ISVs (independent software vendors) to solve the problem through development tools and platforms that can better handle multicore-related tasks.</p>

<p>But Microsoft's Reed believes that multithreading over time will become "part of the skill set of every professional software developer."</p>

<p>In the meantime, most of the parallel computing resources available now don't necessarily hide the complexity of coding for multiple threads. "Development pros have options today, but most of them are low-level language extensions and libraries," Forrester said.</p>

<p>For example, in February AMD open-sourced more than 3,200 software routines under a project called Framewave, which it said will help coders build multithreaded applications for x86-type processors.</p>

<p>"Libraries can't provide a complete answer, but we see these as iterative steps," said Margaret Lewis, director of commercial solutions and software strategy at AMD. "There's things that you can do today as you're waiting for those [more advanced] tools that can increase the multi-threadedness of your applications," she said.</p>

<p>There are some higher-level products already on the market, such as the platform sold by RapidMind, which takes single-threaded C++ code and then, through an abstraction layer, "parallelizes" it across a number of cores.</p>

<p>However, it would be "fairly idealistic" to think that better tools alone will be enough, Lydon argued. "When you actually get into the points in code where you're going to leverage performance by spawning multiple threads, it takes a human mind to see where the benefits could take place."</p>

<p>&copy; 2008 PC World Communications, Inc. All rights reserved</p>
                        <p><br /><br /></p>
                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
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
