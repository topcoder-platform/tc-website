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

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif">
  <TR>
    <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="statTextBig" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>

<jsp:include page="links.jsp" />

<BR CLEAR="all"/>         
               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
                  <TR><TD WIDTH="100%" VALIGN="middle" HEIGHT="100" CLASS="statText"><BR/>
                  <DIV ALIGN="center" CLASS="statText">Visit <A HREF="http://www.sun.com" CLASS="statText">Sun</A> for more about the following programs!</DIV><BR/>
<P CLASS="statTextBig">
Sun Student Technology Associate Representative (STAR) Program
</P>

<P>
The Sun Student Technology Associate Representative (STAR) program is
designed to empower university students to deliver cutting-edge
technology presentations, provided by the Sun Microsystems, Inc.
Technology Evangelism team, to their peers and gain valuable experience
and industry insight in the process.
</P>

<P>
If you fit into one of these categories, then the Sun STAR program is
for you!
<UL>
   <LI>* Second or third year Engineering or Computer Science student.</LI>
   <LI>* Self-motivated individual who is excited by and can excite their peers with Sun's technologies.</LI>
   <LI>* Fast learner interested in being on the cutting edge of the industry.</LI>
   <LI>* Comfortable and confident with public speaking.</LI>
</UL>
</P>

<P>
For more information, or to enroll in the program, go to:<BR/>
<A HREF="http://www.sun.com/developers/evangcentral/students/sunstar.html" TARGET="_blank" CLASS="statText">http://www.sun.com/developers/evangcentral/students/sunstar.html</A>
</P>
<HR/>
<P CLASS="statTextBig">
Java User Group (JUG) Ambassador Program
</P>

<P>
The Sun JUG Ambassador Program is designed to empower a Java Use Group
(JUG) member to deliver cutting-edge technology presentations at their
respective JUG meetings. By becoming a Sun JUG Ambassador or having one
in your JUG, you and your peers are kept up-to-date with the latest in
Java and other hot technologies. Technical content is current and
created by the Technology Evangelism Team for use by JUG Ambassadors
worldwide.
</P>

<P>
Plus, there are several other great incentives for becoming a Sun JUG
Ambassador, such as:
<UL>
   <LI>* Giveaways for your meetings.</LI>
   <LI>* Several awards, like a chance to win an all-expense paid trip to Java One!</LI>
   <LI>* And many more!</LI>
</UL>
</P>

<P>
To learn more, or to enroll, contact: <A HREF="http://www.jugambassador@sun.com" TARGET="_blank" CLASS="statText">jugambassador@sun.com</A>
</P>
<HR/>
<P CLASS="statTextBig">
Evangelism Central (EvangCentral) Web Site
</P>

<P>
Welcome to EvangCentral. This site is brought to you by the Technology
Evangelism team at Sun. We're the team that routinely engages the
software developers who make up the growing family of Network Age
devotees. Here you will find a list of our technical speakers, who
inform, encourage and motivate the developer community, along with links
to everything you need to know about Java <sup>TM</sup> technology, Jini <sup>TM</sup>
network technology, Solaris <sup>TM</sup> Operating Environment and XML. These
resources are intended to bind minds and spirits in pursuit of the best
software in the universe. The many evangelists at Sun welcome you.
</P>

<P>
To learn more please explore <A HREF="http://www.sun.com/developers/evangcentral/" TARGET="_blank" CLASS="statText">http://www.sun.com/developers/evangcentral/</A>
</P>

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
