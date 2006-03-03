<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Tournaments</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
<script language="JavaScript">
  function changeImage(image, newImage) {
    document[image].src=newImage;
    return;
  }
</script>
</head>

<body>

<jsp:include page="/top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="topcoder_tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD class="bodyText" width="100%" valign="top">
<div align="center" style="margin: 0px 10px 0px 10px;">


<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><br>

            <jsp:include page="links.jsp" />
            <jsp:include page="links_rules.jsp" />

  <br><br>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR><TD VALIGN="middle" COLSPAN="3" HEIGHT="16" CLASS="statText"><BR/>
<P><B>Official Rules and Regulations</B></P>
<DIV ALIGN="center">No purchase necessary to enter or win.</DIV><BR/>
<DIV CLASS="statTextBig">Overview of the Tournament</DIV><BR/>
<P>The 2002 TopCoder Invitational tournament will take place between October 8th and November 23rd. It will consist of four (4) online elimination rounds and two 
(2) onsite rounds, being the Semifinal and Championship rounds. The total prize purse for the tournament will be $150,000, with the top 64 finishers in the online 
rounds receiving prize money. The top 16 finishers in the online rounds will advance to the onsite Semifinal and Championship rounds, being held at the Mohegan Sun 
Casino in Uncasville, CT from November 21st through November 23rd.</P>
<P><B>Eligibility</B></P>
<P>The tournament is open to the following members who are at least 18 years of age, AND who have participated in at least three (3) TopCoder rated events 
(i.e., Single Round Matches and previous tournaments) prior to October 1, with at least one (1) of those events being since March 31st:</P>
<UL>
<LI>All citizens and lawful permanent residents of:</LI>
<UL>
<LI>Australia</LI>
<LI>Canada (excluding Quebec)</LI>
<LI>China</LI>
<LI>India</LI>
<LI>Ireland</LI>
<LI>New Zealand</LI>
<LI>the United Kingdom</LI>
<LI>the United States (including the U.S. territories of Guam, Puerto Rico and the U.S. Virgin Islands)</LI>
</UL>
<LI>All non-immigrants currently residing in the United States with a valid Visa</LI>
</UL>
<P><B>Invitations and Registration</B></P>
<P>The top 1,024 rated TopCoder members as of October 1st who meet the eligibility criteria defined above will be invited via email to compete in the tournament. 
Invitations will be emailed on October 4th. Once invited, members must register on TopCoder's website to compete in the tournament. 
Registration details and deadlines will be provided in the invitations.</P>
<P>Employees of TopCoder, Inc. and those involved in the production (including prize suppliers), implementation and distribution of this tournament and their advertising 
or promotion agencies, parent companies, service providers, agents, officers, subsidiaries or affiliates, or any other persons or entities directly associated with the 
tournament and members of the immediate families and/or persons living in the same household as such persons, are ineligible to enter the tournament. </P>
<BR/>
<BR/>
</TD>
</TR>
</TABLE>



      </TD>
   </TR>
</TABLE>

   <br><br>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="/foot.jsp" />

</body>

</html>
