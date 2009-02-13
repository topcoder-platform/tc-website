<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<style type="text/css">
.code
{
  width: 500;
  padding: 10px;
  margin: 20px;
  color: #333;
  font-size: 11px;
  font-weight: normal;
  line-height: 14px;
  background-color: #EEEEEE;
  border: 1px solid #999;
}

</style>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="features"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">

<jsp:include page="/page_title.jsp" >
   <jsp:param name="image" value="features"/>
   <jsp:param name="title" value="Topics"/>
</jsp:include>

<DIV ALIGN="center">
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="10" WIDTH="534">
   <TR>
      <TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">

         <DIV ALIGN="center">
         <IMG SRC="/i/f/feature_title.gif" ALT="Interested in getting published on TopCoder?" WIDTH="530" HEIGHT="50" BORDER="0" />
         <IMG SRC="/i/f/pen_paper.jpg" ALT="Feature Article" WIDTH="300" HEIGHT="222" BORDER="0" /><br/>
         </DIV>

         <P CLASS="bodyTitle">Article Requirements:</P>

         <P>Feature articles should range between 1000-2000 words. The article must contain original content written by the submitter of the article.  A member photo is also required to accompany the feature. If you have not already submitted a photo, please login and follow the instructions on your member home page.</P>

         <P>The more relevant an article submission is to TopCoder members, software development, or software/algorithm education - the likelier it is that the article will be accepted for publication.</P>

         <P CLASS="bodyTitle">Submit your Feature Article:</P>

         <P>If you've created a feature article that you would like published on <A HREF="http://www.topcoder.com/">www.topcoder.com</A>, send your file (.doc, .txt, or .html) to <A HREF="mailto:editorial@topcoder.com?subject=Feature Article Submission?" CLASS="bodyGeneric">editorial@topcoder.com</A></P>

         <P CLASS="bodyTitle">Eligibility Criteria</P>

         <P>To write a feature for TopCoder, you must be a TopCoder member, at least 18 years of age, and be either (i) a citizen or lawful permanent resident of the U.S. (including the U.S. territories of Guam, Puerto Rico, and the U.S. Virgin Islands); (ii) currently residing in the U.S. with valid employment authorization; or (iii) a non-U.S. citizen writing within your country of residence. </P>

         <P CLASS="bodyTitle">Payment:</P>

         <P>TopCoder will pay &#36;150 for each article that is accepted for publication on TopCoder's web site.  Writers receive payment on a monthly basis after TopCoder approves the article for publication.</P>

         <P><BR/></P>
      </TD>
   </TR>
</TABLE>
</DIV>
        <p><br/></p>
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