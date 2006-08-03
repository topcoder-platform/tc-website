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
<script type="text/javascript">
<!--
var section;
function toggleTabs(anchor,id) {
   var genStyle = (id=="gen")?'':'none';
   var watchStyle = (id=="watch")?'':'none';
   var rateStyle = (id=="rate")?'':'none';
   if(anchor.blur)anchor.blur();
   if(id=='gen'){
      document.getElementById('tabGen').className = 'tabLinkOn';
      document.getElementById('tabWatch').className = 'tabLinkOff';
      document.getElementById('tabRate').className = 'tabLinkOff';
   }else if(id=='watch'){
      document.getElementById('tabGen').className = 'tabLinkOff';
      document.getElementById('tabWatch').className = 'tabLinkOn';
      document.getElementById('tabRate').className = 'tabLinkOff';
   }else if(id=='rate'){
      document.getElementById('tabGen').className = 'tabLinkOff';
      document.getElementById('tabWatch').className = 'tabLinkOff';
      document.getElementById('tabRate').className = 'tabLinkOn';
   }
   for (i=1; i<=11; i++) {
      document.getElementById('bodyGen'+i).style.display = genStyle;
   }
   for (i=1; i<=5; i++) {
      document.getElementById('bodyWatch'+i).style.display = watchStyle;
   }
   for (i=1; i<=4; i++) {
      document.getElementById('bodyRate'+i).style.display = rateStyle;
   }
   document.getElementById('infoRate').style.display = rateStyle;
}
//-->
</script>
</head>

<body onload="toggleTabs('','gen')">

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
        <A href="?module=History" class="rtbcLink">My Post History</A>&nbsp;&nbsp;|&nbsp;&nbsp;<A href="?module=Watches" class="rtbcLink">My Watches</A>&nbsp;&nbsp;|&nbsp;&nbsp;User Settings<br/>
    </td>
</tr>
<tr>
   <td colspan="2" style="padding-bottom:3px;"><b>
   <A href="main.html" class="rtbcLink">Forums</A> > 
   User Settings
   </b></td>
</tr>
</table>

<table cellpadding="0" cellspacing="0" border="0" class="tabTable" style="clear:both;">
  <tr>
      <td width="20%"><A id="tabGen" href="javascript:void(0)" onclick="toggleTabs(this,'gen')" class="tabLinkOff"><div>General Settings</div></A></td>
      <td width="20%"><A id="tabWatch" href="javascript:void(0)" onclick="toggleTabs(this,'watch')" class="tabLinkOff"><div>Watch Preferences</div></A></td>
      <td width="20%"><A id="tabRate" href="javascript:void(0)" onclick="toggleTabs(this,'rate')" class="tabLinkOff"><div>Rating Preferences</div></A></td>

      <td width="40%"></td>
  </tr>

<form name="form1" method="post" action="/">

<input type="hidden" name="module" value="Settings" />
<input type="hidden" name="section" value="gen" />
<input type="hidden" name="status" value="save" />
<table cellpadding="0" cellspacing="0" class="rtTable">
   <tr id="bodyGen1">
        <td class="rtHeader" colspan="2">General Settings</td>
   </tr>
   <tr id="bodyGen2">
      <td class="rtThreadCell" nowrap="nowrap"><strong>Forums per Category page:</strong></td>
      <td class="rtThreadCell" style="width:100%;">

      <select size="1" name="forumsPerPage">
      
	              <option value="10" selected>10</option>
	      
	              <option value="15">15</option>
	      
	              <option value="25">25</option>
	      
      </select>
      </td>
   </tr>

   <tr id="bodyGen3">
      <td class="rtThreadCell" nowrap="nowrap"><strong>Threads per Forum page:</strong></td>
      <td class="rtThreadCell">
      <select size="1" name="threadsPerPage">
      
               <option value="10">10</option>
         
               <option value="15" selected>15</option>
         
               <option value="25">25</option>

         
               <option value="50">50</option>
         
      </select>
      </td>
   </tr>
   <tr id="bodyGen4">
      <td class="rtThreadCell" nowrap="nowrap"><strong>Messages per Thread page:</strong></td>
      <td class="rtThreadCell">
      <select size="1" name="messagesPerPage">

      
               <option value="10">10</option>
         
               <option value="15" selected>15</option>
         
               <option value="25">25</option>
         
               <option value="50">50</option>
         
      </select>
      </td>
   </tr>

   <tr id="bodyGen5">
      <td class="rtThreadCell" nowrap="nowrap"><strong>Messages per Post History page:</strong></td>
      <td class="rtThreadCell">
      <select size="1" name="messagesPerHistoryPage">
      
               <option value="10">10</option>
         
               <option value="15">15</option>
         
               <option value="25" selected>25</option>

         
               <option value="50">50</option>
         
      </select>
      </td>
   </tr>
   <tr id="bodyGen6">
      <td class="rtThreadCell" nowrap="nowrap"><strong>Results per Search page:</strong></td>
      <td class="rtThreadCell">
        <select size="1" name="resultsPerSearchPage">

        
                    <option value="10">10</option>
            
                    <option value="20" selected>20</option>
            
                    <option value="30">30</option>
            
                    <option value="50">50</option>
            
        </select>
      </td>
   </tr>

   <tr id="bodyGen7">
      <td class="rtThreadCell" nowrap="nowrap"><strong>Default thread page view:</strong></td>
      <td class="rtThreadCell">
      <select size="1" name="threadMode">
      
               <option value="flat">Flat (oldest to newest)</option>
         
               <option value="flat_new">Flat (newest to oldest)</option>
         
               <option value="threaded" selected>Threaded</option>

         
               <option value="tree">Tree</option>
         
      </select>
      </td>
   </tr>
   <tr id="bodyGen8">
      <td class="rtThreadCell" nowrap="nowrap"><strong>Default flat page view:</strong></td>
      <td class="rtThreadCell">
      <select size="1" name="flatMode">

      
               <option value="flat">Oldest to newest&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</option>
         
               <option value="flat_new">Newest to oldest</option>
         
      </select>
      </td>
   </tr>
   <tr id="bodyGen9">
      <td class="rtThreadCell" nowrap="nowrap"><strong>Show previous/next threads:</strong></td>

      <td class="rtThreadCell">
        <input name="showPrevNextThreads" value="true" id="showPrevNextThreadsYes" type="radio"
            checked>
        <label for="jiveShowPrevNextThreadsYes">Yes</label>
        &#160;
        <input name="showPrevNextThreads" value="false" id="showPrevNextThreadsNo" type="radio"
            >
        <label for="jiveShowPrevNextThreadsNo">No</label>
      </td>
   </tr>

   <tr id="bodyGen10">
      <td class="rtThreadCell" nowrap="nowrap"><strong>Display my member photo:</strong></td>
      <td class="rtThreadCell">
      <input name="displayMemberPhoto" value="true" id="displayMemberPhotoYes" type="radio"
          checked>
      <label for="jiveDisplayMemberPhotoYes">Yes</label>
      &#160;
      <input name="displayMemberPhoto" value="false" id="displayMemberPhotoNo" type="radio"
          >
      <label for="jiveDisplayMemberPhotoNo">No</label>

      </td>
   </tr>
   <tr id="bodyGen11">
      <td class="rtThreadCell" nowrap="nowrap"><strong>Display member photos:</strong></td>
      <td class="rtThreadCell">
      <input name="displayAllMemberPhotos" value="true" id="displayAllMemberPhotosYes" type="radio"
          checked>
      <label for="jiveDisplayAllMemberPhotosYes">Yes</label>
      &#160;

      <input name="displayAllMemberPhotos" value="false" id="displayAllMemberPhotosNo" type="radio"
          >
      <label for="jiveDisplayAllMemberPhotosNo">No</label>
      </td>
   </tr>
   <tr id="bodyWatch1">
      <td class="rtHeader" colspan="2">Watch Preferences</td>
   </tr>
   <tr id="bodyWatch2">

      <td class="rtThreadCell" nowrap="nowrap"><strong>Always watch threads I create:</strong></td>
      <td class="rtThreadCell" style="width:100%;">
      <input name="autoWatchNewTopics" value="true" id="autoWatchNewTopicsYes" type="radio"
         >
      <label for="autoWatchNewTopicsYes">Yes</label>
      &#160;
      <input name="autoWatchNewTopics" value="false" id="autoWatchNewTopicsNo" type="radio"
         checked>
      <label for="autoWatchNewTopicsNo">No</label>

      </td>
   </tr>
   <tr id="bodyWatch3">
      <td class="rtThreadCell" nowrap="nowrap"><strong>Always watch threads I reply to:</strong></td>
      <td class="rtThreadCell">
      <input name="autoWatchReplies" value="true" id="autoWatchRepliesYes" type="radio"
         >
      <label for="autoWatchRepliesYes">Yes</label>
      &#160;

      <input name="autoWatchReplies" value="false" id="autoWatchRepliesNo" type="radio"
         checked>
      <label for="autoWatchRepliesNo">No</label>
      </td>
   </tr>
   <tr id="bodyWatch4">
      <td class="rtThreadCell" nowrap="nowrap"><strong>Mark watched threads as read:</strong></td>
      <td class="rtThreadCell">
      <input name="markWatchesRead" value="true" id="markWatchesReadYes" type="radio"
         >

      <label for="markWatchesReadYes">Yes</label>
      &#160;
      <input name="markWatchesRead" value="false" id="markWatchesReadNo" type="radio"
         checked>
      <label for="markWatchesReadNo">No</label>
      </td>
   </tr>
   <tr id="bodyWatch5">
      <td class="rtThreadCell" nowrap="nowrap"><strong>Send watch emails:</strong></td>

      <td class="rtThreadCell">
         <select size=1 name="watchFrequency">
            <option value="0"
                selected>Immediately (default)</option>
            <option value="1"
                >Once per day</option>
            <option value="2"
                >Every other day</option>
            <option value="3"
                >Once per week</option>
            <option value="-1"
                >Never</option>

         </select>
         (ntrefz@topcoder.com)
      </td>
   </tr>
   <tr id="bodyRate1">
        <td class="rtHeader" colspan="2">Rating Preferences</td>
   </tr>
   <tr id="bodyRate2">
      <td class="rtThreadCell" nowrap="nowrap"><strong>Show ratings:</strong></td>

      <td class="rtThreadCell" style="width:100%;">
      <input name="showRatings" value="true" id="showRatingsYes" type="radio"
         checked>
      <label for="showRatingsYes">Yes</label>
      &#160;
      <input name="showRatings" value="false" id="showRatingsNo" type="radio"
         >
      <label for="showRatingsNo">No</label>
      </td>
   </tr>

   <tr id="bodyRate3">
      <td class="rtThreadCell" nowrap="nowrap"><strong>Highlight posts:</strong></td>
      <td class="rtThreadCell" valign="top">
      <select size="1" name="ratingHighlightThreshold">
      
               <option value="50">50</option>
         
               <option value="60">60</option>
         
               <option value="70">70</option>

         
               <option value="80" selected>80</option>
         
               <option value="90">90</option>
         
               <option value="100">100</option>
         
      </select>
      % or higher rating with
      <select size="1" name="ratingHighlightMinCount">
      
               <option value="1">1</option>

         
               <option value="5">5</option>
         
               <option value="10" selected>10</option>
         
               <option value="20">20</option>
         
               <option value="50">50</option>
         
               <option value="100">100</option>
         
      </select>

      or more votes
      </td>
   </tr>
   <tr id="bodyRate4">
      <td class="rtThreadCell" nowrap="nowrap"><strong>Collapse posts:</strong></td>
      <td class="rtThreadCell" valign="top">
      <select size="1" name="ratingCollapseThreshold">
      
               <option value="0">0</option>

         
               <option value="10">10</option>
         
               <option value="20">20</option>
         
               <option value="30">30</option>
         
               <option value="40" selected>40</option>
         
               <option value="50">50</option>
         
               <option value="60">60</option>

         
               <option value="70">70</option>
         
               <option value="80">80</option>
         
               <option value="90">90</option>
         
               <option value="100">100</option>
         
      </select>
      % or lower rating with
      <select size="1" name="ratingCollapseMinCount">

      
               <option value="0">0</option>
         
               <option value="1">1</option>
         
               <option value="5">5</option>
         
               <option value="10" selected>10</option>
         
               <option value="20">20</option>
         
               <option value="50">50</option>

         
               <option value="100">100</option>
         
      </select>
      or more votes in threads with
      <select size="1" name="ratingCollapseMinMessages">
      
               <option value="1">1</option>
         
               <option value="5">5</option>
         
               <option value="10">10</option>

         
               <option value="25">25</option>
         
               <option value="50" selected>50</option>
         
               <option value="100">100</option>
         
      </select>
      or more messages
      </td>
   </tr>
</table>

<div>
   <div style="float:right;">
   <input type="image" src="/i/roundTables/save.gif" alt="Save"/>
   </div>
</div>
<span id="infoRate">TopCoder provides the ability to rate posts.  You may click the [+] next to the thread title if you think it is of high quality.   Similarly, you may click the [-] if it is of low quality.  We recommend that you also post your comments if you agree or disagree with the content of a post. Also, when ratings are enabled, you may click on a post's subject to expand or collapse the post.</span>
</form>

        <jsp:include page="foot.jsp"/>
    </div>
</div>
</body>
</html>
