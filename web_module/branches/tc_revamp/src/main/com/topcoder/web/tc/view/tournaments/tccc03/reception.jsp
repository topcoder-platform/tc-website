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
            <jsp:include page="links_summary.jsp" />

            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr><td height="1"><img src="/i/clear.gif" alt="" width="10" height="3" border="0"/></td></tr>
                <tr><td class="tourney_subnav"><strong>Reception Summary</strong></td></tr>
                <tr valign="top">
                    <td width="99%" class="bodyText">
                        <table border="0" cellspacing="5" cellpadding="0" width="200" align="right">
                            <tr valign="top"><td align="left"><img src="/i/tournament/tccc03/recep_main.jpg" alt="Tom Longo, VP of Membership" width="200" height="325" class="photoFrameBig" /></td></tr>
                            <tr valign="top"><td align="left" class="smallText">TopCoder VP of Membership, Tom Longo, addresses the crowd.</td></tr>
                        </table>
                                
                        <h2> The Sweet 16 </h2>
                        <p>by MaryBeth Biondi, <em>TopCoder Staff</em><br />
                        Thursday, April 3, 2003<br />
                        <a href="/tc?module=Static&d1=tournaments&d2=tccc03&d3=brackets">View current bracket</a></p>

                        <p>Competitors representing schools such as Duke, Michigan, Minnesota, Stanford, and UCLA 
                        will face off this weekend in an effort to be crowned champion of a collegiate tournament.  
                        Is it the culmination of the NCAA Men's Basketball tournament?  Nope, it's the Collegiate 
                        Challenge Finals - TopCoder style.</p>

                        <p>The field of over 500 college programmers has been narrowed to 16.  By Friday, it will be 
                        reduced again to just 4.  Saturday afternoon will see one coder presented with a very big 
                        check (in size and amount) and awarded the title of 2003 Sun Microsystems and TopCoder 
                        Collegiate Challenge Champion.</p>

                        <p>Tonight, however, we took the opportunity to relax and introduce ourselves to one 
                        another.  15 of the 16 competitors were on location at the time of the reception, and 
                        with 11 competitors new to the onsite finals, there were many introductions to be made. 
                        Fashionable red and black competition gear was handed out to all the participants - 
                        mandatory attire for the Final Four on Saturday.  The crowd broke up shortly after 
                        the rules were laid out, and the competitors are hoping to get a good night's sleep 
                        before a very big day of competition tomorrow.</p>  

                        <p>Here's the lineup:</p>
                        
                        <p><strong>Room 1, 10am:</strong><br />
                        evd<br />
                        StefanPochmann<br />
                        Yarin<br />
                        yike</p>
                        
                        <p><strong>Room 2, 1pm:</strong><br />
                        axch<br />
                        dmwright<br />
                        mathewsb<br />
                        niteneb</p>
                        
                        <p><strong>Room 3, 4pm:</strong><br />
                        ante<br />
                        bstanescu<br />
                        sjelkjd<br />
                        WhiteShadow</p>
                        
                        <p><strong>Room 4, 7pm:</strong><br />
                        dgarthur<br />
                        DjinnKahn<br />
                        jburnim<br />
                        O_O</p>

                    </td>
                </tr>
            </table>
                      
            <table border="0" cellspacing="0" cellpadding="3" width="100%">            
                <tr><td valign="middle"><img src="/i/clear.gif" alt="" width="1" height="3" border="0"/><a name="photo"></a></td></tr>          
            
                <tr><td class="tourney_subnav"><strong>Reception Photos</strong></td></tr>

                <tr>
                    <td class="bodyText" align="center">
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/recep_01.jpg');"><img src="/i/tournament/tccc03/recep_01_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/recep_02.jpg');"><img src="/i/tournament/tccc03/recep_02_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/recep_03.jpg');"><img src="/i/tournament/tccc03/recep_03_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                    </td>
                </tr>
                
                <tr>
                    <td class="bodyText" align="center"><img src="/i/tournament/tccc03/recep_01.jpg" name="bigVersion" width="432" height="288" class="photoFrameBig" /></td>
                </tr>            
                
                <tr>
                    <td class="bodyText" align="center">
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/recep_04.jpg');"><img src="/i/tournament/tccc03/recep_04_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/recep_05.jpg');"><img src="/i/tournament/tccc03/recep_05_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/recep_06.jpg');"><img src="/i/tournament/tccc03/recep_06_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                    </td>
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
