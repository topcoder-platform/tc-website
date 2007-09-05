<%@ page import="com.topcoder.web.common.tag.HandleTag"%>
<%@ page import="com.topcoder.web.tc.Constants"%>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<div style="float:left; clear:both; padding: 0px 0px 0px 0px;"><img src="/i/interface/leftnav_top.gif" alt="" /></div>

<div class="leftColContent">
   <div style="padding-left:3px;">
   <div style="padding-bottom:10px;"><img src="/i/home/com_title.gif" alt="Coder of the Month" /><br>- August</div>
   <table cellpadding="0" cellspacing="0" border="0" width="165">
   <tr>
      <td style="border-top: 1px solid #CCCCCC;" valign="top"><img src="/i/m/myprasanna_big2.jpg" alt="" width="55" height="61"/></td>
      <td style="padding-left:5px; border-top: 1px solid #CCCCCC;" width="100%">
         <strong><A href="/tc?module=COMHistory&amp;<%=Constants.ACHIEVEMENT_TYPE_ID%>=<%=Constants.ACHIEVEMENT_TYPE_ALGO_COM%>" class="gMetal">Algorithm</A></strong><br>
         <tc-webtag:handle coderId="13366203" context="<%=HandleTag.ALGORITHM%>" darkBG="true" />:<br>
         <span class="small">
         TCCC07 Rd 1A: 1984<br>
         TCCC07 Qual 1: 1895<br>
         SRM 363: 1727
         </span><br><br>
      </td>
   </tr>
   <tr>
      <td style="border-top: 1px solid #CCCCCC;" valign="top"><img src="/i/m/nophoto.jpg" alt="" width="55" height="61"/></td>
      <td style="padding-left:5px; border-top: 1px solid #CCCCCC;">
         <strong><A href="/tc?module=COMHistory&amp;<%=Constants.ACHIEVEMENT_TYPE_ID%>=<%=Constants.ACHIEVEMENT_TYPE_DESIGN_COM%>" class="gMetal">Design</A></strong><br>
         <tc-webtag:handle coderId="20437508" context="<%=HandleTag.DESIGN%>" darkBG="true" />:<br> 
         <span class="small">
         3 wins in August<br>
         Won last 14 components<br>
         </span><br><br>
      </td>
   </tr>
   <tr>
      <td style="border-top: 1px solid #CCCCCC;" valign="top"><img src="/i/m/nophoto.jpg" alt="" width="55" height="61"/></td>
      <td style="padding-left:5px; border-top: 1px solid #CCCCCC;">
         <strong><A href="/tc?module=COMHistory&amp;<%=Constants.ACHIEVEMENT_TYPE_ID%>=<%=Constants.ACHIEVEMENT_TYPE_DEV_COM%>" class="gMetal">Development</A></strong><br>
         <tc-webtag:handle coderId="15604762" context="<%=HandleTag.DEVELOPMENT%>" darkBG="true" />:<br>
         <span class="small">
         4 components, 4 wins<br><br>
         </span><br><br>
      </td>
   </tr>
   </table>
   </div>
</div>

<div style="float: left; clear:both; padding: 0px 0px 23px 0px;"><img src="/i/interface/leftnav_bottom.gif" alt="" /></div>
