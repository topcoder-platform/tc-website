<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Press Room</title>

<jsp:include page="../script.jsp" />
<jsp:include page="../style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">


            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                    <jsp:include page="../page_title.jsp" >
                        <jsp:param name="image" value="press_room"/>
                        <jsp:param name="title" value="Article"/>
                    </jsp:include>
                        <div align="center">
						<div align="center"><IMG SRC="/i/pressroom/javaboutique.gif" ALT="Java Boutique" border="0"/></div><BR/>
						<p><span class="bodyTitle">Sun Microsystems Launches New Way<br> to Reach Java Community with TopCoder</span></p>
                        </div>
						The Developer Network at Sun unveils a first-of-its-kind effort to reach the top collegiate Java developers/programmers across the country. The tech leaders of tomorrow are an important yet elusive group and Sun is launching a new way in which to market to and recruit them. Sun will partner with TopCoder, a revolutionary company that hosts online programming competitions for developers of all career levels, to further establish the gateway to the top collegiate Java minds--a most valuable audience for Sun. As the only company that acknowledges, rates and rewards developers for their programming skills, TopCoder provides the means for companies like Sun to key into a specific niche tech community, otherwise lost in the traditional ways of marketing and recruitment--e.g. the overhyped noise of a trade show or other anonymous developer/IT sites and portals.<BR/><BR/>
						Sun Microsystems will be the exclusive sponsor for TopCoder's 2nd Annual Collegiate Challenge, starting in February 2002 and culminating April 19 - 20, 2002. 512 of the top-rated nationwide collegiate programmers will participate in a series of online elimination rounds for the chance to compete in person at the Sun and TopCoder Collegiate Challenge finals at Massachusetts Institute of Technology (MIT) in Cambridge, Massachusetts. The prize purse is $150,000.<BR/><BR/>
<p><br></p>
                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
