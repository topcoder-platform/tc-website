<%@ page import="com.topcoder.web.common.tag.HandleTag"%>
<%@ page import="com.topcoder.web.tc.Constants"%>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<style type="text/css">
    .cotmFeature { padding:0px 0px 20px 16px; color:#ffffff; font-weight:bold; font-size:12px; }
    a:link.cotmFeature , a:visited.cotmFeature { text-decoration:none; color:#ffffff; }
    a:hover.cotmFeature, a:active.cotmFeature { text-decoration:underline; color:#cccccc; }
</style>

<div style="float:left; clear:both; padding: 0px 0px 0px 0px;"><img src="/i/interface/leftnav_top.gif" alt="" /></div>

<div class="leftColContent">
   <div style="padding-left:3px;">
   <div style="padding-bottom:10px;"><img src="/i/home/com_title.gif" alt="Coder of the Month" /><br />
   - March</div>
   <table cellpadding="0" cellspacing="0" border="0" width="165">
   <tr>
      <td style="border-top: 1px solid #CCCCCC;" valign="top"><img src="/i/m/nophoto.jpg" alt="" width="55" height="61"/></td>
      <td style="padding-left:5px; border-top: 1px solid #CCCCCC;" width="100%">
         <strong><a href="/tc?module=COMHistory&amp;<%=Constants.ACHIEVEMENT_TYPE_ID%>=<%=Constants.ACHIEVEMENT_TYPE_ALGO_COM%>" class="gMetal">Algorithm</a></strong><br />
         <tc-webtag:handle coderId="14908325" context="<%=HandleTag.ALGORITHM%>" darkBG="true" />
         <br />
         <br />
      </td>
   </tr>
   <tr>
      <td style="border-top: 1px solid #CCCCCC;" valign="top"><img src="/i/m/nophoto.jpg" alt="" width="55" height="61"/></td>
      <td style="padding-left:5px; border-top: 1px solid #CCCCCC;">
         <strong><a href="/tc?module=COMHistory&amp;<%=Constants.ACHIEVEMENT_TYPE_ID%>=<%=Constants.ACHIEVEMENT_TYPE_DESIGN_COM%>" class="gMetal">Design</a></strong><br />
         <tc-webtag:handle coderId="310233" context="<%=HandleTag.DESIGN%>" darkBG="true" />:<br />
         for winning 5 architecture competitions<br />
         <br />
      </td>
   </tr>
   <tr>
      <td style="border-top: 1px solid #CCCCCC;" valign="top"><img src="/i/m/nophoto.jpg" alt="" width="55" height="61"/></td>
      <td style="padding-left:5px; border-top: 1px solid #CCCCCC;">
         <strong><a href="/tc?module=COMHistory&amp;<%=Constants.ACHIEVEMENT_TYPE_ID%>=<%=Constants.ACHIEVEMENT_TYPE_DEV_COM%>" class="gMetal">Development</a></strong><br />
         <tc-webtag:handle coderId="22672905" context="<%=HandleTag.DEVELOPMENT%>" darkBG="true" />:<br />
         <span class="small">
         for winning 7 assemblies<br />
         </span><br /><br />
      </td>
   </tr>
   </table>
   <%-- On/Off --%>
   <!--<div><a class="cotmFeature" href="http://www.topcoder.com/news/2009/03/17/meet-the-february-coders-and-designers-of-the-month">Read Their Interviews</a></div>-->
   
   </div>
</div>

<div style="float: left; clear:both; padding: 0px 0px 23px 0px;"><img src="/i/interface/leftnav_bottom.gif" alt="" /></div>
