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
import com.topcoder.shared.netCommon.screening.request.ScreeningLogoutRequest;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.language.*;
import com.topcoder.shared.screening.common.ScreeningApplicationServer;

import javax.servlet.http.HttpSessionBindingListener;
import javax.servlet.http.HttpSessionBindingEvent;
import java.util.*;
import java.io.IOException;
import java.io.Serializable;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 */
public abstract class Base extends BaseProcessor {

    protected static final Logger log = Logger.getLogger(Base.class);

    private QueueMessageSender sender = null;
    private WebQueueResponseManager receiver = null;
    private String messageId = null;
    private long sessionId = -1;
    private long companyId = -1;
    private List languages = null;


    protected void businessProcessing() throws Exception {
        //log.debug("session timeout is " + getRequest().getSession().getMaxInactiveInterval());
        getRequest().setAttribute(Constants.CURRENT_TIME, String.valueOf(System.currentTimeMillis()));
        try {
            techAssessProcessing();
        } catch (TimeOutException e) {
            closeProcessingPage(buildProcessorRequestString(Constants.RP_TIMEOUT, null, null));
        }
    }

    protected abstract void techAssessProcessing() throws Exception;

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

    /**
     * making this final so that someone doesn't override and not add the object
     * containing a sessionbindinglistener that auto logs out
     * @param sessionId
     */
    public final void setSessionId(long sessionId) {
        //log.debug("session id set to " + sessionId);
        if (getRequest().getSession().getAttribute("logouter")==null) {
            getRequest().getSession().setAttribute("logouter", new Logouter(sessionId, sender));
        }
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
        loadSessionErrorsIntoRequest(messageId, true);
    }

    protected void loadSessionDefaultsIntoRequest(String messageId) {
        loadSessionDefaultsIntoRequest(messageId, true);
    }

    protected void loadSessionErrorsIntoRequest(String messageId, boolean clear) {
        HashMap m = (HashMap) getRequest().getSession().getAttribute(ERRORS_KEY + messageId);
        Map.Entry me = null;
        //log.debug("loading session errors into request " + m);
        if (m != null) {
            for (Iterator it = m.entrySet().iterator(); it.hasNext();) {
                me = (Map.Entry) it.next();
                errors.put(me.getKey(), me.getValue());
            }
        }
        if (clear)
            clearSessionErrors(messageId);
    }

    protected void loadSessionDefaultsIntoRequest(String messageId, boolean clear) {
        HashMap m = (HashMap) getRequest().getSession().getAttribute(DEFAULTS_KEY + messageId);
        Map.Entry me = null;
        //log.debug("loading session defaults into request " + m);
        if (m != null) {
            for (Iterator it = m.entrySet().iterator(); it.hasNext();) {
                me = (Map.Entry) it.next();
                setDefault((String) me.getKey(), me.getValue());
            }
        }
        if (clear)
            clearSessionDefaults(messageId);
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


    protected void showProcessingPage() throws IOException {
        getResponse().setStatus(200);
        getResponse().setContentType("text/html");

        //todo if there's not dynamic content, then make this a final string
        StringBuffer buf = new StringBuffer(2000);
        buf.append("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">");
        buf.append("<html>");
        buf.append("<head>");
        buf.append("<title>Technical Assessment</title>");
        buf.append("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" >");
        buf.append("<link type=\"text/css\" rel=\"stylesheet\" href=\"/css/screening.css\" >");
        buf.append("</head>");
        buf.append("<body>");
/*        buf.append("<body onLoad=\"top.location.replace(\'");
        buf.append(nextPage);
        buf.append("\')\">");*/
        buf.append("<table class=bodyCenter cellspacing=0 cellpadding=0>");
        buf.append("<tr>");
        buf.append(  " <td align=center>");
        buf.append(    " <table cellspacing=0 cellpadding=0 class=tabTable>");
        buf.append(      " <tr>");
        buf.append(        " <td class=logoBox rowspan=2><img src=\"/i/corp/screening/clientLogo.gif\" alt=\"\"/></td>");
        buf.append(        " <td class=titleBar><img src=\"/i/corp/screening/pbtcLogo.gif\" alt=\"\"/></td>");
        buf.append(        " <td class=tabBarEnd align=right rowspan=2><img src=\"/i/corp/screening/tabBarEnd.gif\" alt=\"\"/></td>");
        buf.append(      " </tr>");
        buf.append(      " <tr>");
        buf.append(        " <td class=tabBar></td>");
        buf.append(      " </tr>");
        buf.append(    " </table>");
        buf.append(    " <table cellspacing=0 cellpadding=0 class=timeTable>");
        buf.append(      " <tr>");
        buf.append(        " <td class=timeCellLeft><img src=\"/i/corp/screening/techAssTitle.gif\" alt=\"\" /></td>");
        buf.append(        " <td class=timeCellRight>&#160;<br />&#160;</td>");
        buf.append(      " </tr>");
        buf.append(    " </table>");
        buf.append(    " <table cellspacing=0 cellpadding=0 class=bodyTable>");
        buf.append(      " <tr>");
        buf.append(        " <td><img src=\"/i/corp/screening/bodyTL.gif\" alt=\"\"/></td>");
        buf.append(        " <td class=bodyT>&#160;</td>");
        buf.append(        " <td><img src=\"/i/corp/screening/bodyTR.gif\" alt=\"\"/></td>");
        buf.append(      " </tr>");
        buf.append(      " <tr>");
        buf.append(        " <td class=bodyL>&#160;</td>");
        buf.append(        " <td class=bodyContent>");
        buf.append(        " <br /><br />");
        buf.append(          " <table cellspacing=0 cellpadding=5 border=0 class=processingTable>");
        buf.append(            " <tr>");
        buf.append(              " <td><p class=pC><span class=bodySmallTitle>Processing...</span></p></td>");
        buf.append(              " <td><img src=\"/i/corp/screening/processing.gif\" alt=\"\"/></td>");
        buf.append(            " </tr>");
        buf.append(          " </table>");
        buf.append(          " <br /><br />");
        buf.append(        " </td>");
        buf.append(        " <td class=bodyR>&#160;</td>");
        buf.append(      " </tr>");
        buf.append(      " <tr>");
        buf.append(        " <td><img src=\"/i/corp/screening/bodyBL.gif\" alt=\"\"/></td>");
        buf.append(        " <td class=bodyB>&#160;</td>");
        buf.append(        " <td><img src=\"/i/corp/screening/bodyBR.gif\" alt=\"\"/></td>");
        buf.append(      " </tr>");
        buf.append(    " </table>");
        buf.append(  " </td>");
        buf.append(" </tr>");
        buf.append("</table>");
        buf.append("</body>");
        buf.append("</html>");

        //log.debug(buf.toString());

        getResponse().getWriter().print(buf.toString());
    }

    protected void closeProcessingPage(String nextPage) throws IOException {
        StringBuffer buf = new StringBuffer("500");
        buf.append("<script language=\"javascript\">");
        buf.append("top.location.replace(\'").append(nextPage).append("\');");
        buf.append("</script>");
        getResponse().getWriter().print(buf.toString());
        getResponse().flushBuffer();
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


    private final class Logouter implements Serializable, HttpSessionBindingListener {

        private long sessionId = -1;
        private QueueMessageSender sender = null;

        public Logouter(long sessionId, QueueMessageSender sender) {
            this.sessionId = sessionId;
            this.sender = sender;
        }

        public void valueBound(HttpSessionBindingEvent event) {
            //whoopie, we're in the session!!
        }

        public void valueUnbound(HttpSessionBindingEvent event) {
            //send a logout request
            log.debug("session unbound logging out session " + sessionId);
            ScreeningLogoutRequest request = new ScreeningLogoutRequest();
            request.setServerID(ScreeningApplicationServer.WEB_SERVER_ID);
            request.setSessionID(sessionId);
            sender.sendMessage(new HashMap(), request);
        }

        public long getSessionId() {
            return this.sessionId;
        }

        public void setSessionId(long sessionId) {
            this.sessionId = sessionId;
        }
    }



}

