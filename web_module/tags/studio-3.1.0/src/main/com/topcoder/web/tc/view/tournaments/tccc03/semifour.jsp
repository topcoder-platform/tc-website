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

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="100%" class="tourney_subnav"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="0" class="tourney_bkgd" width="100%">
                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                    <td width="100%"><img src="/i/clear.gif" alt="" width="240" height="10" border="0"/><br/>

                        <p class="statText">
                        The following competitors have advanced from <xsl:value-of select="/TC/TOURNAMENTS/Advancers/Advancer/round_name"/> to the next round.
                        </p>

                        <table width="100%" border="0" cellpadding="3" cellspacing="1">
                          <tr>
                            <td align="left" class="tourney_subhead1" width="34%">Handle</td>
                            <td align="right" class="tourney_subhead1" width="33%">Points</td>
                            <td align="right" class="tourney_subhead1" width="33%">Tourney Seed</td>
                          </tr>
                         
                            <tr>
                              <td class="statText"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=269554">Yarin</a></td>
                              <td class="statText" align="right">508.19</td>
                              <td class="statText" align="right">2</td>
                            </tr>
                            
                            <tr>
                              <td class="statText"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=114853">dmwright</a></td>
                              <td class="statText" align="right">497.60</td>
                              <td class="statText" align="right">1</td>
                            </tr>
                            
                            <tr>
                              <td class="statText"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=107835">sjelkjd</a></td>
                              <td class="statText" align="right">1548.59</td>
                              <td class="statText" align="right">11</td>
                            </tr>
                            
                            <tr>
                              <td class="statText"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=262936">dgarthur</a></td>
                              <td class="statText" align="right">1233.52</td>
                              <td class="statText" align="right">1</td>
                            </tr>
                            
                        </table><br/>


                        <p><br/></p>
                    </td>
                    <td valign="top" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>
            </table>

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
