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


<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#FFFFFF" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="statTextBig" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>

            <jsp:include page="links_summary.jsp" />
<BR CLEAR="all"/>         
          
          <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
            <!-- <TR>
              <TD COLSPAN="3" ALIGN="center"><BR/><A HREF="/index?t=tournaments&c=tourny_sched"><IMG SRC="/i/tournament/sun_banner_white.gif" ALT="" WIDTH="428" HEIGHT="84" VSPACE="5" BORDER="0"/></A></TD>
            </TR> -->          
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Reception Summary</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText">
<P><IMG SRC="/i/tournament/invit02/tourney_photo_recpt_1.jpg" ALT="" WIDTH="200" HEIGHT="435" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/>
<FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>The Reception: A view from Inside</B></FONT><BR/>
<I>16 coders arrive for the Invitational</I><BR/><BR/>
Thursday, November 21, 2002<BR/>
</P>
<!-- body content goes here -->
<P><B>A View from the Inside</B></P>

<P>In a scene reminiscent of Survivor, 16 finalists have gathered onsite to outwit, out-type and out-code each other and, in the process, walk away with $50,000.  With the Melbourne University vs. University of Waterloo rivalry alive on the international scene, and the question of whether Stanford University will continue its dominance on the minds of the Americans, the 2002 TopCoder Invitational is slated to be the most exciting onsite event yet.  Join me as the scene unfolds over the next two days...</P>

<P>2:30pm - With John Dethridge and ambrose in tow, I pulled in to the Mohegan Sun this afternoon in time to see the final touches put on the TopCoder competition stage.  Those of you not able to make it onsite to spectate should be sure to check out the pictures of the Arena - it's quite a sight.  ZorbaTHut and dmwright arrived earlier in the day via the red-eye flight from the west coast.  kyky and his wife were also on a red-eye flight from the west coast, but had the added task of navigating New York City rush hour traffic on their drive to Connecticut from Newark International Airport in New Jersey.</P>

<P>4:30pm - Saw the arrival of lars, SnapDragon, and DjinnKahn via van service from Bradley International Airport, while dgarthur, NDBronson, malpt, and radeye appeared onsite around 5:45pm.  Limousines announced the arrival of jms137 and reid from Boston.  obfuscator and moira, the lucky boyfriend/girlfriend pair competing head-to-head in Room 3 tomorrow, drove in together from Princeton, New Jersey.</P>

<P>6:00pm - With the exception of the late-comer, NDBronson, all competitors were in attendance for the start of the Welcome Reception and the words of welcome by Rob Hughes, President and COO of TopCoder, who stunned the crowd a bit with his joke that there would not actually be any prize money for this tournament.  :)  The members seemed anxious to meet each other in person and put a face to the virtual names they have been competing against for months.  Nervous tension filled the air as the competitors realized that there would be but a mere mesh screen separating them from the crowd of spectators.  As the evening came to an end and the competitors were given final instructions for the ensuing competition, one unspoken question remained on everyone's mind - who will ultimately survive this fierce competition and go home $50,000 richer?  Only time will tell...</P>

<P>Competitors, spectators, TC staff - sleep well.  Tomorrow the real fun begins!</P>


<!-- body content ends here -->
          </TD>
            </TR>
          </TABLE>
                      
          <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">            
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/><A NAME="photo"></A></TD>
            </TR>          
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Reception Photos</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center">
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/recpt_01.jpg');"><IMG SRC="/i/tournament/invit02/recpt_01_thum.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/recpt_02.jpg');"><IMG SRC="/i/tournament/invit02/recpt_02_thum.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/recpt_03.jpg');"><IMG SRC="/i/tournament/invit02/recpt_03_thum.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>             
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/recpt_04.jpg');"><IMG SRC="/i/tournament/invit02/recpt_04_thum.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/recpt_05.jpg');"><IMG SRC="/i/tournament/invit02/recpt_05_thum.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>             
              </TD>
            </TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
              <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" BGCOLOR="#000000">
	<TR>
		<TD><IMG SRC="/i/tournament/invit02/recpt_01.jpg" NAME="bigVersion" WIDTH="432" HEIGHT="288" BORDER="0"/></TD>
	</TR>
</TABLE>
              <BR/></TD>
            </TR>            
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center">
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/recpt_06.jpg');"><IMG SRC="/i/tournament/invit02/recpt_06_thum.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/recpt_07.jpg');"><IMG SRC="/i/tournament/invit02/recpt_07_thum.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>             
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/recpt_08.jpg');"><IMG SRC="/i/tournament/invit02/recpt_08_thum.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/recpt_09.jpg');"><IMG SRC="/i/tournament/invit02/recpt_09_thum.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>             
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/recpt_10.jpg');"><IMG SRC="/i/tournament/invit02/recpt_10_thum.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>              
              </TD>
            </TR>
          <!--  <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center">
<A HREF="Javascript:void changeImage('bigVersion', '/i/2002tccc/SFR101.jpg');"><IMG SRC="/i/2002tccc/SFR101_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/2002tccc/SFR102.jpg');"><IMG SRC="/i/2002tccc/SFR102_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/2002tccc/SFR103.jpg');"><IMG SRC="/i/2002tccc/SFR103_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>             
<A HREF="Javascript:void changeImage('bigVersion', '/i/2002tccc/SFR104.jpg');"><IMG SRC="/i/2002tccc/SFR104_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/2002tccc/SFR105.jpg');"><IMG SRC="/i/2002tccc/SFR105_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>             
              </TD>
            </TR> -->             
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
