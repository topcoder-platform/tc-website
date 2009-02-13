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
                    
<div align="right"><tc-webtag:forumLink forumID="508394" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">Connected Services Sandbox Launches</span>
</p>
</div>
      
<p>
Competitors will be given the task of developing managed network mashups that address the specific service requirements of multiple usage scenarios. The winners of each competition will receive prizes ranging from $2,500 to $25,000. 
</p>
<p>
<strong>Competition Details</strong><br>
The Connected Services Sandbox competition series will be open to freelance developers and member organizations of the Sandbox. By registering directly through the Sandbox, developers can review the competition rules, choose from the competitions available, and begin designing applications appropriate for individual competitions within the series. The competitions are divided into multiple usage scenarios as defined by Microsoft and BT. Usage scenarios can include a combination of communications services, such as e-mail, instant messaging and document collaboration, with Web services, such as Windows Live&#153;, Microsoft MapPoint&#174;, Amazon, eBay, Google and Yahoo!
</p>
<p>
Each competition has two stages: In the first stage, the Design Competitions, developers create a storyboard for an innovative mashup idea and present that idea, either graphically or through written specifications, to a panel of judges. The winning mashup design resulting from the first stage moves on to the second stage, the Assembly Competitions, in which developers build a prototype of the winning design that can deliver a demonstrable service.
</p>
<p>
The initial designs and resulting prototypes will be judged by BT, a panel of Microsoft customers, engineers and peers from the community. Winners are rewarded through monetary prizes and nonmonetary promotional programs. In addition to monitoring the competitions, TopCoder will be responsible for prize administration and distribution. The first round of winners will be announced at NXTcomm in Chicago, June 18 through 21, 2007, with winning services demonstrated at the Microsoft booth.
</p>
<p>
Developers can find more information about the Sandbox competitions at: 
<A href="<tc-webtag:linkTracking link="http://csf.topcoder.com/" refer="csf_press_release"/>">http://csf.topcoder.com/</A> or <A href="<tc-webtag:linkTracking link="http://www.networkmashups.com" refer="csf_press_release"/>">http://www.networkmashups.com/</A>.
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
