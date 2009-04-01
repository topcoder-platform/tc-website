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
                    
<div align="right"><tc-webtag:forumLink forumID="524470" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder Recognized As One of Fastest Growing Connecticut<br />Companies By Connecticut Technology Council</span><br />
<span class="bodySubTitle"><em>UHY LLP Tech Top 40 Added To Inc. 500 and Deloitte Fast 50 Awards for TopCoder in 2008</em></span></p>
</div>
      
<p>
<strong>GLASTONBURY, CT November 7, 2008 &#151;</strong>TopCoder&reg;, Inc. today was honored as one of the fastest growing technology companies in Connecticut. The Connecticut Technology Council (CTC) this year launched a new awards program in partnership with accounting firm UHY LLP which recognizes the 40 fastest growing technology companies in Connecticut on the basis of revenue growth over four years, with a first year revenue requirement of $50,000. Companies needed to have minimum revenues of $3 million in the fourth year. This honor follows inclusion in the recent Inc. 500 and Deloitte Technology Fast 50 programs and marks the third major industry award received by TopCoder in 2008.
</p>

<p>
"We are extremely pleased to be included in such a distinguished group of technology and technology service providers from the state of Connecticut," said Rob Hughes, president and COO of TopCoder, Inc. "TopCoder is proud to help draw awareness to the great innovation that is going on in Connecticut businesses as we continue to make an impact on the global software business."
</p>

<p>
The UHY LLP Tech Top 40 focuses on exciting tech companies that are growing rapidly, are capturing market share and are led by a savvy, creative and aggressive management team and represent the State's leaders in job and wealth creation.
</p>

<p>
TopCoder recently launched TopCoder Direct <a href="/direct">http://www.topcoder.com/direct</a> which provides on-demand access to some of the best talent from more than 200 countries-literally competing to build web infrastructure, mobile applications, database systems and creative solutions at a price point the individual company or consumer can set.
</p>

<p>
<span class="bodySubtitle">About the Connecticut Technology Council</span><br />
The Connecticut Technology Council is the state's industry association for the technology sector. CTC's mission is to "connect people, ideas and opportunities to the global technology and innovation community." CTC provides members with business assistance and specialized programs, in addition to promoting and supporting public policies that position Connecticut to have a globally recognized "culture of innovation" that helps attract great ideas and entrepreneurs to in turn develop new jobs and wealth for the state.</p>

<p>
<span class="bodySubtitle">About TopCoder, Inc.</span><br />
TopCoder is the world's largest competitive software development community with over 174,000 developers representing more than 200 countries.  TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available.  The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology.  This methodology results in a highly consistent set of software components allowing a software-as-parts approach to application development.  TopCoder makes this large library of software components built through competition available to all of our clients.  Utilizing a world-wide member base and this library, TopCoder seeks to lower the cost of software development while increasing both the speed at which applications can be developed and the quality of the ultimate application.  For more information about sponsoring TopCoder events, recruiting TopCoder members and utilizing TopCoder's software services, visit <a href="/">http://www.topcoder.com/</a>.
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
