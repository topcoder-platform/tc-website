<%@ page import="com.topcoder.web.common.tag.HandleTag"%>
<%@ page import="com.topcoder.web.tc.Constants"%>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<div style="float:left; clear:both; padding: 0px 0px 0px 0px;"><img src="/i/interface/leftnav_top.gif" alt="" /></div>

<div class="leftColContent">
   <div style="padding-left:3px;">
   <div style="padding-bottom:10px;"><img src="/i/home/com_title.gif" alt="Coder of the Month" /><br>- June</div>
   <table cellpadding="0" cellspacing="0" border="0" width="165">
   <tr>
      <td style="border-top: 1px solid #CCCCCC;" valign="top"><img src="/i/m/fuwenjie_big2.jpg" alt="" width="55" height="61"/></td>
      <td style="padding-left:5px; border-top: 1px solid #CCCCCC;" width="100%">
         <strong><A href="/tc?module=COMHistory&amp;<%=Constants.ACHIEVEMENT_TYPE_ID%>=<%=Constants.ACHIEVEMENT_TYPE_ALGO_COM%>" class="gMetal">Algorithm</A></strong><br>
         <tc-webtag:handle coderId="16056363" context="<%=HandleTag.ALGORITHM%>" darkBG="true" />:<br>
         <span class="small">SRM 301: 2647
         <br>TCO06 Finals: 2525
         <br>TCO06 Semi: 2427
         </span><br><br>
      </td>
   </tr>
   <tr>
      <td style="border-top: 1px solid #CCCCCC;" valign="top"><img src="/i/m/aubergineanode_big.jpg" alt="" width="55" height="61"/></td>
      <td style="padding-left:5px; border-top: 1px solid #CCCCCC;">
         <strong><A href="/tc?module=COMHistory&amp;<%=Constants.ACHIEVEMENT_TYPE_ID%>=<%=Constants.ACHIEVEMENT_TYPE_DESIGN_COM%>" class="gMetal">Design</A></strong><br>
         <tc-webtag:handle coderId="11797255" context="<%=HandleTag.DESIGN%>" darkBG="true" />:<br>
         <span class="small">Finished 5th at the TCO06, gained 329 rating points and became red
         </span><br><br>
      </td>
   </tr>
   <tr>
      <td style="border-top: 1px solid #CCCCCC;" valign="top"><img src="/i/m/nophoto.jpg" alt="" width="55" height="61"/></td>
      <td style="padding-left:5px; border-top: 1px solid #CCCCCC;">
         <strong><A href="/tc?module=COMHistory&amp;<%=Constants.ACHIEVEMENT_TYPE_ID%>=<%=Constants.ACHIEVEMENT_TYPE_DEV_COM%>" class="gMetal">Development</A></strong><br>
         <tc-webtag:handle coderId="20188980" context="<%=HandleTag.DEVELOPMENT%>" darkBG="true" />:<br>
         <span class="small">$1600 in winnings and 3 wins in 4 submissions
         </span><br><br>
      </td>
   </tr>
   </table>
   </div>
</div>

<div style="float: left; clear:both; padding: 0px 0px 23px 0px;"><img src="/i/interface/leftnav_bottom.gif" alt="" /></div>
