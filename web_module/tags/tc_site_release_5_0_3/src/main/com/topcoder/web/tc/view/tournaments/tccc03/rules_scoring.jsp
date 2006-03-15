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


            <jsp:include page="links.jsp" />
            <jsp:include page="links_rules.jsp" />

               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
                  <TR><TD VALIGN="middle" COLSPAN="3" HEIGHT="16" CLASS="statText"><BR/>
                  <DIV CLASS="statTextBig">Scoring and Advancing during Online Regional Rounds</DIV><BR/>
                  After each round of competition, the winners from each of the assigned rooms will be identified and will advance to the next online round. Coder advancement in all rounds is determined by comparing the total point values from all three phases of the round  
                  &#40; see <A HREF="/tc?module=Static&d1=tournaments&d2=tccc03&d3=rules_structure" CLASS="statText">Competition Round Structure</A> &#41; for each coder. In order to advance, a coder must finish each round with a greater-than-zero point total. The structure of the online rounds is as follows:<BR/><BR/>
                  
                  <B>Online Regional Round One</B><UL>
                  <LI>Up to 200 coders per region (totaling 1,000) will compete - A total of 500 competitors, comprised of 20 room winners and 80 wildcard competitors (based on total points across all rooms) per region, will advance to the next round.</LI><BR/>
                  </UL>
                                    
                  <B>Online Regional Quarterfinal</B><UL>
                  <LI>Up to 100 coders per region (totaling 500) will compete - A total of 200 competitors, comprised of 10 room winners and 30 wildcard competitors per region, will advance to the next round.</LI><BR/>
                  <LI>Each of the 200 advancers will win $50 each</LI><BR/>               
                  </UL>
                  
                  <B>Online Regional Semifinal</B><UL>
                  <LI>40 coders per region (totaling 200) will compete - A total of 50 competitors, comprised of 4 room winners and 6 wildcard competitors per region, will advance to the next round.</LI><BR/>
                  <LI>Each of the 50 advancers will win $50 each </LI><BR/>
                  </UL>
                  
                  <B>Online Regional Final</B><UL>
                  <LI>10 coders per region (totaling 50) will compete</LI><BR/>
                  <LI>The winner of each of the five (5) regions will be crowned that Regional Champion, and will win $600 each.  Each Regional Champion will automatically advance to the onsite Semifinal Round. (NOTE: All Regional Champions must participate in the onsite Semifinal Round to receive his / her prize.)</LI><BR/>
                  <LI>The remaining eleven (11) spots in the onsite Semifinal and Championship Rounds will be handed out based on total points across all rooms (regardless of region).</LI><BR/>
                  </UL><BR/>
                  In order to advance, a coder must finish with a greater-than-zero point total. If a room has no contestants who have more than zero points, the automatic berth for that room will be placed into the regional wildcard pool. Any tie in points for an automatic berth in a room or for the last spot of the wildcard pool will be resolved in the following manner: <UL>
                  <LI>Total points acquired (higher is better) during the rounds of the tournament in which all of the tied participants were presented with the same set of problems</LI><BR/>
                  <LI>If a tie still remains, then by rating (higher is better) as of February 14, 2003</LI>
                  </UL><BR/>
                  If a tie still remains, all tied coders will advance to the next round.<BR/><BR/>
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
