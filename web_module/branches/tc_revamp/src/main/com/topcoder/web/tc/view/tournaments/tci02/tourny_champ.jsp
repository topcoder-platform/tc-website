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
          <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="1">
            <TR>
               <TD COLSPAN="4" VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">
               2002 TopCoder Invitational Champion
               <!--
               &#160;&#160;<xsl:value-of select="/TC/SCHEDULE/Advancers/Advancer/contest_name"/>
               &#160;<xsl:value-of select="/TC/SCHEDULE/Advancers/Advancer/round_name"/>-->

</TD>
               <TD COLSPAN="3" ALIGN="right" VALIGN="middle" HEIGHT="18" CLASS="statTextBig"></TD>
            </TR>
            <TR>
              <TD WIDTH="15%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">
                <A HREF="/tc?module=Static&d1=tournaments&d2=tci02&d3=round1a" CLASS="statTextBig">Round 1 A</A>
              </TD>
              <TD WIDTH="15%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">
                <A HREF="/tc?module=Static&d1=tournaments&d2=tci02&d3=round1b" CLASS="statTextBig">Round 1 B</A> 
              </TD>
              <TD WIDTH="15%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">
                <A HREF="/tc?module=Static&d1=tournaments&d2=tci02&d3=round2" CLASS="statTextBig">Round 2</A>
              </TD>
              <TD WIDTH="15%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">
                <A HREF="/tc?module=Static&d1=tournaments&d2=tci02&d3=round3" CLASS="statTextBig">Round 3</A>
              </TD>
              <TD WIDTH="15%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">
                <A HREF="/tc?module=Static&d1=tournaments&d2=tci02&d3=round4" CLASS="statTextBig">Round 4</A>
              </TD>
              <TD WIDTH="15%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">
                <A HREF="/tc?module=Static&d1=tournaments&d2=tci02&d3=tourny_semi" CLASS="statTextBig">Semi</A>
              </TD>  
              <TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">
                <A HREF="/tc?module=Static&d1=tournaments&d2=tci02&d3=tourny_champ" CLASS="statTextBig">Champ</A>
              </TD>                        
            </TR>
          </TABLE>
<BR/>
          <P class="statText">
            Congratulations to the TopCoder 2002 Invitational Champion.
          </P>

          <TABLE WIDTH="100%" BORDER="0" CELLPADDING="1" CELLSPACING="1" ALIGN="center">
            <TR>
              <TD ALIGN="center" VALIGN="middle" CLASS="statTextBig" HEIGHT="18" BGCOLOR="#666666">
              Handle
              </TD>
              <TD ALIGN="center" VALIGN="middle" CLASS="statTextBig" BGCOLOR="#666666">
              Points
              </TD>              
              <TD ALIGN="center" VALIGN="middle" CLASS="statTextBig" BGCOLOR="#666666">
              Tourney Seed
              </TD>
              <TD ALIGN="center" VALIGN="middle" CLASS="statTextBig" BGCOLOR="#666666">
              Room
              </TD>                
            </TR>
              <TR>
                <TD CLASS="statText">
                    <A HREF="/tc?module=MemberProfile&cr=270505" CLASS="coderTextRed">John Dethridge</A>
                  </TD>
                <TD CLASS="statText" ALIGN="right">766.53</TD>
                <TD CLASS="statText" ALIGN="center">1</TD>
                <TD CLASS="statText" ALIGN="center">Room 1</TD>
              </TR>
          </TABLE><BR/>
            <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="1">
              <TR><TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">&#160;&#160;<A HREF="#top" CLASS="statText">Back to top</A></TD></TR>
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
