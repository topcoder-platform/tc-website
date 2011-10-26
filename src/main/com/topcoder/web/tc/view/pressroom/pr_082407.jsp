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
                    
<div align="right"><tc-webtag:forumLink forumID="517186" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">Lilly and Deutsche Bank Announced as New Sponsors &amp; NSA Returns as Patron of 2007 TopCoder Collegiate Challenge</span><br />
<span class="bodySubTitle"><em>Lilly and Deutsche Bank Onboard with Leading Collegiate Programming Contest National Security Agency Continues Patronage of Fifth Major Event</em></span></p>
</div>
      
<p><strong>Glastonbury, Conn., August 24, 2007 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced Eli Lilly and Company <strong>(NYSE: LLY)</strong>, and Deutsche Bank <strong>(NYSE: DB)</strong>, a leading global investment bank, as first time sponsors of the 2007 TopCoder Collegiate Challenge scheduled for October 30th - November 2nd at Disney World in Orlando, Florida. In addition, the National Security Agency (NSA) has continued as an event patron for an unprecedented fifth major event. Full details including event schedules, rules and guidelines are available online at: <a href="http://www.topcoder.com/tccc07">http://www.topcoder.com/tccc07</a>.</p>

<p>"TopCoder attracts extremely dedicated young people who are capable of analyzing, structuring and solving exceptional problems quickly by working as part of a team," says Wolfgang Gaertner, Head of Personal &amp; Corporate Banking IT and Operations at Deutsche Bank. "These skills are in high demand everywhere in banking. Deutsche Bank has opened its doors widely to such talented people by offering a variety of career development opportunities, creating possibilities for them to prove themselves in numerous interesting fields of work all over the world. For this reason," says Gaertner, "I am very positive about DB's participation in the TopCoder event."</p>

<p>The TCCC07 sponsor track will for the first time offer sponsors more equal billing -- each will be afforded the same opportunities for global branding and interfacing with the TopCoder community and onsite finalists. This year's TCCC features four highly contested tournament tracks -- the Algorithm Competition, Component Design and Development Competition, Marathon Match Competition and Studio Design Competition. More than 3,000 talented competitors registered across all competitions. TopCoder competitions offer sponsors a powerful branding platform within the TopCoder global community of over 120,000 members and provides a unique opportunity to build valuable relationships and to hire some of the best developers in the world.</p>

<p>Thousands of students in computer science, mathematics, physics and other disciplines from universities around the world began registering in July to compete online with the goal of advancing to the world-renowned TCCC onsite finals being held at Disney World in Orlando, Florida this November. Finalists will compete in algorithm, component design and component development divisions to earn a share of more than $220,000 in cash prizes.</p>

<p>"Competition is at the heart of everything we do at TopCoder and that applies to the opportunities we present to our sponsors as well," said Rob Hughes, President and COO of TopCoder, Inc. "We welcome Lilly and Deutsche Bank as newcomers to our onsite events and are pleased to continue our productive relationship with NSA."</p>

<p><span class="bodySubtitle">About TopCoder Competitions</span><br />
TopCoder tournaments are known worldwide as the most grueling, comprehensive test of skill in the field of competitive programming. The events allow competitors to solve complex algorithmic problems and design and develop working pieces of reusable software. All current industry standard technologies are incorporated, including Java, C++, C#, VB.NET, UML, J2EE and .NET.</p>

<p><strong>The TopCoder Collegiate Challenge (TCCC)</strong> involves thousands of university-level students majoring in everything from computer science to mathematics to applied physics. The students compete head-to-head over several online elimination rounds until the best are flown in to compete in person at the onsite finals. The destination of the finals varies from year to year. <strong>The TopCoder Open (TCO)</strong> is host to both professional and collegiate developers. This event is dominated by the highest rated members in the TopCoder community, but enjoys heavy participation and spectatorship from developers of all levels.</p>

<p><span class="bodySubtitle">About TopCoder, Inc.</span><br />
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process that results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder events, recruiting TopCoder members and utilizing TopCoder's software services, visit <a href="/">http://www.topcoder.com/</a>.</p>

<p>TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.</p>
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
