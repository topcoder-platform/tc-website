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
function open_window(url) {
mywin =
window.open(url,"win",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=433,height=288');
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

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif">
<TR>
<TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
<TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>

<jsp:include page="links.jsp" />
<jsp:include page="links_rules.jsp" />
<BR/><BR/>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR><TD VALIGN="middle" COLSPAN="3" HEIGHT="16" CLASS="statText"><BR/>
<DIV CLASS="statTextBig">Scoring and Advancing during Online Regional Rounds</DIV><BR/>
After each round of competition, the winners from each of the assigned rooms will be identified and invited to compete at the next level of competition. 
Coder advancement in all rounds is determined by comparing the total point values from all three phases of the round 
&#40; see <A HREF="/?RoundId=4025&t=tournaments&c=tourny_rules_structure" CLASS="statText">Competition Round Structure</A> &#41; for each coder.  In order to advance, 
a coder must finish with a greater-than-zero point total.  The winners will be determined as follows:<BR/><BR/>
<B>Online Regional Quarter-Final</B><UL>
<LI>Up to 128 coders per region (totaling 512) will compete - 32 coders per region (totaling 128) will advance</LI><BR/>
<LI>The winners of each room will automatically advance (automatic berth) (up to 16)</LI><BR/>
<LI>The remaining spots (wildcard pool) (32 minus the total number of room winners) will be handed out based on total points across all rooms in the region</LI>
</UL>
<B>Online Regional Semifinal</B><UL>
<LI>32 coders per region (totaling 128) will compete - 8 coders per region (totaling 32) will advance</LI><BR/>
<LI>The winners of each room will automatically advance (4)</LI><BR/>
<LI>A wildcard pool will be used to determine the remainder of the advancers in each region.  The remaining spots (4) will be handed out based on total points across all rooms in the region.</LI>
</UL><BR/>
Note: The term "wildcard" indicates a competitor who has advanced to the next round of competition based on highest points for a given round. In the case of the Regional Championship, 
the "wildcards" will total twelve (12) competitors based on all regions. There will be a minimum of one (1) representative per region in the Semifinals, but there could be more than one 
"wildcard" from any region going into the Semifinals.<BR/><BR/>
<B>Online Regional Final</B><UL>
<LI>8 coders per region (totaling 32) will compete</LI><BR/>
<LI>The winners of each region (4) will be crowned Regional Champions, will win $5,000 each, and will automatically advance to the onsite Semifinal round.  (NOTE:  All regional champions must participate in the onsite Semifinal rounds to receive prizes.)</LI><BR/>
<LI>The remaining spots (12) to advance to the onsite Semifinal and Championship rounds will be handed out based on total points across all rooms (regardless of region)</LI>
</UL><BR/>
In order to advance, a coder must finish with a greater-than-zero point total.  If a room has no contestants who have more than zero points, the automatic berth for that room will be placed into the regional wildcard pool.  Any tie in points for an automatic berth in a room or for the last spot of the wildcard pool will be resolved in the following manner:<UL>
<LI>Total points acquired (higher is better) during the rounds of the tournament in which all of the tied participants were presented with the same set of problems</LI><BR/>
<LI>If a tie still remains, then by rating (higher is better) as of February 14, 2002</LI>
</UL><BR/>
If a tie still remains, all tied coders will advance to the next round.<BR/><BR/>
<DIV ALIGN="center" CLASS="statTextBig">Visit <A HREF="http://www.sun.com" CLASS="statTextBig">Sun Microsystems</A> - exlcusive sponsor of the 2002 TopCoder Collegiate Challenge</DIV><BR/>
</TD>
</TR>
</TABLE>
<P><BR/></P>
</TD>
<TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
</TR>
<TR>
<TD COLSPAN="4" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
</TR>   
<TR>
<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG SRC="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
</TR>
<TR>
<TD VALIGN="top" BACKGROUND="" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
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
