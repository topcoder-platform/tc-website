package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.language.BaseLanguage;
import com.topcoder.shared.messaging.QueueMessageSender;
import com.topcoder.shared.messaging.TimeExpiredException;
import com.topcoder.shared.messaging.TimeOutException;
import com.topcoder.shared.netCommon.messages.Message;
import com.topcoder.shared.netCommon.screening.request.ScreeningLogoutRequest;
import com.topcoder.shared.netCommon.screening.request.ScreeningBaseRequest;
import com.topcoder.shared.netCommon.screening.response.ScreeningBaseResponse;
import com.topcoder.shared.netCommon.screening.response.ScreeningTimeExpiredResponse;
import com.topcoder.shared.screening.common.ScreeningApplicationServer;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.techassess.Constants;
import com.topcoder.web.codinginterface.techassess.model.ImageInfo;
import com.topcoder.web.codinginterface.techassess.model.WebQueueResponseManager;
import com.topcoder.web.codinginterface.ServerBusyException;
import com.topcoder.web.common.*;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.Serializable;
import java.util.*;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 */
public abstract class Base extends BaseProcessor {

    protected static final Logger log = Logger.getLogger(Base.class);

    private static final ImageInfo BLANK = new ImageInfo();

    static {
        BLANK.setHeight(85);
        BLANK.setWidth(325);
        BLANK.setSrc("/i/corp/screening/emptyClientLogo.gif");
    }

    private QueueMessageSender sender = null;
    private WebQueueResponseManager receiver = null;
    private String messageId = null;
    private long sessionId = -1;
    private long companyId = -1;
    private List languages = null;
    private static final Set locks = new HashSet();
    private ImageInfo sponsorImage = null;

    protected void businessProcessing() throws Exception {
        try {
            loadSponsorImage();
            techAssessProcessing();
            getRequest().setAttribute(Constants.CURRENT_TIME, String.valueOf(System.currentTimeMillis()));
        } catch (TimeOutException e) {
            if (sessionId>=0) unlock();
            closeProcessingPage(buildProcessorRequestString(Constants.RP_TIMEOUT, null, null));
        } catch (TimeExpiredException ex) {
            if (sessionId>=0) unlock();
            closeProcessingPage(buildProcessorRequestString(Constants.RP_TIME_EXPIRED, new String[] {Constants.LOGOUT, Constants.ERROR_MESSAGE},
                        new String[] {String.valueOf(ex.isLogout()), ex.getMessage()}));
        }
    }

    protected void loadSponsorImage() throws Exception {
        log.debug("loadSponsorImage called...");
        Request dataRequest = new Request();
        dataRequest.setContentHandle("sponsor_image");
        try {
            dataRequest.setProperty(Constants.COMPANY_ID, String.valueOf(getCompanyId()));
            dataRequest.setProperty(Constants.IMAGE_TYPE, String.valueOf(Constants.TEST_IMAGE_TYPE));
            DataAccessInt dai = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);
            Map resultMap = dai.getData(dataRequest);
            ResultSetContainer rsc = (ResultSetContainer) resultMap.get("Sponsor_Image");
            if (rsc==null||rsc.isEmpty()) {
                sponsorImage = BLANK;
            } else {
                sponsorImage = new ImageInfo();
                sponsorImage.setSrc(rsc.getStringItem(0, "file_path"));
                sponsorImage.setHeight(rsc.getIntItem(0, "height"));
                sponsorImage.setWidth(rsc.getIntItem(0, "width"));
                sponsorImage.setLink(rsc.getStringItem(0, "link"));
            }
        } catch (TCWebException e) {
            log.warn("company id not set, using default image");
            sponsorImage = BLANK;
        }
        getRequest().setAttribute(Constants.SPONSOR_IMAGE, sponsorImage);

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

    protected void send(ScreeningBaseRequest m) throws TCWebException, ServerBusyException {
        if (m.isSynchronous()) {
            //log.debug("lock it up, it's a syncronous request");
            lock();
        }
        String oldMessageId = this.messageId;
        this.messageId = sender.sendMessageGetID(new HashMap(), m);
        if (oldMessageId!=null) {
            //that means we already sent a message, so we should load up
            //anything in the session associated with that message and transfer
            //it to the new one
            HttpSession session = getRequest().getSession();
            session.setAttribute(ERRORS_KEY+messageId, session.getAttribute(ERRORS_KEY+oldMessageId));
            session.setAttribute(DEFAULTS_KEY+messageId, session.getAttribute(DEFAULTS_KEY+oldMessageId));
            session.setAttribute(Constants.MESSAGE+messageId, session.getAttribute(Constants.MESSAGE+oldMessageId));
            getRequest().removeAttribute(ERRORS_KEY+oldMessageId);
            getRequest().removeAttribute(DEFAULTS_KEY+oldMessageId);
            getRequest().removeAttribute(Constants.MESSAGE+oldMessageId);
        }

    }

    public String getMessageId() {
        return messageId;
    }

    public void setLanguages(List languages) {
        this.languages = languages;
        getRequest().getSession().setAttribute(Constants.LANGUAGES, languages);
    }

    public List getLanguages() throws TCWebException {
        if (languages == null) {
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
        if (getRequest().getSession().getAttribute("logouter") == null) {
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
            if (temp == null) {
                String compId = getRequest().getParameter(Constants.COMPANY_ID);
                if (compId == null) {
                    throw new TCWebException("company id has not been set");
                } else {
                    setCompanyId(Long.parseLong(compId));
                    companyId = Long.parseLong(compId);
                }
            } else {
                companyId = temp.longValue();
            }
        }
        return companyId;
    }

    protected Object getDefault(String key) {
        return defaults.get(key);
    }

    protected boolean hasDefault(String key) {
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

    protected void loadUserMessageIntoRequest(String messageId) {
        //log.debug("load message into request");
        //we're overwritting the request user message here, so you better hope that
        //there is no use in it.
        getRequest().setAttribute(Constants.MESSAGE,
                getRequest().getSession().getAttribute(Constants.MESSAGE + messageId));
        getRequest().getSession().removeAttribute(Constants.MESSAGE + messageId);
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
        log.debug("loading session defaults into request " + m);
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

    private static final String FULL_CONTENT =
            "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">" +
            "<html>" +
            "<head>" +
            "<title>Technical Assessment</title>" +
            "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" >" +
            "<link type=\"text/css\" rel=\"stylesheet\" href=\"/css/screening.css\" >" +
            "</head>" +
            "<body>" +
            "<table class=bodyCenter cellspacing=0 cellpadding=0>" +
            "<tr>" +
            " <td align=center>" +
            " <table cellspacing=0 cellpadding=0 class=tabTable>" +
            " <tr>" +
            " <td class=logoBox rowspan=2>";
    private static final String END_FULL_CONTENT = "</td>" +
            " <td class=titleBar><img src=\"/i/corp/screening/pbtcLogo.gif\" alt=\"\"/></td>" +
            " <td class=tabBarEnd align=right rowspan=2><img src=\"/i/corp/screening/tabBarEnd.gif\" alt=\"\"/></td>" +
            " </tr>" +
            " <tr>" +
            " <td class=tabBar></td>" +
            " </tr>" +
            " </table>" +
            " <table cellspacing=0 cellpadding=0 class=timeTable>" +
            " <tr>" +
            " <td class=timeCellLeft><img src=\"/i/corp/screening/techAssTitle.gif\" alt=\"\" /></td>" +
            " <td class=timeCellRight>&#160;<br />&#160;</td>" +
            " </tr>" +
            " </table>" +
            " <table cellspacing=0 cellpadding=0 class=bodyTable>" +
            " <tr>" +
            " <td><img src=\"/i/corp/screening/bodyTL.gif\" alt=\"\"/></td>" +
            " <td class=bodyT ><img src=\"/i/corp/screening/clear.gif\" alt=\"\"/></td>" +
            " <td><img src=\"/i/corp/screening/bodyTR.gif\" alt=\"\"/></td>" +
            " </tr>" +
            " <tr>" +
            " <td class=bodyL>&#160;</td>" +
            " <td class=bodyContent>" +
            " <br /><br />" +
            " <table cellspacing=0 cellpadding=5 border=0 class=processingTable>" +
            " <tr>" +
            " <td><p class=pC><span class=bodySmallTitle>Processing...</span></p></td>" +
            " <td><img src=\"/i/corp/screening/processing.gif\" alt=\"\"/></td>" +
            " </tr>" +
            " </table>" +
            " <br /><br />" +
            " </td>" +
            " <td class=bodyR>&#160;</td>" +
            " </tr>" +
            " <tr>" +
            " <td><img src=\"/i/corp/screening/bodyBL.gif\" alt=\"\"/></td>" +
            " <td class=bodyB>&#160;</td>" +
            " <td><img src=\"/i/corp/screening/bodyBR.gif\" alt=\"\"/></td>" +
            " </tr>" +
            " </table>" +
            " </td>" +
            " </tr>" +
            "</table>" +
            "</body>" +
            "</html>";

    protected void showProcessingPage() throws IOException {

        StringBuffer buffer = new StringBuffer(2000);
        buffer.append(FULL_CONTENT);
        buffer.append("<img src=\"");
        buffer.append(sponsorImage.getSrc() == null ? "" : sponsorImage.getSrc());
        buffer.append("\"");
        if (sponsorImage.getHeight() >= 0) {
            buffer.append(" height=\"").append(sponsorImage.getHeight()).append("\"");
        }
        if (sponsorImage.getWidth() >= 0) {
            buffer.append(" width=\"" + sponsorImage.getWidth() + "\"");
        }
        buffer.append(" border=\"0\"");
        buffer.append(" alt=\"\"");
        buffer.append(" />");
        buffer.append(END_FULL_CONTENT);


        showProcessingPage(buffer.toString());
    }

    protected void showProcessingPage(String code) throws IOException {
        getResponse().setStatus(200);
        getResponse().setContentType("text/html");

        getResponse().getWriter().print(code);

    }

    protected void closeProcessingPage(String nextPage) throws IOException {
        StringBuffer buf = new StringBuffer(500);
        buf.append("<script language=\"javascript\">");
        buf.append("top.location.replace(\'").append(nextPage).append("\');");
        buf.append("</script>");
        getResponse().getWriter().print(buf.toString());
        getResponse().flushBuffer();
    }

    protected Message receive(int waitTime) throws TCWebException, TimeOutException, TimeExpiredException {
        if (messageId == null) throw new RuntimeException("You must call send before receive.");

        getRequest().getSession().setAttribute(ERRORS_KEY + messageId, errors);
        getRequest().removeAttribute(ERRORS_KEY);
        getRequest().getSession().setAttribute(DEFAULTS_KEY + messageId, defaults);
        getRequest().removeAttribute(DEFAULTS_KEY);

        ScreeningBaseResponse m = (ScreeningBaseResponse) receiver.receive(waitTime, messageId, getResponse());

        if(m instanceof ScreeningTimeExpiredResponse) {
            //throw an exception so we can redirect them to a new page
            ScreeningTimeExpiredResponse resp = (ScreeningTimeExpiredResponse)m;
            TimeExpiredException ex = new TimeExpiredException(resp.getMessage(), resp.forceLogout());
            throw ex;
        }

        //log.debug("response: " + m.getClass().getName());
        if (m.isSynchronous()) {
            //log.debug("unlock it and send response");
            unlock();
        }

        return m;
    }



    protected static List getLanguages(ArrayList languageIds) {
        List ret = new ArrayList(languageIds.size());
        for (Iterator it = languageIds.iterator(); it.hasNext();) {
            ret.add(BaseLanguage.getLanguage(((Integer) it.next()).intValue()));
        }
        return ret;
    }

    protected void setUserMessage(String message) {
        getRequest().getSession().setAttribute(Constants.MESSAGE + this.messageId, message);
    }


    protected boolean isBusy() throws TCWebException {
        synchronized (locks) {
            return locks.contains(Constants.SERVER_BUSY + getSessionId());
        }
    }

    protected void lock() throws TCWebException, ServerBusyException {
        synchronized (locks) {
            if (isBusy())
                throw new ServerBusyException();
            else
                locks.add(Constants.SERVER_BUSY + getSessionId());
        }
    }

    protected void unlock() throws TCWebException {
        synchronized (locks) {
            locks.remove(Constants.SERVER_BUSY + getSessionId());
        }
    }

    /*
     * we might be able to deprecate this since we probably won't run the admin listener
     * in that case, we don't get about them logging out
    */
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
            log.info("session unbound logging out session " + sessionId);
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

