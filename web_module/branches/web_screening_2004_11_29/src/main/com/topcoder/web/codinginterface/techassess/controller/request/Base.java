package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.codinginterface.techassess.model.WebQueueResponseManager;
import com.topcoder.web.codinginterface.techassess.Constants;
import com.topcoder.shared.messaging.QueueMessageSender;
import com.topcoder.shared.messaging.TimeOutException;
import com.topcoder.shared.netCommon.messages.Message;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.language.*;

import java.util.*;
import java.io.PrintWriter;
import java.io.IOException;

/**
 * User: dok
 * Date: Dec 10, 2004
 */
public abstract class Base extends BaseProcessor {

    protected static final Logger log = Logger.getLogger(Base.class);

    private QueueMessageSender sender = null;
    private WebQueueResponseManager receiver = null;
    private String messageId = null;
    private long sessionId = -1;
    private long companyId = -1;
    private List languages = null;


    public void setReceiver(WebQueueResponseManager receiver) {
        this.receiver = receiver;
    }

    public void setSender(QueueMessageSender sender) {
        this.sender = sender;
    }

    protected User getUser() {
        if (user == null)
            user = getAuthentication().getUser();
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

    public void setLanguages(List languages) {
        this.languages = languages;
        getRequest().getSession().setAttribute(Constants.LANGUAGES, languages);
    }

    public List getLanguages() throws TCWebException {
        if (languages==null) {
            List temp = (List) getRequest().getSession().getAttribute(Constants.LANGUAGES);
            if (temp == null)
                throw new TCWebException("languages have not been set");
            else {
                languages = temp;
            }
        }
        return languages;

    }

    public void setSessionId(long sessionId) {
        //log.debug("session id set to " + sessionId);
        this.sessionId = sessionId;
        getRequest().getSession().setAttribute(Constants.SESSION_ID, new Long(sessionId));
    }

    public long getSessionId() throws TCWebException {
        if (sessionId < 0) {
            Long temp = (Long) getRequest().getSession().getAttribute(Constants.SESSION_ID);
            if (temp == null)
                throw new TCWebException("session id has not been set");
            else {
                sessionId = temp.longValue();
            }
        }
        return sessionId;
    }

    public void setCompanyId(long companyId) {
        //log.debug("company id set to " + companyId);
        this.companyId = companyId;
        getRequest().getSession().setAttribute(Constants.COMPANY_ID, new Long(companyId));
    }

    public long getCompanyId() throws TCWebException {
        if (companyId < 0) {
            Long temp = (Long) getRequest().getSession().getAttribute(Constants.COMPANY_ID);
            if (temp == null)
                throw new TCWebException("company id has not been set");
            else {
                companyId = temp.longValue();
            }
        }
        return companyId;
    }

    protected Object getDefault(String key ) {
        return defaults.get(key);
    }

    protected boolean hasDefault(String key ) {
        //log.debug("defaults is " + defaults);
        return defaults.containsKey(key);
    }


    protected void clearSessionErrors(String messageId) {
        getRequest().getSession().removeAttribute(ERRORS_KEY + messageId);
/*
        if (errors == null)
            log.debug("errors is null");
        else
            log.debug("errors is " + errors);
*/
    }

    protected void clearSessionDefaults(String messageId) {
        getRequest().getSession().removeAttribute(DEFAULTS_KEY + messageId);
/*
        if (defaults == null)
            log.debug("defaults is null");
        else
            log.debug("defaults is " + defaults);
*/
    }

    protected void loadSessionErrorsIntoRequest(String messageId) {
        HashMap m = (HashMap) getRequest().getSession().getAttribute(ERRORS_KEY + messageId);
        Map.Entry me = null;
        //log.debug("loading session errors into request " + m);
        if (m != null) {
            for (Iterator it = m.entrySet().iterator(); it.hasNext();) {
                me = (Map.Entry) it.next();
                errors.put(me.getKey(), me.getValue());
            }
        }
        clearSessionErrors(messageId);
    }

    protected void loadSessionDefaultsIntoRequest(String messageId) {
        HashMap m = (HashMap) getRequest().getSession().getAttribute(DEFAULTS_KEY + messageId);
        Map.Entry me = null;
        //log.debug("loading session defaults into request " + m);
        if (m != null) {
            for (Iterator it = m.entrySet().iterator(); it.hasNext();) {
                me = (Map.Entry) it.next();
                setDefault((String) me.getKey(), me.getValue());
            }
        }
    }

    protected String buildProcessorRequestString(String processor, String[] keys, String[] values) {
        if (keys != null && values != null && keys.length != values.length)
            throw new IllegalArgumentException("the number of parameter keys must be the same as the number of values");

        SessionInfo info = (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);
        StringBuffer ret = new StringBuffer(100);
        //doing this to get rid of https in the case of the login request it would be there
        ret.append(info.getAbsoluteServletPath());
        ret.append("?").append(Constants.MODULE).append("=").append(processor);
        if (keys != null && values != null) {
            for (int i = 0; i < keys.length; i++) {
                ret.append("&").append(keys[i]).append("=").append(values[i]);
            }
        }
        return ret.toString();
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
        out.println("                  <td class=titleBar><img src=\"/i/corp/screening/pbtcLogo.gif\" alt=\"\"/></td>");
        out.println("                  <td class=tabBarEnd align=right rowspan=2><img src=\"/i/corp/screening/tabBarEnd.gif\" alt=\"\"/></td>");
        out.println("               </tr>");
        out.println("               <tr>");
        out.println("                  <td class=tabBar></td>");
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
        out.println("               <table cellspacing=0 cellpadding=5 border=0 class=processingTable>");
        out.println("                  <tr>");
        out.println("                     <td><p class=pC><span class=bodySmallTitle>Processing...</span></p></td>");
        out.println("                     <td><img src=\"/i/corp/screening/processing.gif\" alt=\"\"/></td>");
        out.println("                  </tr>");
        out.println("               </table>");
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
    }

    protected void closeProcessingPage() throws IOException {
        PrintWriter out = getResponse().getWriter();
        out.flush();
    }

    protected Message receive(int waitTime) throws TimeOutException {

        if (messageId == null) throw new RuntimeException("You must call send before receive.");

        log.debug("setting up session errors");
        getRequest().getSession().setAttribute(ERRORS_KEY + messageId, errors);
        getRequest().removeAttribute(ERRORS_KEY);
        log.debug("setting up session defaults");
        getRequest().getSession().setAttribute(DEFAULTS_KEY + messageId, defaults);
        getRequest().removeAttribute(DEFAULTS_KEY);
        log.debug("defaults: " + getRequest().getSession().getAttribute(DEFAULTS_KEY + messageId));
        log.debug("errors: " + getRequest().getSession().getAttribute(ERRORS_KEY + messageId));

        return (Message) receiver.receive(waitTime, messageId, getResponse());
    }


    protected static List getLanguages(ArrayList languageIds) {
        List ret = new ArrayList(languageIds.size());
        for (Iterator it = languageIds.iterator(); it.hasNext();) {
            ret.add(BaseLanguage.getLanguage(((Integer)it.next()).intValue()));
        }
        return ret;
    }



}

