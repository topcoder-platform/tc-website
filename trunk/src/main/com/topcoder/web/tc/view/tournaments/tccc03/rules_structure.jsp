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
                                <td class="statText">
                        <strong>Round Structure</strong><br/>
                        Each online and onsite round of competition consists of three phases: the Coding Phase, Challenge Phase, and System Testing Phase.  (Note:  the format of these competition rounds is similar to the format of the Single Round Matches.)<br/><ul>
                        <li>The Coding Phase is a timed event where all contestants are presented with the same three questions representing three levels of complexity and, accordingly, three levels 
                        of point earnings potential. Points for a problem are awarded upon submission of any solution that successfully compiles and are based on the total time that the problem was 
                        open before it was submitted.</li><br/>
                        <li>The Challenge Phase is a timed event wherein each competitor has a chance to challenge the functionality of other competitors' code.  A successful challenge will result in 
                        a loss of the original problem submission points by the defendant, and a 50 point reward for the challenger; unsuccessful challengers will incur a point reduction of 50 points as 
                        a penalty, applied against their total score in that round of competition. </li><br/>
                        <li>The System Testing Phase is applied to all submitted code that has not already been successfully challenged.  If TopCoder finds code that is flawed, the author of that code 
                        submission will lose all of the points that were originally earned for that code submission. The automated tester will apply a set of inputs, expecting the output from the code 
                        submission to be correct.  If the output from a coder's submission does not match the expected output, the submission is considered flawed.  The same set of input/output test 
                        cases will be applied to all code submissions for a given problem.  All successful challenges from the Challenge Phase will be converted into sets of inputs for the System Testing 
                        Phase.</li></ul>
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
