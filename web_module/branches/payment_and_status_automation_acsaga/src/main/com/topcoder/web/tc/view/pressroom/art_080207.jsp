<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Press Room</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
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

<div align="right"><tc-webtag:forumLink forumID="516841" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">Fox TV: "Top Computer Programmers Compete"</span><br>
<span class="bodySubTitle"><a target="_blank" href="<tc-webtag:linkTracking link='/tc?module=Static&d1=media&d2=misc3x2&clip=foxchicago_20070802&title=Fox%20TV:%20Top%20Computer%20Programmers%20Compete' refer='/art_080207' />">view clip</a></span></p>
</div>
                        
<p>The Chicago Fox TV affiliate recently ran a story on TopCoder featuring an interview with <tc-webtag:handle coderId="144400" context="algorithm"/> and an (unidentified) TopCoder employee. Here's the description from their site:</p>
<div align="center"><a target="_blank" href="<tc-webtag:linkTracking link='/tc?module=Static&d1=media&d2=misc3x2&clip=foxchicago_20070802&title=Fox%20TV:%20Top%20Computer%20Programmers%20Compete' refer='/art_080207' />"><img src="/i/pressroom/art_080207-tomek.png" alt="tomek" /></a></div><br />
<p>"Some of America's smartest computer programmers are facing off in a new competition. Big money and big jobs are on the line. Michelle Gielan reports on the games, the college grad who won more than 100-thousand dollars and how it's all changing the American workforce."</p>
<p>Congratulations to <tc-webtag:handle coderId="144400" context="algorithm"/> on his appearance – and stay tuned for a full discussion of this report in the upcoming TC Channel Episode 4!</p>
<p>As for that unidentified TopCoder employee Fox interviewed -- any guesses? Eternal glory, and possibly some leftovers from the TopCoder prize closet, will go to the first member to identify him in the <tc-webtag:forumLink forumID="516841" message="forum" />.</p>
                        <p><br /><br /></p>
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
