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
                    
	<div align="right"><tc-webtag:forumLink forumID="532937" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder Cryptographers Test World War II Secret Code Machine
</span><br />
<span class="bodySubTitle"><em>Virtual Recreation of Enigma Machine is Beaten 40% of the Time by TopCoder Marathon Match Winning Algorithm</em></span></p>
</div>
      
<p><strong>Glastonbury, CT - December 22, 2009</strong> -  <a href="http://www.topcoder.com">TopCoder&reg;, Inc.</a>, today announced the winning algorithm in a coding competition challenging competitors to crack the famous World War II Enigma encryption machine. Building on some of the ideas of his predecessors, TopCoder member Po-Ru Loh, aka ploh, a Ph.D. student in Mathematics at MIT, was able to partially defeat the machine with consistency. Although Loh’s winning algorithm was unable to crack the complex code every time, he managed to successfully solve about 40% of the cases. </p>

<p>The competition challenged TopCoder members to quickly reproduce a mathematical feat accomplished by thousands of Allied mathematicians and code-breakers at the famous Bletchley Park encrypted intelligence headquarters during World War II. Competitors were informed of the workings of a virtual replica of the machine, but were given no information about the details of its wiring, and had to write computer algorithms which learned about the wiring by looking only at encoded messages.  Unlike the original code breakers in the 1940’s, the competitors were not helped by protocol mistakes or information from espionage (the key to much of the wartime operational success).  To make the challenge slightly easier (indeed the problem would be impossible otherwise) competitors were also given the decoded versions of a handful of messages. From this information set, they were told to crack the code using a computer algorithm.</p>
<p>While the protocol used in the contest was much more difficult than that used in World War II, the competitors did have one advantage over their predecessors.  Though the mathematicians at Bletchley Park built some of the world's first computers, they were billions of times slower than the computers of today.  Competitors could harness the horsepower of modern machines to break the Enigma machine even when the machine was used perfectly and its internal workings were entirely unknown.</p>
<p>Although initially it appeared the Enigma machine, when used properly, might prove too difficult a problem for competitors even with the aid powerful modern computers, ten days into the Marathon Match competition Loh made the breakthrough with his winning algorithm, for which he earned a $1,500 cash prize. Second and third place runners up were David Stolp of Durham, CA, and Eugene Valsilchenko of North Potomac, MD.</p>
<p>“We have been experiencing a significant growth in interest from clients in exploring what the TopCoder community can deliver in terms of cyber security and countermeasure solution,” said Rob Hughes, President and COO of TopCoder, Inc. “With increasing concern over cyber terrorism in the form of online attacks on utility grids, hacking of military command feeds and compromising of sensitive financial and healthcare information systems, demonstrated encryption and countermeasure skills are an attractive core competency of many of our members.”</p>
<p>This competition was the first in a series of three Marathon Matches TopCoder has been hosting for patron NSA. </p>
<p><strong>About TopCoder, Inc.</strong><br />
TopCoder is the world's largest competitive software development community with more than 225,000 developers representing over 200 countries. TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available. The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology. This methodology results in a highly consistent set of software components allowing a software-as-parts approach to application development. TopCoder makes this large library of software components built through competition available to all of our clients. Utilizing a world-wide member base and this library, TopCoder seeks to lower the cost of software development while increasing both the speed at which applications can be developed and the quality of the ultimate application. For more information about sponsoring TopCoder events, recruiting TopCoder members and utilizing TopCoder's software services, visit <a href="http://www.topcoder.com">www.topcoder.com</a>.</p>

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
