package com.topcoder.web.winformula.controller.request;

import java.rmi.RemoteException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import javax.ejb.CreateException;
import javax.naming.NamingException;

import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.TCPrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.server.util.DBUtils;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
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

/**
 * @author dok
 * @version $Revision: 72590 $ $Date$
 */
public abstract class StatsBase extends BaseProcessor {
    protected final Logger log = Logger.getLogger(getClass());
    private static final Set locks = new HashSet();

    protected void businessProcessing() throws Exception {
        long st = 0;
        try {
            if (log.isDebugEnabled()) {
                st = System.currentTimeMillis();
            }
            DBUtils.initDBBlock();
            statsProcessing();
        } finally {
            DBUtils.endDBBlock();
        }
        if (log.isDebugEnabled()) {
            log.debug("Processor took: " + (System.currentTimeMillis() - st));
        }
    }

    protected abstract void statsProcessing() throws Exception;

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

    protected void unlock() {
        synchronized (locks) {
            locks.remove(CodingConstants.SERVER_BUSY + getSessionId());
        }
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
     

}

