<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Review Documentation</title>

<jsp:include page="../../../../script.jsp" />

</head>

<body>

<jsp:include page="../../../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="level1" value="development"/>
                <jsp:param name="level2" value="components"/>
                <jsp:param name="level3" value="samples"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" WIDTH="100%">
        <img src="/i/clear.gif" alt="" width="1" height="10" border="0" /><br/>
        <jsp:include page="../../body_top.jsp" >
           <jsp:param name="image" value="development"/>
           <jsp:param name="image1" value="white"/>
           <jsp:param name="title" value="Components"/>
        </jsp:include>

            <p><h2 align="left">Development Review Scoring</h2></p>

<p class="bodyText">The intent of TopCoder's Review Scoring system is to allow for competitors to exceed the requirements as detailed in the component specification.  To achieve this, certain questions should be scored on a "3-based" scale.  This means that the competitor should be given a score of 3 if they meet the requirements.  The competitor would be given a 4 only if they exceed the requirements for a particular question.  In contrast, a "4-based" scoring system means that the competitor would be given a 4 unless there is a flaw.</p>

<p class="bodyText">There are at least 2 flaws with a 4-based system that the 3-based system attempts to solve.</p>
<ol>
<li>We would like to encourage competitors to do excellent work.  In other words, we would like competitors to exceed the requirements.  With a 3-based system, we can do that by allowing a competitor to achieve a higher score if they do an exceptional job.</li>
<li>Anything less than the meeting the requirements should not be rewarded.  Requirements should be considered the lower limit in quality.  Software that does not meet its requirements is not something TopCoder should be selling.  Accepting it is likely to cost us more than not.</li>
</ol>

<p class="bodyText">Not all questions leave room for a competitor to excel on.  Below is a list of those questions where the developer should receive a 4 when the requirement is met (4-based scoring).  All other questions should be scored such that if the requirements are simply met, the competitor gets a 3, and if the requirements are exceeded, then the competitor may be given a 4.</p>

<p class="bodyText">For 3-based questions, the reviewer must include comments when giving a question a score of 1, 2 and 4.  1 and 2 should be obvious, the comments should indicate what is wrong.  For a score of 4 the comment should explain what the competitor did to exceed the requirements.  For a score of 3, the reviewer is not required to make significant comments other than "yes" or "ok", but an appropriate comment would be to indicate what the competitor could have done to achieve a 4.</p>

<p><center><span class="bodySubtitle">4-based Questions</span></center></p>
<p class="bodyText"><span class="bodySubtitle">Component Development</span><br/>

<ul>
<li>"The implementation has not modified the public API as defined in the design.<br/>
    This includes no additional public classes, methods or variables."</li>
</ul>

<p class="bodyText"><span class="bodySubtitle">Class Definition</span><br/>

<ul>
<li>All classes are implemented as defined in the design documents. This not only includes technical details such as modifiers and types, but also naming conventions.</li>
<li>"Defined classes are implemented.<br/>
If not, list additional or missing classes. Points should be deducted for adding classes that affect the public API."</li>
</ul>

<p class="bodyText"><span class="bodySubtitle">Variable Definition</span><br/>

<ul>
<li>All variables are implemented as defined in the design documents. This not only includes technical details such as modifiers and types, but also naming conventions.</li>
</ul>

<p class="bodyText"><span class="bodySubtitle">Method Definition</span><br/>

<ul>
<li>All methods are implemented as defined in the design documents. This not only includes technical details such as modifiers, types, arguments and exceptions, but also naming conventions.</li>
</ul>

<p class="bodyText"><span class="bodySubtitle">Code Review</span><br/>

<ul>
<li>The object types defined in the implementation are the best choice for the intended usage. For example, using a Vector vs. an array.</li>
</ul>

<p class="bodyText"><span class="bodySubtitle">Test Cases</span><br/>

<ul>
<li>Where applicable, Unit Test Cases properly make use of setup and teardown methods to configure the test environment.</li>
<li>Where applicable, files used in Unit Test Cases exist in the /test_files directory.</li>
<li>Where applicable, Unit Test cases do not leave temporary files on the file system after testing is complete.</li>
</ul>

         <p class="bodyText"><br/></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="180">
            <jsp:include page="../right.jsp"/>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../../../foot.jsp" />

</body>

</html>
