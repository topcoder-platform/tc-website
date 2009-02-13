package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.shared.common.ApplicationServer;
import com.topcoder.shared.common.ServicesConstants;
import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.language.BaseLanguage;
import com.topcoder.shared.messaging.QueueMessageSender;
import com.topcoder.shared.messaging.TimeOutException;
import com.topcoder.shared.messaging.messages.LongCompileRequest;
import com.topcoder.shared.messaging.messages.LongCompileResponse;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.messaging.WebQueueResponseManager;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.common.model.ImageInfo;
import com.topcoder.web.codinginterface.ServerBusyException;
import com.topcoder.web.common.*;

import java.io.IOException;
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
    private List languages = null;
    private ImageInfo sponsorImage = null;

    protected abstract void businessProcessing() throws Exception;

    public void setReceiver(WebQueueResponseManager receiver) {
        this.receiver = receiver;
    }

    public void setSender(QueueMessageSender sender) {
        this.sender = sender;
    }

    protected void send(LongCompileRequest sub) throws TCWebException, ServerBusyException {
        HashMap hm = new HashMap();
        hm.put("pendingAction", new Integer(ServicesConstants.LONG_COMPILE_ACTION));
        hm.put("appletServerId", new Integer(ApplicationServer.WEB_SERVER_ID));
        hm.put("socketServerId", new Integer(ApplicationServer.WEB_SERVER_ID));
        hm.put("submitTime", new Long(System.currentTimeMillis()));
        hm.put("language", new Integer(sub.getLanguageID()));
        sender.sendMessage(hm,sub);
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


    protected Object getDefault(String key) {
        return defaults.get(key);
    }

    protected boolean hasDefault(String key) {
        //log.debug("defaults is " + defaults);
        return defaults.containsKey(key);
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

    protected LongCompileResponse receive(int waitTime, long coderID, long componentID) throws TCWebException, TimeOutException {
        LongCompileResponse ls = (LongCompileResponse) receiver.receive(waitTime, coderID+":"+componentID, getResponse());
        return ls;
    }

    protected static List getLanguages(ArrayList languageIds) {
        List ret = new ArrayList(languageIds.size());
        for (Iterator it = languageIds.iterator(); it.hasNext();) {
            ret.add(BaseLanguage.getLanguage(((Integer) it.next()).intValue()));
        }
        return ret;
    }
    public DataAccessInt getDataAccess() throws Exception {
        return getDataAccess(DBMS.OLTP_DATASOURCE_NAME, false);
    }

    public DataAccessInt getDataAccess(boolean cached) throws Exception {
        return getDataAccess(DBMS.OLTP_DATASOURCE_NAME, cached);
    }

    public DataAccessInt getDataAccess(String datasource, boolean cached) throws Exception {
        if (datasource == null) return null;
        DataAccessInt dAccess = null;
        if (cached)
            dAccess = new CachedDataAccess(datasource);
        else
            dAccess = new DataAccess(datasource);
        return dAccess;
    }
    protected User getUser() {
        return getAuthentication().getActiveUser();
    }

}

