<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>TopCoder Studio</title>

<jsp:include page="style.jsp">
    <jsp:param name="key" value="tc_creative_forums"/>
</jsp:include>
</head>

<body>

<jsp:include page="top.jsp">
    <jsp:param name="section" value="default"/>
</jsp:include>

<jsp:include page="left.jsp">
    <jsp:param name="node" value="forums"/>
</jsp:include>

<div class="contentOuter">
   <div class="contentInner">
<table cellpadding="0" cellspacing="0" class="rtbcTable">
<tr>
   <td class="categoriesBox" style="padding-right: 20px;">
      <jsp:include page="categoriesHeader.jsp" />
   </td>
   <td nowrap="nowrap" valign="top" width="100%" style="padding-right: 20px;">
      <jsp:include page="searchHeader.jsp" />
    </td>
    <td align="right" nowrap="nowrap" valign="top">
        <A href="?module=History" class="rtbcLink">My Post History</A>&nbsp;&nbsp;|&nbsp;&nbsp;<A href="?module=Watches" class="rtbcLink">My Watches</A>&nbsp;&nbsp;|&nbsp;&nbsp;<A href="?module=Settings" class="rtbcLink">User Settings</A><br/>
    </td>
</tr>
<tr>
   <td colspan="3" style="padding-bottom:3px;"><strong>
      <A href="?module=Category&categoryID=1&mc=84597" class="rtbcLink">Forums</A> >
      <A href="?module=Category&categoryID=13&mc=68059" class="rtbcLink">Round Tables</A> >
      <A href="?module=ThreadList&forumID=244237&mc=10360" class="rtbcLink">General Discussion</A> >
      <A href="http://forums.topcoder.com/?module=Thread&threadID=509704&mc=63">1000 post party!</A> >
      Re: 1000 post party!
      </strong>
   </td>
</tr>
</table>

<br><div id="Options">Allowed tags: &lt;annot&gt;, &lt;a&gt;, &lt;abbr&gt;, &lt;acronym&gt;, &lt;blockquote&gt;, &lt;b&gt;, &lt;br&gt;, &lt;em&gt;, &lt;font&gt;, &lt;i&gt;, &lt;img&gt;, &lt;li&gt;, &lt;ol&gt;, &lt;p&gt;, &lt;pre&gt;, &lt;s&gt;, &lt;span&gt;, &lt;strike&gt;, &lt;sub&gt;, &lt;sup&gt;, &lt;strong&gt;, &lt;table&gt;, &lt;td&gt;, &lt;tr&gt;, &lt;tt&gt;, &lt;u&gt;, &lt;ul&gt;. Allowed attributes: a:href; img:src,height,width; span:style; font:color,size,style. Syntax highlighting is applied to text within [code][/code], [cpp][/cpp], [java][/java], [c#][/c#], and [vb][/vb] blocks. Usernames within [handle][/handle] blocks are converted into links.</div>

            <input name="module" type="hidden">
<input name="forumID" type="hidden">
<input value="530648" name="messageID" type="hidden">
<input value="Reply" name="mode" type="hidden">

<h3>Message Preview</h3>
<table class="rtTable" cellpadding="0" cellspacing="0">
   <tbody><tr>
        <td class="rtHeader" colspan="2">
            <div valign="top" style="float: right; padding-left: 5px; white-space: nowrap;">
               <a name="-1">Aug 3, 2006 at 11:36 AM EDT</a>
            </div>
            Re: 1000 post party!
         
               (response to <a href="?module=Message&amp;messageID=552539" class="rtbcLink">post</a> by <a href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10627428" class="coderText">fvillaf</a>)
         
        </td>

    </tr>
   <tr>
   <td class="rtPosterCell" rowspan="2"><div class="rtPosterSpacer">
   
      <img src="/i/m/ntrefz_big.jpg" class="rtPhoto" border="0" height="61" width="55"><br>
   
   <span class="bodyText"><a href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7346876" class="coderTextOrange">ntrefz</a></span><br><a href="?module=History&amp;userID=7346876">305 posts</a></div></td>
   <td class="rtTextCell100">dfadsfa</td>
   </tr>
</tbody></table>

<h3>Edit Announcement</h3>
<table class="rtTable" cellpadding="0" cellspacing="0">
<form name="form1" method="post" action="/"></form>
<tbody>
   <tr>
      <td class="rtHeader" colspan="2">Re: 1000 post party!</td>
   </tr>
   <tr>
      <td class="rtPosterCell" rowspan="2"><div class="rtPosterSpacer">
         <img src="/i/m/ntrefz_big.jpg" class="rtPhoto" border="0" height="61" width="55"><br>
         <span class="bodyText"><a href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7346876" class="coderTextOrange">ntrefz</a></span><br><a href="?module=History&amp;userID=7346876">304 posts</a></div></td>
      <td class="rtTextCell100">
         <b>Subject:</b><br><input name="subject" size="60" onkeypress="return noenter(event)" value="Re: 1000 post party!" type="text"><br><br>
         <b>Body:</b><font color="red"><span align="left" id="Warning" style="display: none;"><br>Warning: one or more &lt;pre&gt; tags is not closed.</span></font>
         <br><textarea id="tcPostArea" cols="72" rows="15" name="body" onkeydown="AllowTabCharacter()"></textarea>
      </td>
   </tr>
   <tr>
      <td class="rtFooter" colspan="2"><input src="/i/roundTables/post.gif" class="rtButton" alt="Post" onclick="form1.module.value='PostMessage'" type="image"><input src="/i/roundTables/preview.gif" class="rtButton" alt="Preview" onclick="form1.module.value='PreviewMessage'" type="image"></td>
   </tr>
</tbody>
</table>


        <jsp:include page="foot.jsp"/>
    </div>
</div>
</body>
</html>
