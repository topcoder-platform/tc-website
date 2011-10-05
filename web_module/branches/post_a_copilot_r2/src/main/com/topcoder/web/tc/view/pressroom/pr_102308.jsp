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
                    
<div align="right"><tc-webtag:forumLink forumID="524077" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder Ranked Number 11 in Deloitte's Technology Fast 50 Program for New York, New Jersey and Connecticut</span><br />
<span class="bodySubTitle"><em>Expanded Use of TopCoder Community for Competitive Software Development and<br />Creative Design Drives 3,206 Percent Revenue Growth</em></span></p>
</div>
      
<p>
<strong>GLASTONBURY, CT. October 23, 2008 &#151;</strong>TopCoder&reg;, Inc., has been named to Deloitte's prestigious Technology Fast 50 Program for New York, New Jersey and Connecticut, a ranking of the 50 fastest growing technology, media, telecommunications and life sciences companies in the area by Deloitte LLP, one of the nation's leading professional services organizations.  Rankings are based on the percentage revenue growth over five years from 2003-2007.
</p>

<p>
"The recognition of TopCoder in Deloitte's Technology Fast 50 is tremendous validation for the talent of our community and the quality of work produced through competition," said TopCoder Founder Jack Hughes. "We're proud to know that our members' payments continue to increase alongside TopCoder's revenues, and together we're proving there is a better way to build enterprise-class web infrastructure, applications and creative solutions."
</p>

<p>
To qualify for the Technology Fast 50, companies must have had operating revenues of at least $50,000 in 2003 and $5,000,000 in 2007, be headquartered in New York, New Jersey, or Connecticut, and be a company that owns proprietary technology or proprietary intellectual property that contributes to a significant portion of the company's operating revenues; or devotes a significant proportion of revenues to the research and development of technology.  Using other companies' technology or intellectual property in a unique way does not qualify.
</p>

<p>
"Sustaining high revenue growth over five years is an exceptional accomplishment. We commend TopCoder for making the commitment to technology and delivering on the promise of market longevity," said Kevin Buckley, Technology Fast 50 Program Director, Deloitte Services LP.  "We are proud to honor TopCoder to Deloitte's Technology Fast 50."
</p>

<p>
Companies from the regional Technology Fast 50 programs in the United States and Canada are automatically entered in Deloitte's Technology Fast 500 program, which ranks North America's top 500 fastest growing technology, media, telecommunications and life sciences companies.  For more information on Deloitte's Technology Fast 50 or Technology Fast 500 programs, visit <a target="_blank" href="<tc-webtag:linkTracking link='http://www.fast500.com/' refer='pr_102308' />">www.fast500.com</a> .
</p>

<p>
<span class="bodySubtitle">About Deloitte</span><br />
As used in this document, "Deloitte" means Deloitte LLP.  Please see <a target="_blank" href="<tc-webtag:linkTracking link='http://www.deloitte.com/about/' refer='pr_102308' />">www.deloitte.com/about</a> for a detailed description of the legal structure of Deloitte LLP and its subsidiaries.
</p>

<p>
<span class="bodySubtitle">About TopCoder, Inc.</span><br />
TopCoder is the world's largest competitive software development community with more than 170,000 developers representing over 200 countries. TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available. The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology. This methodology results in a highly consistent set of software components allowing a software-as-parts approach to application development. TopCoder makes this large library of software components built through competition available to all of our clients. Utilizing a world-wide member base and this library, TopCoder seeks to lower the cost of software development while increasing both the speed at which applications can be developed and the quality of the ultimate application. For more information about sponsoring TopCoder events, recruiting TopCoder members and utilizing TopCoder's software services, visit <a href="/">http://www.topcoder.com/</a>.
</p>

<p>
<strong>TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.</strong>
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
