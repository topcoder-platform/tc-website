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
                    
	<div align="right"><tc-webtag:forumLink forumID="531995" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder Inc. Wins Deloitte Fast 500 and Connecticut Technology Council Tech Top 40 Awards</span><br />
<span class="bodySubTitle"><em>Global Virtual Software Factory Connects Talent, Process & Product Using Delivery-Based Engagement Model</em></span></p>
</div>
      
<p><strong>Glastonbury, CT - October 28, 2009</strong> -  <a href="http://www.topcoder.com">TopCoder&reg;, Inc.</a>, announced today that it has been recognized with two prestigious industry awards for business growth and innovation - the Deloitte <a href="http://www.deloitte.com/view/en_US/us/Industries/Technology/technologyfast500/index.htm">Technology Fast 500</a> and the <a href="http://www.ct.org/Tech_Top_40.asp">UHY LLP Tech Top 40</a>. This marks the third consecutive year TopCoder has achieved recognition from both programs.</p>

<p>TopCoder ranked #151 on Deloitte's Technology Fast 500, Deloitte LLP`s ranking of 500 of the fastest growing technology, media, telecommunications, life sciences and clean technology companies in North America. Rankings are based on percentage of fiscal year revenue growth during the five year period from 2004-2008. TopCoder ranked #43 in the Software category nationally, with growth of 990 percent during this period.</p>

<p>TopCoder was also recognized by the Connecticut Technology Council and UHY LLP as a UHY LLP Tech Top 40 software company for 2009. The list of 40 Connecticut tech companies celebrates the fastest-growing technology companies in the state. TopCoder was recognized in the category reserved for Software companies. The Connecticut Technology Council and UHY LLP compile the winners list based on revenue growth over the last four years.</p>

<p><strong>About The Connecticut Technology Council</strong><br />
The Connecticut Technology Council is a statewide association of technology oriented companies and institutions, providing leadership in areas of policy advocacy, community building and assistance for growing companies. Speaking for over 2,000 companies that employ some 200,000 residents, the Connecticut Technology Council seeks to provide a strong and urgent voice in support of the creation of a culture of innovation. This includes working to position Connecticut as a leader in idea creation, workforce preparation, entrepreneurial aptitude, early stage risk capital availability and providing ongoing support
and mentoring to high potential firms. 
</p>

<p><strong>About UHY LLP</strong><br />
UHY LLP is a licensed independent CPA firm that performs audit and attest services in an alternative practice structure with UHY Advisors, Inc. UHY LLP and UHY Advisors, Inc. are independent U.S. members of UHY International Limited. UHY LLP has distinguished itself as a market leader among accounting\ firms for public companies, middle-market, and privately owned businesses for the past 30 years. The firm is supported by highly motivated partners and staff focused on serving audit and reporting needs with the utmost integrity.</p>

<p><strong>About TopCoder, Inc.</strong><br />
TopCoder is the world's largest competitive software development community with nearly 200,000 developers representing over 200 countries. TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available. The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology. This methodology results in a highly consistent set of software components allowing a software-as-parts approach to application development. TopCoder makes this large library of software components built through competition available to all of our clients. Utilizing a world-wide member base and this library, TopCoder seeks to lower the cost of software development while increasing both the speed at which applications can be developed and the quality of the ultimate application. For more information about sponsoring TopCoder events, recruiting TopCoder members and utilizing TopCoder's software services, visit <a href="http://www.topcoder.com">www.topcoder.com</a>.</p>

<p><em>TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.</em></p>

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
