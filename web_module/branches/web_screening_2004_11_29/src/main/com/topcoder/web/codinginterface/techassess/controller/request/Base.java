package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.codinginterface.techassess.model.WebQueueResponseManager;
import com.topcoder.shared.messaging.QueueMessageSender;
import com.topcoder.shared.messaging.TimeOutException;
import com.topcoder.shared.netCommon.messages.Message;
import com.topcoder.shared.security.User;

import java.util.HashMap;
import java.util.Map;
import java.util.Iterator;
import java.util.ArrayList;
import java.io.PrintWriter;
import java.io.IOException;

/**
 * User: dok
 * Date: Dec 10, 2004
 */
public abstract class Base extends BaseProcessor {
    private QueueMessageSender sender = null;
    private WebQueueResponseManager receiver = null;
    private String messageId = null;


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

    protected void send(Message m) {
        /*todo if it becomes a problem, we may want to change
         *the behavior so that we don't wait indefinately
         */
        this.messageId = sender.sendMessageGetID(new HashMap(), m);

    }

    public String getMessageId() {
        return messageId;
    }

    protected void clearSessionErrors(String messageId) {
        getRequest().getSession().removeAttribute(ERRORS_KEY+messageId);
        if (errors==null)
            log.debug("errors is null");
        else log.debug("errors is " + errors);
    }

    protected void clearSessionDefaults(String messageId) {
        getRequest().getSession().removeAttribute(DEFAULTS_KEY+messageId);
        if (defaults==null)
            log.debug("defaults is null");
        else log.debug("defaults is " + defaults);
    }

    protected void loadSessionErrorsIntoRequest(String messageId) {
        HashMap m = (HashMap)getRequest().getSession().getAttribute(ERRORS_KEY+messageId);
        Map.Entry me = null;
        log.debug("loading session errors into request " + m);
        if (m!=null) {
            for (Iterator it = m.entrySet().iterator();it.hasNext();) {
                me = (Map.Entry)it.next();
                errors.put(me.getKey(), me.getValue());
            }
        }
        clearSessionErrors(messageId);
    }

    protected void loadSessionDefaultsIntoRequest(String messageId) {
        HashMap m = (HashMap)getRequest().getSession().getAttribute(DEFAULTS_KEY+messageId);
        Map.Entry me = null;
        log.debug("loading session defaults into request " + m);
        if (m!=null) {
            for (Iterator it = m.entrySet().iterator();it.hasNext();) {
                me = (Map.Entry)it.next();
                setDefault((String)me.getKey(), me.getValue());
            }
        }
    }


    protected void showProcessingPage(String nextPage) throws IOException {
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
            out.print("<body onLoad=\"window.location.href=\'");
            out.print(nextPage);
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
    }

    protected void closeProcessingPage() throws IOException {
        PrintWriter out = getResponse().getWriter();
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
    }

    protected Message receive(int waitTime) throws TimeOutException {

        if (messageId==null) throw new RuntimeException("You must call send before receive.");

        log.debug("setting up session errors");
        getRequest().getSession().setAttribute(ERRORS_KEY+messageId, errors);
        getRequest().removeAttribute(ERRORS_KEY);
        log.debug("setting up session defaults");
        getRequest().getSession().setAttribute(DEFAULTS_KEY+messageId, defaults);
        getRequest().removeAttribute(DEFAULTS_KEY);
        log.debug("defaults: " + getRequest().getSession().getAttribute(DEFAULTS_KEY+messageId));
        log.debug("errors: " + getRequest().getSession().getAttribute(ERRORS_KEY+messageId));

        return (Message)receiver.receive(waitTime, messageId, getResponse());
    }




}

