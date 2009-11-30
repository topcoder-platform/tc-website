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
                    
	<div align="right"><tc-webtag:forumLink forumID="532424" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder Names Nicholas M. Donofrio to Company's Board of Directors</span><br />
<span class="bodySubTitle"><em>Former IBM Technology Strategy Team Leader Joins Executive Roster of World's Largest Competitive Software Development Community</em></span></p>
</div>
      
<p><strong>Glastonbury, CT - November 25, 2009</strong> -  <a href="http://www.topcoder.com">TopCoder&reg;, Inc.</a>, today announced that Nicholas M. Donofrio has been named to the company's Board of Directors effective immediately. Donofrio spent 44 years at IBM Corp., starting as a logic and memory chip designer and rising to lead the company's technology strategy as executive vice president of innovation and technology. He is also an IBM Fellow Emeritus, the highest honor a scientist, engineer or programmer at IBM can achieve.</p>
<p>Donofrio also serves as a board member for The Bank of New York Mellon Corporation, Advanced Micro Devices Inc. and Liberty Mutual. He is on the board of trustees for the Rensselaer Polytechnic Institute and is co-chair of the New York Hall of Science Board of Trustees.</p>
<p>"Nick understands that the future of innovation will be through community and the underlying processes that drive interaction and creation," said Jack Hughes, chairman and founder of TopCoder, Inc. "His experience and vision in the realm of technological change and truly game changing innovation will be instrumental in guiding TopCoder's future development as a software industry leader."</p>
<p>Donofrio was the leader of IBM's technology strategy and a champion for innovation across IBM and its global ecosystem. His responsibilities included IBM Research, the Personal Systems Group, the Integrated Supply Chain and Integrated Product Development teams, Governmental Programs, Environmental Health and Product Safety, Quality, and IBM's enterprise on-demand transformation team. He also headed the IBM Technology Team, was a member of IBM's Strategy Team, and was chairman of the board of governors for the IBM Academy of Technology. In addition to his strategic business mission, Mr. Donofrio lead the development and retention of IBM's technical population and worked to enrich that community with a diversity of culture and thought. Mr. Donofrio joined IBM in 1964 and spent the early part of his career in integrated circuit and chip development as a designer of logic and memory chips. He held numerous technical management positions and, later, executive positions in several of IBM's product divisions. He led many of IBM's major development and manufacturing teams -- from semiconductor and storage technologies, to microprocessors and personal computers, to IBM's entire family of servers. </p>
<p>He earned a Bachelor of Science degree in Electrical Engineering from Rensselaer Polytechnic Institute in 1967 and a Master of Science in the same discipline from Syracuse University in 1971. In 1999 he was awarded an honorary doctorate in Engineering from Polytechnic University and in 2002 he received an honorary doctorate in Sciences from the University of Warwick in the United Kingdom. </p>
<p>Mr. Donofrio is a strong advocate of education and vigorously promotes mathematics and science as the keys to economic competitiveness. He is particularly focused on advancing education, employment and career opportunities for underrepresented minorities and women. From 1997 through 2002, he served as Chairman of the National Action Council for Minorities in Engineering (NACME). He is the holder of seven technology patents and is a member of numerous technical and science honor societies. He is a Fellow of the Institute for Electrical and Electronics Engineers, Fellow of the UK-based Royal Academy of Engineering, a member of the Board of Directors for the Bank of New York, and he serves on the Board of Trustees at Rensselaer Polytechnic Institute. Mr. Donofrio is a member of the U.S.-based National Academy of Engineering and the American Academy of Arts and Sciences. In 2002, he was recognized with the Mensforth International Gold Medal for outstanding contributions to the advancement of manufacturing engineering. In 2003, Mr. Donofrio was named Technology Leader of the Year by IndustryWeek magazine, the Technical Executive of the Year by the University of Arizona, and he received the Rodney D. Chipp Memorial Award by the Society of Women Engineers for his outstanding contributions to the advancement of women in the engineering field. 
 Advisors, Inc. UHY LLP and UHY Advisors, Inc. are independent U.S. members of UHY International Limited. UHY LLP has distinguished itself as a market leader among accounting\ firms for public companies, middle-market, and privately owned businesses for the past 30 years. The firm is supported by highly motivated partners and staff focused on serving audit and reporting needs with the utmost integrity.</p>

<p><strong>About TopCoder, Inc.</strong><br />
TopCoder is the world’s largest competitive software development community with more than 225,000 developers representing over 200 countries. TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available. The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology. This methodology results in a highly consistent set of software components allowing a software-as-parts approach to application development. TopCoder makes this large library of software components built through competition available to all of our clients. Utilizing a world-wide member base and this library, TopCoder seeks to lower the cost of software development while increasing both the speed at which applications can be developed and the quality of the ultimate application. For more information about sponsoring TopCoder events, recruiting TopCoder members and utilizing TopCoder's software services, visit , visit <a href="http://www.topcoder.com">www.topcoder.com</a>.</p>

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
