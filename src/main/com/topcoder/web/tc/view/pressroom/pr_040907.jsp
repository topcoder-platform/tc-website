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
                    
<div align="right"><tc-webtag:forumLink forumID="515049" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder Appoints Russ Malz Vice President of Sales</span><br>
<span class="bodySubTitle"><em>Consulting Veteran Brings 19 Years of Enterprise & Financial Services <br>Expertise to Software Sales</em></span></p>
</div>
      
<p>
<strong>Glastonbury, Conn., April 9, 2007 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced the appointment of Russ Malz as Vice President of Sales. In this role, Malz will be responsible for aligning TopCoder's capabilities with the growing corporate demand for high quality application development, and shaping the TopCoder competitive methodology platform to the enterprise market. Malz brings with him an extensive background in the financial services and technology industry and will be responsible for large enterprise sales in those sectors. 
</p>
<p>
"We are delighted that Russ has joined us as he has the experience and proven expertise to help drive TopCoder's enterprise sales efforts to the next level," said Rob Hughes, President and COO of TopCoder, Inc. "Russ brings great energy to the job and has a wealth of knowledge in large-scale applications that fits well with TopCoder's strengths. TopCoder continues to tackle more complex problems for large clients and the addition of Russ will allow us to deliver that value to the many organizations he has worked with in the past."
</p>
<p>
Malz joins TopCoder from ACS, where he was the Managing Director responsible for the strategic direction and operation of the AMS division and later was responsible for the strategic direction and operation of the Application Services division. Prior to ACS, he spent 6 years at IBM where he focused on selling complex services engagements in the Financial Services Sector.
</p>
<p>
Malz' early background includes numerous full application development and implementation projects while at Andersen Consulting and Walker Interactive Systems, an ERP software company. He also led a successful technology startup focused on packaged systems implementation, and application development, and managed a large Internet practice for a regional consulting firm.  
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
