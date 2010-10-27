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
                    
<div align="right"><tc-webtag:forumLink forumID="505930" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder Names UBS as Premier Sponsor of<br>2006 TopCoder Open</span><br />
<span class="bodySubTitle"><em>Financial Services Leader Becomes First Wall Street Firm to<br>Participate at Premier Level with Top Global Coding Competition<br></em></span></p>
</p>
</div>
                        
<p><strong>GLASTONBURY, CT, March 3, 2006 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced that UBS (<b>NYSE: UBS</b>), one of the world's largest financial services firms has signed on as a Premier sponsor of the 2006 TopCoder Open (TCO06). This marks the first time a financial sector organization has sponsored a TopCoder flagship event.
<br><br>
The TCO06 will bring thousands of the world's finest programmers together in competition over the course of ten weeks for international ranking, notoriety and a share of the $150,000 prize purse for Algorithm, Component Design and Development categories. TopCoder will fly in 64 finalists from around the globe to compete in face-to-face competition at the Aladdin Resort and Casino in Las Vegas from May 3rd - 5th to determine the winners of all competitions. Full details and rules are provided at: <a href="http://www.topcoder.com/tco06">http://www.topcoder.com/tco06</a>.
<br><br>
"UBS executes one in nine shares globally and trades in nearly every securities product around the world," said Will Sterling, US Head of Direct Execution.  "And our technology platform is the core of that global business.  We need the best programmers to continue to improve our high speed order routing platforms, create innovative new automated trading algorithms, and empower our traders and clients with the best trading and risk management tools in the industry.  We are excited about sponsoring the TopCoder Open and look forward to working with TopCoder to introduce developers to the unique challenges and opportunities at UBS."
<br><br>
TopCoder's annual flagship events, the TopCoder Open and TopCoder Collegiate Challenge, allow partner companies to brand, recruit and interface with the leading programmer community in the world. TopCoder's global programming tournaments involve thousands of developers using the latest technologies, and produce levels of energy and excitement unmatched in any other online venue in the software world. These competitions offer a form of skills evaluation previously unavailable to the programming world - real-time programming contests that are judged immediately and objectively. 
<br><br>
"Wall Street has always had a high interest in securing the very best talent be it traders, analysts or technologists," said Rob Hughes, President and COO of TopCoder. "TopCoder members have been successfully recruited for key technology positions within forward-looking firms such as UBS, and we're pleased to strengthen our alignment with the financial services industry."
<br><br>
<span class="bodySubtitle">About UBS</span><br>
UBS is one of the world's largest wealth managers, a premier investment banking and securities firm, a key global asset manager and a market leader in Swiss retail and commercial banking. Headquartered in Zurich and Basel, UBS employs over 70,000 people in more than 50 countries and is listed on the New York, Tokyo and Zurich stock exchanges. UBS's investment banking and securities business is among the select bracket of major global houses, providing corporate and institutional clients, hedge funds, banks, brokers and financial intermediaries, with expert advice, unrivalled execution and comprehensive access to the world's capital markets. 
<br><br>
The Investment Bank comprises the following business areas: Investment Banking, Equities, Fixed Income and Foreign Exchange and employs more than 16,000 people across 30 countries.<br>
<a href="http://www.ubs.com">www.ubs.com</a>
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
