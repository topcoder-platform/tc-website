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

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF">
  <TR>
    <TD BGCOLOR="#FFFFFF" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="statTextBig" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><br>

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
<P><IMG SRC="/i/2002tccc/tourney_photo1.jpg" ALT="" WIDTH="200" HEIGHT="450" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/>
<FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>Opening Ceremonies</B></FONT><BR/>
<I>16 coders arrive for Collegiate Challenge</I><BR/><BR/>
Thursday, April 18, 2002<BR/>
By&#160;Adam Loss,<I>TopCoder Staff Writer</I><BR/>
</P>


<P>
The drinks were flowing, the hors d' oeuvres were consumed, the smiles were bright, and the pleasantries were exchanged, 
as the 16 semifinalists in the 2002 Sun Microsystems and TopCoder Collegiate Challenge enjoyed the welcome reception on 
<IMG SRC="/i/2002tccc/coder_quote1.gif" ALT="" WIDTH="140" HEIGHT="140" ALIGN="right" HSPACE="10" VSPACE="3" BORDER="0"/>
Thursday night.  Come Friday, however, the pressure of competition could make stomachs uneasy, and those smiles and 
pleasantries will most likely turn to game-faces and trash talking.
</P>

<P>
<A HREF="/index?t=tournaments&c=2002tccc_eyeon#ColinMacLeod" CLASS="bodyGeneric">ColinMacLeod</A>, the Southeast Regional champion, and 
<A HREF="/index?t=tournaments&c=2002tccc_favs#ZorbaTHut" CLASS="bodyGeneric">ZorbaTHut</A>, 
the Northeast Regional champion, were the first coders 
to arrive, and both are looking to make amends for lackluster performances as semifinalists in the 2001 TopCoder 
Invitational.  "We call ourselves members of the Zero Club," said 
<A HREF="/index?t=tournaments&c=2002tccc_eyeon#ColinMacLeod" CLASS="bodyGeneric">ColinMacLeod</A>, 
referring to the fact that they both 
failed to earn any points and finished last in their rooms at the Invitational.  "We can't do any worse," added 
<A HREF="/index?t=tournaments&c=2002tccc_favs#ZorbaTHut" CLASS="bodyGeneric">ZorbaTHut</A>.  
</P>

<P>
Two other returning semifinalists from the Invitational, 
<A HREF="/index?t=tournaments&c=2002tccc_favs#ambrose" CLASS="bodyGeneric">ambrose</A> and 
<A HREF="/index?t=tournaments&c=2002tccc_eyeon#milhouse" CLASS="bodyGeneric">milhouse</A>, are both battling physical ailments.  
"I've been sick this whole week and my contacts are bothering me," said 
<A HREF="/index?t=tournaments&c=2002tccc_favs#ambrose" CLASS="bodyGeneric">ambrose</A>.  "I'm mentally prepared, however, 
and I think the competition in my room is easier than in the Invitational."  
<A HREF="/index?t=tournaments&c=2002tccc_eyeon#milhouse" CLASS="bodyGeneric">milhouse</A> was a no-show at the reception 
and unavailable for comment.  The word on the street is that he is suffering from food poisoning...will he show?
</P>

<P>
First-time semifinalists <A HREF="/index?t=tournaments&c=2002tccc_eyeon#zoidal" CLASS="bodyGeneric">zoidal</A>, 
<A HREF="/index?t=tournaments&c=2002tccc_eyeon#Joe" CLASS="bodyGeneric">Joe</A> and <A HREF="/index?t=tournaments&c=2002tccc_favs#DjinnKahn" CLASS="bodyGeneric">DjinnKahn</A>, 
the MidWest Regional champion, were surprisingly confident in 
their chances to win.  "I know that a lot of people will be watching, but I'm just going to block them out and get 
into a zone," said <A HREF="/index?t=tournaments&c=2002tccc_eyeon#zoidal" CLASS="bodyGeneric">zoidal</A>.  
<A HREF="/index?t=tournaments&c=2002tccc_eyeon#Joe" CLASS="bodyGeneric">Joe</A> is feeling rather optimistic 
based on his success in the most recent Single Round Match.  
"I won Room 3 on Monday, so my confidence is definitely high."   While 
<A HREF="/index?t=tournaments&c=2002tccc_favs#DjinnKahn" CLASS="bodyGeneric">DjinnKahn</A> is as sanguine as 
<A HREF="/index?t=tournaments&c=2002tccc_eyeon#zoidal" CLASS="bodyGeneric">zoidal</A> and 
<A HREF="/index?t=tournaments&c=2002tccc_eyeon#Joe" CLASS="bodyGeneric">Joe</A>, 
he plans on being careful as well.  "My strategy for the elimination rounds was to be cautious, rather than rush 
and make mistakes, which is exactly what I plan to do on Friday."
</P>

<P>
Tournament favorite <A HREF="/index?t=tournaments&c=2002tccc_favs#dmwright" CLASS="bodyGeneric">dmwright</A> was 
one of the last participants to show up for the reception, perhaps trying to psych
 out his opponents.  Despite his tournament experience and success, however, he is still humbled by his competition.  
 "I'm sure everyone here has beaten me in a match before, so I have to make sure that I don't make the same mistakes 
 which have cost me in past tournaments."
</P>

          </TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/><A NAME="photo"></A></TD>
            </TR>          
            
          
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 1 Photos</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="javascript:open_window('/?t=pic&c=member&img=SFR101')"><IMG SRC="/i/2002tccc/SFR101_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&c=member&img=SFR102')"><IMG SRC="/i/2002tccc/SFR102_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&c=member&img=SFR103')"><IMG SRC="/i/2002tccc/SFR103_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>             
<A HREF="javascript:open_window('/?t=pic&c=member&img=SFR104')"><IMG SRC="/i/2002tccc/SFR104_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
              </TD>
            </TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="javascript:open_window('/?t=pic&c=member&img=SFR105')"><IMG SRC="/i/2002tccc/SFR105_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&c=member&img=SFR106')"><IMG SRC="/i/2002tccc/SFR106_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&c=member&img=SFR107')"><IMG SRC="/i/2002tccc/SFR107_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>             
<A HREF="javascript:open_window('/?t=pic&c=member&img=SFR108')"><IMG SRC="/i/2002tccc/SFR108_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
              </TD>
            </TR>            
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="javascript:open_window('/?t=pic&c=member&img=SFR109')"><IMG SRC="/i/2002tccc/SFR109_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&c=member&img=SFR110')"><IMG SRC="/i/2002tccc/SFR110_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&c=member&img=SFR111')"><IMG SRC="/i/2002tccc/SFR111_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
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
