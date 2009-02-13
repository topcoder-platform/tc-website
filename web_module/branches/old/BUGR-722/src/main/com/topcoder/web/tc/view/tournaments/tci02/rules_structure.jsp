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
<DIV CLASS="statTextBig">Online Elimination Rounds</DIV><BR/>
<P>Everyone who competes in an online round must log on to the TopCoder Competition Arena no later than ten minutes prior to the start of the online round. 
(See below for competition dates and times.) TopCoder members from around the world may be participating in these rounds, but all start times will be 
communicated as Eastern Time, so contestants in different time zones must adjust accordingly. If a coder does not participate, for any reason, in an online 
round that they have advanced to, it will be treated as an automatic loss in that round of competition. 
</P><P>
All competitors who have qualified for an online round will be assigned to a specific room. TopCoder will determine all room assignments prior to the start 
of each online round in a manner such that the average competitor rating (as of October 1st) for each room will be similar. The dates and times of the online 
rounds of competition are as follows: 
</P><TABLE STYLE="border-collapse:collapse;  border:none;mso-border-alt:solid windowtext .5pt;mso-padding-alt:0in 5.4pt 0in 5.4pt" CELLPADDING="0" CELLSPACING="0" BORDER="1"><TR><TD STYLE="width:216.15pt;border:solid windowtext .5pt;   background:#0C0C0C;padding:0in 5.4pt 0in 5.4pt" VALIGN="top" WIDTH="216"><P CLASS="statText"><B>Round of Competition</B></P></TD><TD STYLE="width:214.85pt;border:solid windowtext .5pt;   border-left:none;mso-border-left-alt:solid windowtext .5pt;background:#0C0C0C;   padding:0in 5.4pt 0in 5.4pt" VALIGN="top" WIDTH="215"><P CLASS="statText"><B>Date and Time *</B></P></TD></TR><TR><TD STYLE="width:431.0pt;border:solid windowtext .5pt;   border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;   padding:0in 5.4pt 0in 5.4pt" VALIGN="top" COLSPAN="2" WIDTH="431"></TD></TR><TR><TD STYLE="width:216.15pt;border:solid windowtext .5pt;   border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;   padding:0in 5.4pt 0in 5.4pt" VALIGN="top" WIDTH="216" CLASS="statText"><UL TYPE="disc"><LI>Online Round#1</LI></UL><P CLASS="statText"><BR/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;- Part 1</P><P CLASS="statText"><BR/><BR/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;- Part 2<BR/><BR/><BR/></P><UL TYPE="disc"><LI>Online Round #2</LI></UL><UL TYPE="disc"><LI>Online Round #3</LI></UL><UL TYPE="disc"><LI>Online Round #4</LI></UL></TD><TD STYLE="width:214.85pt;border-top:none;border-left:   none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;   mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;   background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt" VALIGN="top" WIDTH="215" CLASS="statText"><BR/><BR/>
Tuesday, October 8<SUP>th</SUP><BR/>
Registration:&#160;7:30 PM - 9:25 PM<BR/>
START:&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;9:30 PM
<P CLASS="statText">Thursday, October 10<SUP>th</SUP><BR/>
Registration:&#160;7:30 PM - 9:25 PM<BR/>
START:&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;9:30 PM </P><P CLASS="statText">Wednesday, October 16<SUP>th</SUP> at 9:30 PM</P><P CLASS="statText">Wednesday, October 23<SUP>rd</SUP> at 9:30 PM</P><P CLASS="statText">Wednesday, October 30<SUP>th</SUP> at 9:30 PM</P></TD></TR><TR><TD STYLE="width:431.0pt;border:solid windowtext .5pt;   border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;   padding:0in 5.4pt 0in 5.4pt" VALIGN="top" COLSPAN="2" WIDTH="431"><P CLASS="statText">*NOTE:&#160; In the event
that a round must be cancelled for any reason, the "raindate" for
the cancelled match will be the following day at the same time.</P></TD></TR></TABLE><BR/>
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
