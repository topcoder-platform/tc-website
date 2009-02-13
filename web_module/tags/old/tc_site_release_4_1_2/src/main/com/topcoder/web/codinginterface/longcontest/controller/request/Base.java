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
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.codinginterface.messaging.WebQueueResponseManager;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.ImageInfo;

import java.io.IOException;
import java.util.*;

/**
 * @author dok
 * @version $Revision$ $Date$
 */
public abstract class Base extends BaseProcessor {

    protected static final Logger log = Logger.getLogger(Base.class);

    private QueueMessageSender sender = null;
    private WebQueueResponseManager receiver = null;
    private ImageInfo sponsorImage = null;
    private static final Set locks = new HashSet();

    protected void businessProcessing() throws Exception {
        loadSponsorImage();
        loadRoundInfo();
        longContestProcessing();
    }

    protected abstract void longContestProcessing() throws Exception;

    protected void loadRoundInfo() throws Exception {
        String round = getRequest().getParameter(Constants.ROUND_ID);
        if (round != null) {
            log.debug("round id was " + round);
            long roundId = Long.parseLong(round);
            ResultSetContainer rsc = getRoundInfo(roundId);

            if (!rsc.isEmpty()) {
                if (rsc.getItem(0, "forum_id").getResultData()!=null) {
                    getRequest().setAttribute(Constants.FORUM_ID, new Long(rsc.getLongItem(0, "forum_id")));
                }
                getRequest().setAttribute(Constants.ROUND_TYPE_ID, new Integer(rsc.getIntItem(0, "round_type_id")));
            }
            getRequest().setAttribute(Constants.RESULTS_AVAILABLE, new Boolean(areResultsAvailable(roundId)));
        }

    }


    protected void loadSponsorImage() throws Exception {
        log.debug("loadSponsorImage called...");
        String round = getRequest().getParameter(Constants.ROUND_ID);
        if (round != null) {
            Request dataRequest = new Request();
            dataRequest.setContentHandle("long_contest_sponsor_image");
            dataRequest.setProperty("rd", round);
            DataAccessInt dai = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);
            Map resultMap = dai.getData(dataRequest);
            ResultSetContainer rsc = (ResultSetContainer) resultMap.get("long_contest_sponsor_image");
            if (!rsc.isEmpty()) {
                sponsorImage = new ImageInfo();
                sponsorImage.setSrc(rsc.getStringItem(0, "file_path"));
                if (rsc.getItem(0, "height").getResultData() != null) {
                    sponsorImage.setHeight(rsc.getIntItem(0, "height"));
                }
                if (rsc.getItem(0, "width").getResultData() != null) {
                    sponsorImage.setWidth(rsc.getIntItem(0, "width"));
                }
                sponsorImage.setLink(rsc.getStringItem(0, "link"));
                getRequest().setAttribute(Constants.SPONSOR_IMAGE, sponsorImage);
            }
        }

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

    /**
     *
     * @param roundId
     * @return true if the coding phase is over, false otherwise
     * @throws Exception if there is a db problem or if the round doesn't exist
     */
    protected boolean isRoundOver(long roundId) throws Exception {
        //todo consider removing the long contest over command and using data from the round info command
        //todo of course, then we're comparing app server time with db time, but i think we'll survive
        log.debug("is round over called");
        Request r = new Request();
        r.setContentHandle("long_contest_over");
        r.setProperty(Constants.ROUND_ID, String.valueOf(roundId));
        ResultSetContainer rsc = (ResultSetContainer)getDataAccess().getData(r).get("long_contest_over");
        return rsc.getBooleanItem(0, 0);
    }


    /**
     *
     * @param roundId
     * @return
     * @throws Exception if there is a db problem
     */
    protected ResultSetContainer getRoundInfo(long roundId) throws Exception {
        Request r = new Request();
        r.setContentHandle("long_contest_round_information");
        r.setProperty("rd", String.valueOf(roundId));
        Map m = getDataAccess(true).getData(r);
        return (ResultSetContainer)m.get("long_contest_round_information");
    }

    /**
     *
     * @param roundId
     * @return true if the round has been load already, false otherwise
     * @throws Exception
     */
    protected boolean areResultsAvailable(long roundId) throws Exception {
        Request r = new Request();
        r.setContentHandle("round_exists");
        r.setProperty("rd", String.valueOf(roundId));
        return !((ResultSetContainer)getDataAccess(DBMS.DW_DATASOURCE_NAME, false).getData(r).get("round_exists")).isEmpty();
    }
}

