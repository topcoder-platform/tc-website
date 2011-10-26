package com.topcoder.web.winformula.controller.request;

import java.io.IOException;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.ejb.CreateException;
import javax.naming.NamingException;

import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.TCPrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.server.util.DBUtils;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.language.BaseLanguage;
import com.topcoder.shared.language.JavaLanguage;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.ServerBusyException;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.cache.MaxAge;
import com.topcoder.web.winformula.Constants;
import com.topcoder.web.winformula.algorithm.CodingConstants;
import com.topcoder.web.winformula.algorithm.services.WinFormulaServicesException;
import com.topcoder.web.winformula.algorithm.services.WinFormulaServicesImpl;

/**
 * @author dok
 * @version $Revision: 80243 $ $Date$
 */
public abstract class AlgorithmBase extends BaseProcessor {
    protected final Logger log = Logger.getLogger(getClass());
    private static final Set locks = new HashSet();
    private WinFormulaServicesImpl service = new WinFormulaServicesImpl();

    protected void businessProcessing() throws Exception {
        long st = 0;
        try {
            if (log.isDebugEnabled()) {
                st = System.currentTimeMillis();
            }
            DBUtils.initDBBlock();
            longContestProcessing();
        } finally {
            DBUtils.endDBBlock();
        }
        if (log.isDebugEnabled()) {
            log.debug("Processor took: " + (System.currentTimeMillis() - st));
        }
    }

    protected abstract void longContestProcessing() throws Exception;

    protected void lock() throws TCWebException, ServerBusyException {
        synchronized (locks) {
            if (isBusy())
                throw new ServerBusyException();
            else
                locks.add(CodingConstants.SERVER_BUSY + getSessionId());
        }
    }

    protected boolean isBusy() throws TCWebException {
        synchronized (locks) {
            return locks.contains(CodingConstants.SERVER_BUSY + getSessionId());
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

    protected String buildProcessorRequestString(String processor) {
        return buildProcessorRequestString(processor, null, null);
    }

    protected String buildProcessorRequestString(String processor, String[] keys, String[] values) {
        if (keys != null && values != null && keys.length != values.length)
            throw new IllegalArgumentException("the number of parameter keys must be the same as the number of values");

        SessionInfo info = getSessionInfo();
        StringBuilder ret = new StringBuilder(100);
        //doing this to get rid of https in the case of the login request it would be there
        ret.append(info.getAbsoluteServletPath());
        ret.append("?").append(CodingConstants.MODULE).append("=").append(processor);
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
        getResponse().getWriter().flush();

    }

    protected void closeProcessingPage(String nextPage) throws IOException {
        StringBuilder buf = new StringBuilder(500);
        buf.append("<script language=\"javascript\">");
        buf.append("top.location.replace(\'").append(nextPage).append("\');");
        buf.append("</script>");
        getResponse().getWriter().print(buf.toString());
        getResponse().flushBuffer();
    }

    protected void unlock() {
        synchronized (locks) {
            locks.remove(CodingConstants.SERVER_BUSY + getSessionId());
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
        return getDataAccess(DBMS.WINFORMULA_DATASOURCE_NAME, false);
    }

    public DataAccessInt getDataAccess(boolean cached) throws Exception {
        return getDataAccess(DBMS.WINFORMULA_DATASOURCE_NAME, cached);
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

    public DataAccessInt getDataAccess(String datasource, MaxAge maxAge) throws Exception {
        if (datasource == null) return null;
        return new CachedDataAccess(maxAge, datasource);
    }

    
    public WinFormulaServicesImpl getService() {
        return service;
    }

    protected boolean isAdmin() throws Exception {
        if (getRequest().getAttribute("admin") != null) {
            return ((Boolean) getRequest().getAttribute("admin")).booleanValue();
        }
        TCSubject subject = getSubject();
        boolean found = false;
        for (Iterator it = subject.getPrincipals().iterator(); it.hasNext() && !found;) {
            found = ((TCPrincipal) it.next()).getId() == Constants.CONTEST_ADMIN_ROLE_ID;
        }
        getRequest().setAttribute("admin", Boolean.valueOf(found));
        return found;
    }

    private TCSubject getSubject() throws GeneralSecurityException, NamingException, CreateException, RemoteException {
        if (getRequest().getAttribute("subject") != null) {
            return (TCSubject) getRequest().getAttribute("subject");
        }
        TCSubject subject = SecurityHelper.getUserSubject(getUser().getId());
        getRequest().setAttribute("subject", subject);
        return subject;
    }
    
    
    public void generateRounds() throws WinFormulaServicesException {
        //Get all rounds mini-seasons
        String initialPreviousName = "Training Camp";
        if (getRequest().getAttribute("rounds") == null) {
            ResultSetContainer rounds = getService().getRoundsByContest(getContestID());
            getRequest().setAttribute("rounds", rounds);
            Iterator<ResultSetRow> it = rounds.iterator();
            boolean futureSet = false;
            while (it.hasNext()) {
                ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow) it.next();
                getRequest().setAttribute("previousRoundName"+row.getIntItem("round_id"), initialPreviousName);
                initialPreviousName = row.getStringItem("name");
                if (row.getBooleanItem("coding_phase")) {
                    getRequest().setAttribute("currentRound", row);
                }
                if (!futureSet && row.getBooleanItem("future")) {
                    futureSet = true;
                    getRequest().setAttribute("nextRound", row);
                }
            }
        }
    }

    public int getContestID() {
        return Constants.CONTEST_ID_DEFAULT;
    }
    
    public int getComponentID() {
        return Constants.COMPONENT_ID_DEFAULT;
    }
    
    public int getUserID() throws Exception {
        String coderID = getRequest().getParameter(CodingConstants.CODER_ID);
        if (coderID != null && isAdmin()) {
            log.debug("Using coder in parameter: " + coderID);
            getRequest().setAttribute("adminExtraParams", "&"+CodingConstants.CODER_ID+"="+coderID);
            getRequest().setAttribute(CodingConstants.CODER_ID, new Integer(coderID));
            return Integer.parseInt(coderID);
        } else {
            getRequest().setAttribute("adminExtraParams", "");
            getRequest().setAttribute(CodingConstants.CODER_ID, new Integer((int) getUser().getId()));
        }
        return (int) getUser().getId();
    }
 
    
    protected boolean isUserRegisteredInContest(int contestID, int userID) throws WinFormulaServicesException {
        return getService().isUserRegisteredInContest(contestID, userID);
    }
    
    protected int resolveLanguage() throws Exception {
        if (getRequest().getParameter(CodingConstants.LANGUAGE_ID) != null) {
            return Integer.parseInt(getRequest().getParameter(CodingConstants.LANGUAGE_ID));
        }
        Integer language = getService().resolveLanguageIdForCoder(getContestID(), getUserID());
        if (language != null) {
            return language.intValue();
        }
        return JavaLanguage.ID;
    }
    
    protected void registrationNeeded(String text) {
        getRequest().setAttribute("message", text);
        setNextPage(Constants.PAGE_REG_NEEDED);
        setIsNextPageInContext(true);
    }

}

