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
            <TR>
              <TD VALIGN="middle" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 1 Problems</TD>
            </TR>
            <TR>
              <TD VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" CLASS="bodyText">
<IMG SRC="/i/pdf_iconw.gif" ALT="" WIDTH="31" HEIGHT="31" BORDER="0"/><BR/>
Level One (250) - <A HREF="/i/2002tccc/Betting.pdf" CLASS="bodyText">Betting</A> | <A HREF="/i/2002tccc/Betting_Anly.pdf" CLASS="bodyText">Betting Analysis</A> by chogyonim<BR/>
Level Two (500) - <A HREF="/i/2002tccc/Roadmap.pdf" CLASS="bodyText">Roadmap</A> | <A HREF="/i/2002tccc/Roadmap_Anly.pdf" CLASS="bodyText">Roadmap Analysis</A> by chogyonim<BR/>
Level Three (1000) - <A HREF="/i/2002tccc/Omaha.pdf" CLASS="bodyText">Omaha</A> | <A HREF="/i/2002tccc/Omaha_Anly.pdf" CLASS="bodyText">Omaha Analysis</A> by chogyonim<BR/><BR/>

          </TD>
            </TR>
            <TR>
              <TD VALIGN="middle"><A NAME="log"></A><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
            </TR>             
            <TR>
              <TD VALIGN="middle" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 1 Chrono Logs</TD>
            </TR>
            <TR>
              <TD VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" CLASS="bodyText">
              
8:00:00 AM - zoidal opens the Level One problem <BR/>
8:00:01 AM - derkuci opens the Level One problem <BR/>
8:00:01 AM - ambrose opens the Level One problem <BR/>
8:00:02 AM - DjinnKahn opens the Level One problem <BR/>
8:18:48 AM - DjinnKahn opens the Level Two problem <BR/>
8:19:21 AM - ambrose submits the Level One problem for 180.11 points <BR/>
8:19:29 AM - ambrose opens the Level Two problem <BR/>
8:20:53 AM - zoidal opens the Level Two problem <BR/>
8:25:52 AM - ambrose submits the Level Two problem for 476.36 points <BR/>
8:26:03 AM - ambrose opens the Level Three problem <BR/>
8:30:32 AM - derkuci submits the Level One problem for 140.90 points <BR/>
8:30:44 AM - derkuci opens the Level Two problem <BR/>
8:32:07 AM - DjinnKahn submits the Level Two problem for 416.07 points <BR/>
8:32:14 AM - DjinnKahn opens the Level Three problem <BR/>
8:35:04 AM - zoidal submits the Level Two problem for 407.77 points <BR/>
8:35:09 AM - zoidal opens the Level Three problem <BR/>
8:39:20 AM - derkuci submits the Level Two problem for 459.37 points<BR/> 
8:39:30 AM - derkuci opens the Level Three problem<BR/> 
9:04:41 AM - ambrose submits the Level Three problem for 491.61 points<BR/> 
9:09:24 AM - zoidal submits the Level One problem for 93.30 points<BR/> 
9:14:57 AM - zoidal submits the Level Three problem for 483.41 points<BR/><BR/>

<B>Challenges</B><BR/>
9:23:18 AM - DjinnKahn challenges ambrose on the Level Two problem successfully<BR/>

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
