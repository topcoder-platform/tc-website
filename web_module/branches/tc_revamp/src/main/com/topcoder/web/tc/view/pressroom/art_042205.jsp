<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Press Room</title>

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
                        <div align="center">
                        <p><span class="bodyTitle">How Google Searches - For Talent</span><br/>
                        <span class="bodySubTitle"><em>At the India Code Jam, only the hottest software writers need apply</em></span><br />
                        <span class="bodySubTitle"><em>By Josey Puliyenthruruthel in Bangalore<br />BusinessWeek</em></span></p>
                        </div>

<p>
Mar. 26 HERALDS the opening of the spring season in India, a day celebrated with riotous color and revelry. But in one corner of Bangalore, India's info tech hub, the sunny Saturday is heavy with tension. At an Internet cafe, a group of engineers and math majors, all in their 20s, hunch over terminals, ready to write some killer code - and, with luck, launch careers with one of the world's premier tech companies, Google Inc.
<br /><br />
It's the Google India Code Jam, a contest to find the most brilliant coder in South and Southeast Asia. The fastest will win $6,900 - and more important, the offer of a coveted job at one of Google's research and development centers. At the stroke of 10:30 a.m., the contestants begin, emerging exhausted three hours later. "It's been incredibly difficult and awesome," says Nitin Gupta, a computer science undergrad at the Indian Institute of Technology at Bombay.
<br /><br />
Google has staged Code Jams in the U.S., but this is its first such bakeoff in Asia, and the response is huge. Some 14,000 aspirants registered from all over South and Southeast Asia for the first round in February. The top 50 were selected for the finals in Bangalore: 39 from India, 8 from Singapore, and 3 from Indonesia. "It's a dog-eat-dog world," says Robert Hughes, president of TopCoder Inc., the Glastonbury (Conn.) testing company that runs the Code Jams. "Wherever the best talent is, Google wants them."
<br /><br />
And the winner is...one of these clever ITT grads from India, right? Surprisingly, no. Ardian Poernomo, a third-year undergrad computer engineering student at Singapore's Nanyang Technological University, land sin first place. The No. 2 finisher, Pascal Alfadian, a second-year student at the Universitas Katolik Parahyangan in West Java, is Indonesian too. Poernomo didn't commit to taking a job with Google, however: He may go for PhD in computer science in the U.S.
<br /><br />
Still, Google now has a new pool of Asian talent to choose from. According to Krishna Bharat, head of Google's India R&amp;D center, all the finalists will be offered jobs. And Google needs them. The search company has been frustrated by its inability to find top-notch engineers for its year-old Indian center, according to industry insiders. Its Bangalore staff now totals 25, but it was hoping to have signed up at least 100 engineers by last December. Bharat refuses to discuss the company's difficulty in filling its ranks, except to say: "It has been a challenging year."
<br /><br />
<span class="bodySubtitle">WAR GAMES</span><br />
GOOGLE'S FRUSTRATIONS in India stem from two factors. One is the red-hot job market in India tech. Engineering students are assured a job a year before they graduate. But Google makes things hard for itself by having some of the most exacting hiring standards going. The contest is an example. Participants are tested on aptitude in problem solving, on designing and writing code, and on testing peer-written work. Finalists are asked to create and test software for unique Web searches and to get from point A to B in a city with a minimum number of turns. The final challenge is programming a war-based board game, a task so complex that only winner Poernomo completes it.
<br /><br />
For Google, the Code Jam will serve as a short cut through its hiring regime. Candidates normally go through a seven-stage process that can last months - and, at the end of it, they're more likely to be rejected than hired. Much of that screening can be set aside for Code Jam winners.
<br /><br />
For Wunderkinder like Poernomo, Google can be patient. Stanford grad Jon McAlister was the 2001 winner of TopCoder's U.S. Collegiate Code Jam, but didn't sign up with Google until 2004. He eventually rejected competing offers from Goldman, Sachs &amp; Co. and Microsoft Corp. "Google is the genuine engineering company," says McAlister. Google hopes its India finalists think so too.
</p>
                        <p>###</p>
                        <p><br /></p>
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
