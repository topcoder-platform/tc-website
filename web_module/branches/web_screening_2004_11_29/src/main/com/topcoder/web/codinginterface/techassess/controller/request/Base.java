package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.codinginterface.techassess.model.WebQueueResponseManager;
import com.topcoder.shared.messaging.QueueMessageSender;
import com.topcoder.shared.messaging.TimeOutException;
import com.topcoder.shared.netCommon.messages.Message;
import com.topcoder.shared.security.User;

import java.util.HashMap;
import java.io.PrintWriter;

/**
 * User: dok
 * Date: Dec 10, 2004
 */
public abstract class Base extends BaseProcessor {
    private QueueMessageSender sender;
    private WebQueueResponseManager receiver;


    public void setReceiver(WebQueueResponseManager receiver) {
        this.receiver = receiver;
    }

    public void setSender(QueueMessageSender sender) {
        this.sender = sender;
    }

    protected User getUser() {
        if (user==null)
            user=getAuthentication().getUser();
        return user;
    }

    protected String send(Message m) {
        //todo if it becomes a problem, we may want to change
        //todo the behavior so that we don't wait indefinately
        String messageId = sender.sendMessageGetID(new HashMap(), m);
        return messageId;
    }
    protected void postProcessing(Message message) {

    }

    protected Message receive(int waitTime, String correlationId) throws TimeOutException, Exception {

        Message ret = null;
        getResponse().setStatus(200);
        getResponse().setContentType("text/html");

            PrintWriter out = getResponse().getWriter();
            out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Technical Assessment</title>");
            out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" >");
            out.println("<link type=\"text/css\" rel=\"stylesheet\" href=\"/css/screening.css\" >");
            out.println("</head>");
            out.print("<body onLoad=\"window.location=\'");
            out.print(getNextPage());
            out.print("\'\">");
            out.println("<table class=bodyCenter cellspacing=0 cellpadding=0>");
            out.println("<tr>");
            out.println("      <td align=center>");
            out.println("            <table cellspacing=0 cellpadding=0 class=tabTable>");
            out.println("               <tr>");
            out.println("                  <td class=logoBox rowspan=2><img src=\"/i/corp/screening/clientLogo.gif\" alt=\"\"/></td>");
            out.println("                  <td class=titleBar colspan=4><img src=\"/i/corp/screening/pbtcLogo.gif\" alt=\"\"/></td>");
            out.println("                  <td class=tabBarEnd align=right rowspan=2><img src=\"/i/corp/screening/tabBarEnd.gif\" alt=\"\"/></td>");
            out.println("               </tr>");
            out.println("               <tr>");
            out.println("                  <td class=tabBar><a href=\"/mockup/directions.jsp\"><img src=\"/i/corp/screening/mainTab.gif\" alt=\"\"/></a></td>");
            out.println("                  <td class=tabBar><a href=\"/mockup/help.jsp\"><img src=\"/i/corp/screening/helpTab.gif\" alt=\"\"/></a></td>");
            out.println("                  <td class=tabBar><a href=\"/mockup/login.jsp\"><img src=\"/i/corp/screening/logoutTab.gif\" alt=\"\"/></a></td>");
            out.println("               </tr>");
            out.println("            </table>");
            out.println("            <table cellspacing=0 cellpadding=0 class=timeTable>");
            out.println("               <tr>");
            out.println("                  <td class=timeCellLeft><img src=\"/i/corp/screening/techAssTitle.gif\" alt=\"\" /></td>");
            out.println("                  <td class=timeCellRight>&#160;<br />&#160;</td>");
            out.println("               </tr>");
            out.println("            </table>");
            out.println("      <table cellspacing=0 cellpadding=0 class=bodyTable>");
            out.println("         <tr>");
            out.println("            <td><img src=\"/i/corp/screening/bodyTL.gif\" alt=\"\"/></td>");
            out.println("            <td class=bodyT>&#160;</td>");
            out.println("            <td><img src=\"/i/corp/screening/bodyTR.gif\" alt=\"\"/></td>");
            out.println("         </tr>");
            out.println("         <tr>");
            out.println("            <td class=bodyL>&#160;</td>");
            out.println("            <td class=bodyContent>");
            out.println("            <br /><br />");
            out.println("            <p class=pC><span class=bodySmallTitle>Processing...</span></p>");
            ret = (Message)receiver.receive(waitTime, correlationId, getResponse());
            postProcessing(ret);
            out.println("            <br /><br />");
            out.println("            </td>");
            out.println("            <td class=bodyR>&#160;</td>");
            out.println("         </tr>");
            out.println("         <tr>");
            out.println("            <td><img src=\"/i/corp/screening/bodyBL.gif\" alt=\"\"/></td>");
            out.println("            <td class=bodyB>&#160;</td>");
            out.println("            <td><img src=\"/i/corp/screening/bodyBR.gif\" alt=\"\"/></td>");
            out.println("         </tr>");
            out.println("      </table>");
            out.println("</td>");
            out.println("   </tr>");
            out.println("</table>");
            out.println("</body>");
            out.println("</html>");
            out.flush();

        return ret;
    }




}

