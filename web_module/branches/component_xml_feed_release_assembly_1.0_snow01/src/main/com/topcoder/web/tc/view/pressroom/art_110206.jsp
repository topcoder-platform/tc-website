<%@ page contentType="text/html;charset=utf-8" %> 
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
                        <jsp:param name="title" value=""/>
                    </jsp:include>

<div align="right"><tc-webtag:forumLink forumID="506167" message="Discuss this article" /></div>
<div align="center"><img src="/i/pressroom/businessweek_logo.gif" alt="BusinessWeek" border="0" /></div>
<div align="center">
<p><span class="bodyTitle">A Growing Cadre Of Code Warriors</span><br/>
<span class="bodySubTitle"><em>China's young programming hotshots are gaining global attention</em></span><br /></p>
</div>
                        
<p>
Meet "Wishing Bone." That's the online handle of Wu Jiazhi, a student at Zhejiang University who has become a big winner in the programming contests offered by TopCoder Inc., a Glastonbury (Conn.) company that works with the likes of America Online (AOL) and Merrill Lynch (MER). Topcoder invites programmers around the world to solve software problems over the Net. Within weeks of entering his first contest three years ago, Wu had bagged $2,500. "I bought my first laptop with that money," says the 26-year-old. After earning $200,000-plus from TopCoder since then, he now has enough cash to buy plenty more computers.  
<br><br>
With programmers like Wu faring so well, the world is reassessing China's software industry. For years, multinationals such as Microsoft Corp. (MSFT) watched almost helplessly as Chinese consumers and corporations alike pirated their software. But the climate is improving as Beijing cracks down on intellectual-property violations. Although piracy remains a severe problem, "we've made a lot of progress," says Ya-Qin Zhang, the Beijing-based head of China research and development for Microsoft.
<br><br>
The Chinese government is hoping better training will also bolster the fledgling industry. In 2002 it launched software colleges at dozens of universities, with a focus on satisfying the needs of businesses. Today, there are 36 such schools in China, which have graduated a total of 60,000 students in the past three years. "Software colleges want to train talent for industry, not for academia," says Jack Wu, deputy dean of the software college at Peking University.
<br><br>
Topcoder is taking advantage of the deepening talent pool. President Robert Hughes says he's impressed by the quality of software engineers in China, which is home to more than 40% of the programmers taking part in TopCoder competitions. Overall, China ranks third in TopCoder's software contests, well ahead of rival India. Chinese programmers "have been innovative, thinking creatively in solving the problems we put out there," he says. TopCoder is now opening an office in Beijing, its first outside the U.S., to recruit more Chinese.
<br><br>
Don't expect all of them to pull down the kind of money Wishing Bone has earned. "Assistant" is more typical. He's Wu Yanbo, a 24-year-old graduate student at Tsinghua University in Beijing who has taken home $5,000 in the contests since last December. That's enough, though, to make him consider dropping out of school, something that doesn't go over well with his parents. Older Chinese "think the only way students in China can have a good career is to get an advanced degree," Assistant says.
<br><br>
Wishing Bone wants to quit his studies, too, and he tries to reassure his worried parents that there's life after graduate school. Exhibit A: famous American dropouts such as Bill Gates, who gave up on Harvard University to start Microsoft and today is the world's richest man. "They told me: 'That's America, not China,"' he says. Will Wishing Bone listen to his parents and stick with his degree program? "Probably not," he says. With China's software industry on the rise, he and other smart young programmers see plenty of opportunities beyond the university gates.
</p>
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
