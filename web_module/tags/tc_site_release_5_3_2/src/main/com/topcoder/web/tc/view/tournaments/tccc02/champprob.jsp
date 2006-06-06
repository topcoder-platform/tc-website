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
              <TD VALIGN="middle" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Championship Problems</TD>
            </TR>
            <TR>
              <TD VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" CLASS="bodyText">
<IMG SRC="/i/pdf_iconw.gif" ALT="" WIDTH="31" HEIGHT="31" BORDER="0"/><BR/>
Level One (250) - <A HREF="/i/2002tccc/MuseumGuard_250.pdf" CLASS="bodyText">MuseumGuard</A> by jay_peg<BR/>
Level Two (500) - <A HREF="/i/2002tccc/NumList_500.pdf" CLASS="bodyText">NumList</A> | <A HREF="/i/2002tccc/NumList_Anly.pdf" CLASS="bodyText">NumList Analysis</A> by alexcchan<BR/>
Level Three (1000) - <A HREF="/i/2002tccc/PlanetX_1000.pdf" CLASS="bodyText">PlanetX</A> | <A HREF="/i/2002tccc/PlanetX_Anly.pdf" CLASS="bodyText">PlanetX Analysis</A> by NDBronson<BR/><BR/>

          </TD>
            </TR>
            <TR>
              <TD VALIGN="middle"><A NAME="log"></A><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
            </TR>             
            <TR>
              <TD VALIGN="middle" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Championship Chrono Logs</TD>
            </TR>
            <TR>
              <TD VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" CLASS="bodyText">
1:00:02 PM - derkuci opens the Level One problem <BR/>
1:00:03 PM - Joe opens the Level One problem <BR/>
1:00:04 PM - malpt opens the Level One problem <BR/>
1:00:20 PM - dmwright opens the Level Two problem <BR/>
1:08:54 PM - derkuci submits the Level One problem for 228.56 points <BR/>
1:09:01 PM - derkuci opens the Level Two problem <BR/>
1:09:04 PM - malpt submits the Level One problem for 227.96 points <BR/>
1:09:43 PM - malpt opens the Level Two problem <BR/>
1:10:09 PM - Joe submits the Level One problem for 223.09 points <BR/>
1:10:17 PM - Joe opens the Level Two problem <BR/>
1:27:53 PM - derkuci opens the Level Three problem <BR/>
1:32:19 PM - dmwright submits the Level Two problem for 274.20 points <BR/>
1:32:34 PM - dmwright opens the Level Three problem <BR/>
1:38:16 PM - malpt opens the Level Three problem <BR/>
1:50:15 PM - dmwright opens the Level One problem <BR/>
2:01:14 PM - dmwright submits the Level One problem for 219.05 points <BR/>
2:03:13 PM - Joe opens the Level Three problem <BR/><BR/>

<B>Challenges</B><BR/>
2:28:11 PM - derkuci challenges Joe on the Level One problem successfully<BR/> 

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
