<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>

<style type="text/css">
.codeBox
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

<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180" id="onLeft">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="features"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="features"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>


<div class="linkBox">
    <A href="/tc?module=Static&d1=features&d2=archive">Archive</A><br>
    <A href="/tc?module=Static&d1=pressroom&d2=pr_102506">Press Release</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <tc-webtag:forumLink forumID="506159" message="Discuss this article" />
</div>

<span class="bigTitle">TopCoder visits Dalian Software Park</span>
<br>

<br clear="all">
Last week TopCoder's Yingying Wu hosted the company's first professional open house at Dalian Software Park, part of "the Silicon Valley of China."
<br><br>
First established in 1998, Dalian Software Park is convenient to a wide range of universities, research institutes, and both domestic and international firms. Dalian is one of China's 11 "National Software Industry Bases" and one of five "National Software Export Bases." Currently, more than 300 companies, including 32 Global 500 corporations, have offices in the park.
<br><br>
<div align="center">
    <div style="width:500px;">
        #1: During the Dalian Open House. The banner, provided by the school, reads: "Winner of Innovation and Technology Prize of China; TopCoder Vice President of Asia Operations Yingying Wu Lecture"
        <br><br><A href="/i/f/20061026/1.jpg"><img src="/i/f/20061026/1_thumb.jpg" alt="#1" /></A>
        <br><br><hr>
        #2: Students at the Dalian Open House.
        <br><br><A href="/i/f/20061026/2.jpg"><img src="/i/f/20061026/2_thumb.jpg" alt="#2" /></A>
        <br><br><hr>
        #3: A full lecture hall during the Dalian Open House.
        <br><br><A href="/i/f/20061026/3.jpg"><img src="/i/f/20061026/3_thumb.jpg" alt="#3" /></A>
        <br><br><hr>
        #4: Outside the Lecture Room at Dalian. Students were very happy about the food & refreshments.
        <br><br><A href="/i/f/20061026/4.jpg"><img src="/i/f/20061026/4_thumb.jpg" alt="#4" /></A>
        <br><br><hr>
        #5: Outside the Lecture Room at Dalian. The background picture here is an overview photo of Dalian Software Park.
        <br><br><A href="/i/f/20061026/5.jpg"><img src="/i/f/20061026/5_thumb.jpg" alt="#5" /></A>
        <br><br><hr>
        #6: A model of Dalian Software Park.
        <br><br><A href="/i/f/20061026/6.jpg"><img src="/i/f/20061026/6_thumb.jpg" alt="#6" /></A>
        <br><br><hr>
        #7: Yingying with the manager of Edoor, a local bookstore.
        <br><br><A href="/i/f/20061026/7.jpg"><img src="/i/f/20061026/7_thumb.jpg" alt="#7" /></A>
    </div>
</div>
<br><br>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170"id="onRight">
         <div id="onBottom">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="defaults"/>
            </jsp:include>
         </div>
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
