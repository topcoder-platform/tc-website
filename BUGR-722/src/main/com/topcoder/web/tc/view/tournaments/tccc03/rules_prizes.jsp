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

            <table border="0" cellspacing="0" cellpadding="0" class="tourney_bkgd" width="100%">
                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                    <td width="100%"><img src="/i/clear.gif" alt="" width="240" height="10" border="0"/><br/>
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td valign="middle" class="statText">
                                    <p>Prizes will be awarded to a total of 200 competitors.  Prize money will be distributed as follows:<br /><br /></p>
                                </td>
                            </tr>
                        </table>

                        <div align="center">
                        <table width="100%" border="0" cellpadding="6" cellspacing="1">
                            <tr>
                            <td width="50%" align="center" valign="middle" height="21" bgcolor="#000000" class="statText">Competitor(s)</td>
                            <td width="50%" align="center" valign="middle" height="21" bgcolor="#000000" class="statText">Prize Money</td>
                        </tr>
                        <tr>
                            <td valign="top" bgcolor="#666666" class="statText">200 advancers from Regional Quarterfinal Round who compete in Regional Semifinal Round</td>
                            <td valign="top" bgcolor="#666666" class="statText">$50 each</td>
                        </tr>                        
                        <tr>
                            <td valign="top" bgcolor="#666666" class="statText">50 advancers from Regional Semifinal Round who compete in Regional Championship Round</td>
                            <td valign="top" bgcolor="#666666" class="statText">$50 each</td>
                        </tr>
                        <tr>
                            <td valign="top" bgcolor="#666666" class="statText">5 Regional Champions</td>
                            <td valign="top" bgcolor="#666666" class="statText">$600 each</td>
                        </tr>
                        <tr>
                            <td valign="top" bgcolor="#666666" class="statText">12 competitors who compete in the Semifinal Round who do not advance to the Championship Round</td>
                            <td valign="top" bgcolor="#666666" class="statText">$1,000 each</td>
                        </tr>
                        <tr>
                            <td valign="top" bgcolor="#666666" class="statText">4th place finisher in the Championship Round</td>
                            <td valign="top" bgcolor="#666666" class="statText">$2,500</td>
                        </tr>
                        <tr>
                            <td valign="top" bgcolor="#666666" class="statText">3rd place finisher in the Championship Round</td>
                            <td valign="top" bgcolor="#666666" class="statText">$5,000</td>
                        </tr>                                                                                                
                        <tr>
                            <td valign="top" bgcolor="#666666" class="statText">2nd place finisher in the Championship Round</td>
                            <td valign="top" bgcolor="#666666" class="statText">$15,000</td>
                        </tr>
                        <tr>
                            <td valign="top" bgcolor="#666666" class="statText"><b>1st place finisher - Tournament Champion</b></td>
                            <td valign="top" bgcolor="#666666" class="statText"><b>$50,000</b></td>
                            </tr>                                                                                                        
                        </table>
                        </div>
                        
                        <table border="0" cellspacing="0" cellpadding="0" width="100%">
                            <tr>
                                <td class="statText"><br />
                                    ** All prizes will be awarded at the conclusion of the final onsite round of competition. Any and all 
                                    applicable taxes on prizes including bringing a guest to the onsite rounds are the sole 
                                    responsibility of the prizewinner.
                                </td>
                            </tr>
                        </table>
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
