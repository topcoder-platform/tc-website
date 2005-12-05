package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.shared.common.ApplicationServer;
import com.topcoder.shared.common.ServicesConstants;
import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.language.BaseLanguage;
import com.topcoder.shared.messaging.QueueMessageSender;
import com.topcoder.shared.messaging.TimeOutException;
import com.topcoder.shared.messaging.messages.LongCompileRequest;
import com.topcoder.shared.messaging.messages.LongCompileResponse;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.ServerBusyException;
import com.topcoder.web.codinginterface.model.ImageInfo;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.codinginterface.messaging.WebQueueResponseManager;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.TCWebException;

import java.io.IOException;
import java.util.*;

/**
 * @author dok
 * @version $Revision$ $Date$
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
    private static final Set locks = new HashSet();

    protected void businessProcessing() throws Exception {
        loadSponsorImage();
        longContestProcessing();
    }

    protected abstract void longContestProcessing() throws Exception;

    protected void loadSponsorImage() throws Exception {
        log.debug("loadSponsorImage called...");
        Request dataRequest = new Request();
        dataRequest.setContentHandle("sponsor_image");
        try {
            //todo figure out what to do here.   we'll probably have to implement multiple versions
            //todo for different image types.
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

    public void setReceiver(WebQueueResponseManager receiver) {
        this.receiver = receiver;
    }

    public void setSender(QueueMessageSender sender) {
        this.sender = sender;
    }

    protected void send(LongCompileRequest sub) throws TCWebException, ServerBusyException {
        // This is a synchronous message
        lock();

        HashMap hm = new HashMap();
        hm.put("pendingAction", new Integer(ServicesConstants.LONG_COMPILE_ACTION));
        hm.put("appletServerId", new Integer(ApplicationServer.WEB_SERVER_ID));
        hm.put("socketServerId", new Integer(ApplicationServer.WEB_SERVER_ID));
        hm.put("submitTime", new Long(System.currentTimeMillis()));
        hm.put("language", new Integer(sub.getLanguageID()));
        sender.sendMessage(hm, sub);
    }

    protected void lock() throws TCWebException, ServerBusyException {
        synchronized (locks) {
            if (isBusy())
                throw new ServerBusyException();
            else
                locks.add(Constants.SERVER_BUSY + getSessionId());
        }
    }

    protected boolean isBusy() throws TCWebException {
        synchronized (locks) {
            return locks.contains(Constants.SERVER_BUSY + getSessionId());
        }
    }

    protected String getSessionId() {
        return getRequest().getSession().getId();
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

    // Compilation in progress message
    private static final String PROGRESS_COMPILING_HTML = "<html>"
            + "<title>TopCoder</title>"
            + "<head>"
            + "<STYLE TYPE=\"text/css\">"
            + ".html, body"
            + "{font-family: Arial, Helvetica, Verdana, sans-serif;font-size: 12px;color: #333;}"
            + "</STYLE>"
            + "</head>"
            + "<body>"
            + "<div align=\"center\">"
            + "<br><br>"
            + "Please wait while your solution is submitted."
            + "<br><br>"
            + "<img src=\"http://www.topcoder.com/i/interface/processing.gif\" alt=\"Processing\" border=\"0\" />"
            + "</div>" + "</body>" + "</html>";


    protected void showProcessingPage() throws IOException {
        showProcessingPage(PROGRESS_COMPILING_HTML);
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

    protected LongCompileResponse receive(int waitTime, long coderID, long componentID) throws TimeOutException {
        try {
            LongCompileResponse ls = (LongCompileResponse) receiver.receive(waitTime, coderID + ":" + componentID, getResponse());
            return ls;
        } catch (TimeOutException e) {
            throw e;
        } finally {
            unlock();
        }
    }

    protected void unlock() {
        synchronized (locks) {
            locks.remove(Constants.SERVER_BUSY + getSessionId());
        }
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
        return getAuthentication().getUser();
    }

}

