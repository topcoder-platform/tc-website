package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.Persistor;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.security.TCSubject;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.security.admin.PrincipalMgrRemote;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.rmi.PortableRemoteObject;
import java.util.Map;
import java.util.Iterator;

/**
 * Provides some functionality that is basic to all registration
 * processors.
 * @author gpaul 06.26.2003
 */
abstract class RegistrationBase extends BaseProcessor {

    protected String db;
    protected SimpleRegInfo regInfo;
    private Persistor p;
    protected static final TCSubject CREATE_USER = new TCSubject(100000);

    protected final void businessProcessing() throws TCWebException {
        try {
            p = new SessionPersistor(getRequest().getSession(true));
            regInfo = makeRegInfo();
            p.setObject(Constants.REGISTRATION_INFO, regInfo);
            db = getCompanyDb(regInfo.getCompanyId());
            registrationProcessing();
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    protected void clearRegInfo() {
        regInfo = null;
        p.removeObject(Constants.REGISTRATION_INFO);
    }

    /**
     * makeRegInfo() will be called before registrationProcessing()
     * is called in child classes.
     * @return
     */
    protected abstract SimpleRegInfo makeRegInfo() throws Exception;

    /**
     * subclasses must implement this method to do their
     * request processing.  this is where the meat goes.
     * @throws TCWebException
     */
    protected abstract void registrationProcessing() throws TCWebException;

    private String getCompanyDb(long companyId) throws Exception {
        Request r = new Request();
        r.setContentHandle("company_datasource");
        r.setProperty("cm", String.valueOf(companyId));
        Map m = getDataAccess(true).getData(r);
        ResultSetContainer rsc = (ResultSetContainer)m.get("company_datasource");
        if (rsc==null || rsc.isEmpty()) {
            throw new Exception("Could not find datasource for company: " + companyId);
        } else {
            return rsc.getStringItem(0, "datasource_name");
        }
    }

    public DataAccessInt getDataAccess() throws Exception {
        return getDataAccess(db, false);
    }

    public DataAccessInt getDataAccess(boolean cached) throws Exception {
        return getDataAccess(db, cached);
    }

    public DataAccessInt getDataAccess(String datasource, boolean cached) throws Exception {
        if (datasource == null) return null;
        InitialContext context = new InitialContext();
        DataSource ds = (DataSource)
                PortableRemoteObject.narrow(context.lookup(datasource),
                        DataSource.class);
        close(context);
        DataAccessInt dAccess = null;
        if (cached)
            dAccess = new CachedDataAccess(ds);
        else
            dAccess = new DataAccess(ds);
        return dAccess;
    }

    protected String findState(String stateCode) throws TCWebException {
        ResultSetContainer list = getStateList();
        ResultSetContainer.ResultSetRow row = null;
        for (Iterator it = list.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow) it.next();
            if (row.getItem("state_code").toString().equals(stateCode))
                return row.getItem("state_name").toString();
        }
        return null;
    }

    protected String findCountry(String countryCode) throws TCWebException {
        ResultSetContainer list = getCountryList();
        ResultSetContainer.ResultSetRow row = null;
        for (Iterator it = list.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow) it.next();
            if (row.getItem("country_code").toString().equals(countryCode))
                return row.getItem("country_name").toString();
        }
        return null;
    }

    protected ResultSetContainer getCountryList() throws TCWebException {
        try {
            Request request = new Request();
            request.setContentHandle("country_list");
            Map map = getDataAccess(true).getData(request);
            if (map == null)
                throw new Exception("error getting country list from db");
            else
                return (ResultSetContainer) map.get("country_list");
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    protected ResultSetContainer getStateList() throws TCWebException {
        try {
            Request request = new Request();
            request.setContentHandle("state_list");
            Map map = getDataAccess(true).getData(request);
            if (map == null)
                throw new Exception("error getting state list from db");
            else
                return (ResultSetContainer) map.get("state_list");
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    protected final PrincipalMgrRemote getPrincipalManager() throws Exception {
        InitialContext ctx = null;
        try {
            ctx = (InitialContext) TCContext.getContext(
                    ApplicationServer.SECURITY_CONTEXT_FACTORY,
                    ApplicationServer.SECURITY_PROVIDER_URL);
            PrincipalMgrRemoteHome rHome = (PrincipalMgrRemoteHome)
                    ctx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);

            PrincipalMgrRemote mgr = rHome.create();
            return mgr;
        } finally {
            close(ctx);
        }

    }

     protected String getRequestParameter(String name) throws Exception {
        String ret = null;
        ret = getRequest().getParameter(name);
        return ret;
    }

    protected SimpleRegInfo getRegInfoFromPersistor() {
        //TODO return a clone
        SimpleRegInfo info = null;
        Persistor p = new SessionPersistor(getRequest().getSession(true));
        info = (SimpleRegInfo)p.getObject(Constants.REGISTRATION_INFO);
        return info;
    }

}
