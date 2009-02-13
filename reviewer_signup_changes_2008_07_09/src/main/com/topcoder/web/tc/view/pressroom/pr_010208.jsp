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
                    
<div align="right"><tc-webtag:forumLink forumID="518711" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder Expands With New Headquarters in Connecticut</span><br />
<span class="bodySubTitle"><em>Global Leader in Programming Contests and Software Methodology Stays Centered in Glastonbury</em></span></p>
</div>
      
<p>
<strong>GLASTONBURY, CONN., January 2, 2008 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, has relocated to new office space after a year of unprecedented fast growth. TopCoder is always looking for the best talent, both locally and globally, and required a larger office space to accommodate recent growth and continued expansion for 2008 and beyond. TopCoder remains headquartered in Glastonbury, Conn., now located at 95 Glastonbury Blvd.
</p>

<p>
TopCoder's growth continued at a record pace in 2007, as was recognized with a ranking of No. 45 in the Inc. 500 list of America's fastest-growing private companies (The 2007 Inc. 500 can be found in Inc. magazine's September issue, with TopCoder ranked No. 45 based upon three-year sales growth of 2,459.4%). Yet the biggest highlight of TopCoder's growth lies in its member base, which topped 135,000 members in 2007. TopCoder's active online community is made up of ranked and rated software designers and developers from nearly every nation in the world-competing and collaborating to produce software faster and of higher quality through a unique business model that has shaken up the business community.
</p>

<p>
"Our Glastonbury location is only the physical footprint of what we believe is becoming one of the most dynamic and significant virtual organizations in the world," said Jack Hughes, chairman and founder of TopCoder, Inc. "Our staff numbers are increasing to support our fast growing base of community members and client list.  We couldn't be happier in Connecticut.  We have access to great talent, great natural resources from the ocean to the mountains and easy access to all of the northeast major metro areas and the rest of the world when we need it - all in an affordable package that benefits our business operations and employees."
</p>

<p>
The new office location provides TopCoder with more than 11,000 square feet of space, and includes plenty of room for growth as the company looks to continue adding top talent on the hiring front. The new office provides a significantly greater presence for the company, located in a new professional development park just outside of Hartford, Conn.
</p>

<p>
<span class="bodySubtitle">About TopCoder, Inc.</span><br />
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process that results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder events, recruiting TopCoder members and utilizing TopCoder's software services, visit <a href="/">http://www.topcoder.com/</a>.
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
