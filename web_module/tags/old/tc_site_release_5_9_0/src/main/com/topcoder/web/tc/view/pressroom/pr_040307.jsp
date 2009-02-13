<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Press Room</title>

    <jsp:include page="/script.jsp" />
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
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
         <td width="100%" align="center">


            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                    <jsp:include page="../page_title.jsp" >
                        <jsp:param name="image" value="press_room"/>
                        <jsp:param name="title" value="Press Release"/>
                    </jsp:include>
                    
<div align="right"><tc-webtag:forumLink forumID="514975" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder Appoints Jiazhi Wu VP of Technology for China</span><br>
<span class="bodySubTitle"><em>TopCoder Notable "WishingBone" Brings Competitive and Technical Expertise <br>to Company's China Operations</em></span></p>
</div>
      
<p>
<strong>Glastonbury, Conn., April 3, 2007 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced it has hired Jiazhi Wu as Vice President of Technology for the company's operations in China. Wu, known throughout the TopCoder Community by his handle "WishingBone", will oversee the development of systems and application development for all competitions and technologies and will be responsible for introducing and training new members in China to the TopCoder software process.  A past champion of TopCoder and Association for Computing Machinery (ACM) ICPC events, Wu studied at the College of Computer Science and Technology and the Chu Kechen Honors College (Zhejiang University). He brings a distinguished track record of achievements in global programming competitions and component development expertise to TopCoder's China office.
</p>
<p>
"TopCoder is extremely pleased to have Mr. Wu join our management team in China," said Rob Hughes, President and COO of TopCoder, Inc. "The TopCoder Community is widely recognized as one of the world's preeminent programming talent pools, and Jiazhi is certainly among the elite in that group."
</p>
<p>
Wu joined TopCoder as a member in May 2002. During the next two and a half years he earned a record 39 out of 45 component competition wins. He has also served as a TopCoder architect, assembler, review board member for more than 300 component projects as well as a Primary Reviewer and Chief Judge for TopCoder and ACM/ICPC Asia regionals. In December of 2004 Wu joined TopCoder as an assembly contractor, where he has remained until his current appointment.
</p>
<img src="/i/pressroom/wishingbone_040307.jpg" alt="" border="0" style="margin: 30px; float: left;" />
<p>
<b>Partial list of Jiazhi Wu's Achievements</b>
<ul>
<li>TopCoder Collegiate Challenge, International Regional Champion, 2003;</li>
<li>ACM International Collegiate Programming Contest (ACM/ICPC), Champion 2003, Aizu; 2003, Runner-up, Xi'an; 2002, 4th place, Beijing;  2003, 13th place in World Finals;</li>
<li>International Collegiate Mathematical Contest in Modeling, 2nd Prize, 2002;</li>
<li>Founder and first president of ZJU Google Camp in 2006. Held technical internship with Google that same year;</li>
<li>Coached and created new training regimen for Zhejiang University ACM/ICPC teams which made the 2005 World Finals;</li>
<li>TopCoder record and reputation &mdash; one of the most prolific and successful members of all time.</li>
</ul>
</p>
<p>
To access Jiazhi Wu's online TopCoder profile, please visit: <a target="_blank" href="/tc?module=MemberProfile&cr=286907">http://www.topcoder.com/tc?module=MemberProfile&cr=286907</a>. Current TopCoder membership in China now totals nearly 10,000 students and professionals. The TopCoder China website is available at: <a target="_blank" href="<tc-webtag:linkTracking link='http://www.topcoderchina.com/' refer='pr_040307' />">http://www.topcoderchina.com/</a>.
</p>
<span class="bodySubtitle">About TopCoder, Inc.</span><br>
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process that results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit <a href="/">http://www.topcoder.com/</a>.
</p>
<p>
TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.
</p>
                        <p>###</p>
                        <p><br /></p>
                    </td>
                </tr>
            </table>
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
