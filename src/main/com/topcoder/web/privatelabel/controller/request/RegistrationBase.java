package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.security.TCSubject;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.Persistor;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;

import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.sql.DataSource;
import java.util.Iterator;
import java.util.Map;

/**
 * Provides some functionality that is basic to all registration
 * processors.
 * @author gpaul 06.26.2003
 */
abstract class RegistrationBase extends BaseProcessor {

    protected String transDb;
    protected String db;
    protected SimpleRegInfo regInfo;
    protected Persistor p;
    protected static final TCSubject CREATE_USER = new TCSubject(100000);

    protected void businessProcessing() throws TCWebException {
        try {
            p = new SessionPersistor(getRequest().getSession(true));
            //gotta do first just in case makeRegInfo() needs the database
            long companyId = Long.parseLong(getRequestParameter(Constants.COMPANY_ID));
            transDb = getCompanyDb(companyId, Constants.JTS_TRANSACTIONAL);
            db = getCompanyDb(companyId, Constants.TRANSACTIONAL);
            log.debug("trans database set to: " + transDb);
            log.debug("database set to: " + db);

            regInfo = makeRegInfo();
            p.setObject(Constants.REGISTRATION_INFO, regInfo);
            registrationProcessing();
        } catch (TCWebException e) {
            throw e;
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

    protected String getCompanyDb(long companyId, int type) throws Exception {
        Request r = new Request();
        r.setContentHandle("company_datasource");
        r.setProperty("cm", String.valueOf(companyId));
        r.setProperty("dstid", String.valueOf(type));
        //not sure if this db is ok...we'll see
        Map m = getDataAccess(DBMS.OLTP_DATASOURCE_NAME, true).getData(r);
        ResultSetContainer rsc = (ResultSetContainer)m.get("company_datasource");
        if (rsc==null || rsc.isEmpty()) {
            throw new Exception("Could not find datasource for company: " + companyId);
        } else {
            return rsc.getStringItem(0, "datasource_name");
        }
    }

    protected static DataAccessInt getDataAccess(String db) throws Exception {
        return getDataAccess(db, false);
    }

    protected static DataAccessInt getDataAccess(String datasource, boolean cached) throws Exception {
        if (datasource == null)
            throw new IllegalArgumentException("datasource name is null.");
        DataAccessInt dAccess = null;
        if (cached)
            dAccess = new CachedDataAccess(datasource);
        else
            dAccess = new DataAccess(datasource);
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
            Map map = getDataAccess(transDb, true).getData(request);
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
            Map map = getDataAccess(transDb, true).getData(request);
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

    protected boolean hasRequestParameter(String name) throws Exception {
       return getRequest().getParameter(name)!=null;
   }

    protected SimpleRegInfo getRegInfoFromPersistor() {
        //TODO return a clone
        SimpleRegInfo info = null;
        Persistor p = new SessionPersistor(getRequest().getSession(true));
        info = (SimpleRegInfo)p.getObject(Constants.REGISTRATION_INFO);
        return info;
    }

}
