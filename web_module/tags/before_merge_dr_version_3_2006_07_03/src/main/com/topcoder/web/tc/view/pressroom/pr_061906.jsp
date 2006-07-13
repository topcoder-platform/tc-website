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
                        <jsp:param name="title" value="Press Release"/>
                    </jsp:include>
                    
<div align="right"><tc-webtag:forumLink forumID="506056" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">AOL Named Title Sponsor of 2006<br> TopCoder Collegiate Challenge</span><br />
<span class="bodySubTitle"><em>AOL Supports Global Student Programming Community in <br>$200,000 Technical Software Contest</em></span></p>
</p>
</div>
                        
<p><strong>GLASTONBURY, CT, June 19, 2006 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced that AOL will serve as the title sponsor of the 2006 TopCoder Collegiate Challenge in San Diego, CA this November. AOL's sponsorship will provide the opportunity to address and access one of the world's top developer communities by presenting real-world problems in software design and development. This year's prize purse of $200,000 represents an increase of $50,000 over the 2005 TopCoder Collegiate competition. Look for upcoming TCCC06 details and announcements online at <a href="http://www.topcoder.com/tc">http://www.topcoder.com/tc</a>. 
<br><br>
"The TopCoder Collegiate Challenge is one of the premiere events in the developer community and we're thrilled to be involved with this year's competition," said Sree Kotay, Senior Vice President of Open Services for AOL. "As we continue to open the platforms of our industry-leading products and services, we're excited to build stronger relationships with the development community and to showcase our technical innovation and ingenuity."
<br><br>
AOL's new Open Services initiative enables developers to build customized third-party applications, plug-ins and mashups based on AOL's leading products and services. More information on AOL's range of developer resources and open APIs, including Open AIM&#174;, AOL&#174; Music Now Web Services and MapQuest&#174; OpenAPI, can be found at <a href="/?t=sponsor&c=link&link=http://developer.aol.com">http://developer.aol.com</a>. 
<br><br>
TopCoder competitions offer sponsors a powerful branding platform within the TopCoder global community of over 85,000 members that provides a unique opportunity to build valuable relationships and to hire some of the best developers in the world.
<br><br>
"TopCoder is delighted at the prospect of helping AOL present truly challenging problems to thousands of the top collegiate thinkers in the world," said Rob Hughes, President and COO of TopCoder, Inc. "As Title Sponsor, AOL brings an enormous global audience to the event, and we look forward to showcasing these tremendously innovative problem-solvers of the highest level." 
<br><br>
<span class="bodySubtitle">About TopCoder Competitions</span><br>
TopCoder tournaments are known worldwide as the most grueling, comprehensive test of skill in the field of competitive programming. The events allow competitors to solve complex algorithmic problems and design and develop working pieces of reusable software. All current industry standard technologies are incorporated, including Java, C++, C#, VB.NET, UML, J2EE and .NET.
<br><br>
<b>The TopCoder Collegiate Challenge (TCCC)</b> involves thousands of university-level students majoring in everything from computer science to mathematics to applied physics. The students compete head-to-head over several online elimination rounds until the best are flown in to compete in person at the onsite finals. The destination of the finals varies from year to year. <b>The TopCoder Open (TCO)</b> is host to both professional and collegiate developers. This event is dominated by the highest rated members in the TopCoder community, but enjoys heavy participation and spectatorship from developers of all levels.
<br><br>
<span class="bodySubtitle">About AOL</span><br>
AOL and its subsidiaries operate a leading network of Web brands and the largest Internet access subscription service in the United States. Web brands include the AOL.com&#174; website, AIM&#174;, MapQuest&#174; and Netscape&#174;. AOL offers a range of digital services in the areas of education, safety and security, communications and music. The company also has operations in Europe and Canada. AOL LLC is a majority-owned subsidiary of Time Warner Inc. and is based in Dulles, Virginia.
<br><br>
<span class="bodySubtitle">About TopCoder, Inc.</span><br>
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit <A href="http://www.topcoder.com">www.topcoder.com</a>.
<br><br>
TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.
<br><br>
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
