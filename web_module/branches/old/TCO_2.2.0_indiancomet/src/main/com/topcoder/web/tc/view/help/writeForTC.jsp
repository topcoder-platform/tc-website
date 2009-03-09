<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder - Educational Content</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
<style type="text/css">
    .code
{
  width: 600;
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
            <jsp:param name="node" value="write_for_tc"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="educational"/>
<jsp:param name="title" value="Write for TopCoder"/>
</jsp:include>

<span class="title">Write for TopCoder</span>
<br /><br />
By writing for TopCoder, you can demonstrate your skills and share your hard-earned knowledge with other members - and get paid for it. TopCoder is currently looking for content in the following areas:
<br /><br />
<span class="bodySubtitle">Feature Articles</span><br/>
Features are generally the shortest and least technical of TopCoder articles, ranging from "tips and tricks" articles to interviews with well-known members. Whatever its content, the focus of a feature article should be engaging members and building a sense of community. 
<br /><br />
Article length:    750 - 1,500 words<br />
Payment:     $200<br />
&gt; <a href="/tc?module=Static&amp;d1=features&amp;d2=030205">see an example</a>
<br /><br />
Sample topics:
<ul>
<li>Interview with Top 10-ranked members</li>
<li>Profiles of groups of members from a particular region or university</li>
<li>Tips and tricks for new members</li>
<li>Understanding the role of testing</li>
</ul>

<span class="bodySubtitle">Educational Content</span><br/>
Members compete at TopCoder not only for the sake of competition but to learn, and to hone their skills for use outside TopCoder - at their jobs and in their studies. With our educational content, we want to provide information and examples that helps members become better coders.
<br /><br />
Article length:    1,500 - 5,000 words<br />
Payment:     $100<br />
&gt; <a href="/tc?module=Static&amp;d1=tutorials&amp;d2=math_for_topcoders">see an example</a>
<br /><br />
Sample topics:
<ul>
<li>Design for reuse: advantages and trade-offs</li>
<li>How to identify (and find) the right component for the job</li>
<li>How to identify code that could be reusable</li>
<li>Understanding complex components: Components built out of other components</li>
<li>Incorporating databases into component-based development</li>
<li>How to write a proper stress test</li>
<li>Multi-threaded testing</li>
<li>Best practices for peer review / code review</li>
<li>Review of new/emerging technologies and platforms</li>
</ul>

<span class="bodySubtitle">Component Tutorials</span><br/>
These tutorials provide real-world examples of how components can be used, with interactive, hands-on demonstrations. Examples should be drawn from TopCoder's component catalog; review the list of most-downloaded components for ideas.
<br /><br />
Article length:    1,000 - 5,000 words<br />
Payment:     $450<br />
&gt; <a href="/tc?module=Static&amp;d1=tutorials&amp;d2=xmiDocumenter">see an example</a>
<br /><br />

<span class="bodySubtitle">Requirements</span><br/>
The article must contain original content written by the submitter of the article. A member photo is also required to accompany the article. If you have not already submitted a photo, please login and follow the instructions on your member home page.
<br /><br />

<span class="bodySubtitle">Submit your article:</span><br/>
If you've created an article that you would like published on <a href="/">www.topcoder.com</a>, send your file (.doc, .txt, or .html) to <a href="mailto:editorial@topcoder.com">editorial@topcoder.com</a>
<br /><br />

<span class="bodySubtitle">Eligibility Criteria</span><br/>
To write for TopCoder, you must be a TopCoder member, at least 18 years of age, and be either (i) a citizen or lawful permanent resident of the U.S. (including the U.S. territories of Guam, Puerto Rico, and the U.S. Virgin Islands); (ii) currently residing in the U.S. with valid employment authorization; or (iii) a non-U.S. citizen writing within your country of residence. 


        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="defaults"/>
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
