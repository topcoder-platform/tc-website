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
                  <DIV CLASS="statTextBig">About the Prizes</DIV>
<div class="statText">
<P>
Prizes will be awarded to the sixty four (64) competitors who advance to Online Round #4. Prize money will be distributed as follows:
</P>

<table border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;
 border:none;mso-border-alt:solid windowtext .5pt;mso-padding-alt:0in 5.4pt 0in 5.4pt'>
<tr>
<td class="statText" width="216" valign="top" style='width:216.15pt;border:solid windowtext .5pt;
  background:#0C0C0C;padding:0in 5.4pt 0in 5.4pt'>
<b>Competitor(s)</b>
</td>
<td class="statText" width="215" valign="top" style='width:214.85pt;border:solid windowtext .5pt;
  border-left:none;mso-border-left-alt:solid windowtext .5pt;background:#0C0C0C;
  padding:0in 5.4pt 0in 5.4pt'>
<B>Prize Money</B>
</td>
</tr>
<tr>
<td width="216" valign="top" style='width:216.15pt;border:solid windowtext .5pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;
  padding:0in 5.4pt 0in 5.4pt'>
<p class="statText">48 competitors advancing to, and competing in, Online Round #4
  who do not advance to the Semifinal round</p>
</td>
<td width="215" valign="top" style='width:214.85pt;border-top:none;border-left:
  none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt'>
<p class="statText" align="right" style='text-align:right'>$500 each</p>
</td>
</tr>
<tr>
<td width="216" valign="top" style='width:216.15pt;border:solid windowtext .5pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;
  padding:0in 5.4pt 0in 5.4pt'>
<p class="statText">4<sup>th</sup> place finisher in each of the four (4) Semifinal
  rooms</p>
</td>
<td width="215" valign="top" style='width:214.85pt;border-top:none;border-left:
  none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt'>
<p class="statText" align="right" style='text-align:right'>$1,250 each</p>
</td>
</tr>
<tr>
<td width="216" valign="top" style='width:216.15pt;border:solid windowtext .5pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;
  padding:0in 5.4pt 0in 5.4pt'>
<p class="statText">3<sup>rd</sup> place finisher in each of the four (4) Semifinal
  rooms</p>
</td>
<td width="215" valign="top" style='width:214.85pt;border-top:none;border-left:
  none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt'>
<p class="statText" align="right" style='text-align:right'>$2,500 each</p>
</td>
</tr>
<tr>
<td width="216" valign="top" style='width:216.15pt;border:solid windowtext .5pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;
  padding:0in 5.4pt 0in 5.4pt'>
<p class="statText">2<sup>nd</sup> place finisher in each of the four (4) Semifinal
  rooms</p>
</td>
<td width="215" valign="top" style='width:214.85pt;border-top:none;border-left:
  none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt'>
<p class="statText" align="right" style='text-align:right'>$4,000 each</p>
</td>
</tr>
<tr>
<td width="216" valign="top" style='width:216.15pt;border:solid windowtext .5pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;
  padding:0in 5.4pt 0in 5.4pt'>
<p class="statText">4<sup>th</sup> place finisher in the Championship Round</p>
</td>
<td width="215" valign="top" style='width:214.85pt;border-top:none;border-left:
  none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt'>
<p class="statText" align="right" style='text-align:right'>$10,000</p>
</td>
</tr>
<tr>
<td width="216" valign="top" style='width:216.15pt;border:solid windowtext .5pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;
  padding:0in 5.4pt 0in 5.4pt'>
<p class="statText">3<sup>rd</sup> place finisher in the Championship Round</p>
</td>
<td width="215" valign="top" style='width:214.85pt;border-top:none;border-left:
  none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt'>
<p class="statText" align="right" style='text-align:right'>$15,000</p>
</td>
</tr>
<tr>
<td width="216" valign="top" style='width:216.15pt;border:solid windowtext .5pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;
  padding:0in 5.4pt 0in 5.4pt'>
<p class="statText">2<sup>nd</sup> place finisher in the Championship Round</p>
</td>
<td width="215" valign="top" style='width:214.85pt;border-top:none;border-left:
  none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt'>
<p class="statText" align="right" style='text-align:right'>$20,000</p>
</td>
</tr>
<tr>
<td class="statText" width="216" valign="top" style='width:216.15pt;border:solid windowtext .5pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;background:#8C8C8C;
  padding:0in 5.4pt 0in 5.4pt'>
<B>1<sup>st</sup> place finisher &#8211; Tournament Champion</B>
</td>
<td class="statText" width="215" valign="top" style='width:214.85pt;border-top:none;border-left:
  none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  background:#8C8C8C;padding:0in 5.4pt 0in 5.4pt'>
<p class="statText" align="right"><B align="right" style='text-align:right'>$50,000</B></p>
</td>
</tr>
</table>

<P>
All prizes will be awarded at the conclusion of the Championship Round.  All winners (with the exception of the 48 competitors who do not advance to the onsite rounds) must be present at the onsite rounds to receive their prizes. Any and all applicable taxes on prizes, including the cost of having a guest attend the onsite rounds, are the sole responsibility of the prizewinner.
</P>                  
</div>


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
