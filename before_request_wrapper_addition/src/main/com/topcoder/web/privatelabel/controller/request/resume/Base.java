package com.topcoder.web.privatelabel.controller.request.resume;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.servlet.request.FileUpload;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.rmi.PortableRemoteObject;
import java.util.Map;

abstract public class Base extends BaseProcessor {

    protected FileUpload file;
    private static final int TRANSACTIONAL = 2;

    abstract protected void businessProcessing() throws TCWebException;

    public void setFileUpload(FileUpload fu) {
        this.file = fu;
    }



    protected String getDb() throws Exception {

        long companyId;
        String cid = null;
        if (file == null) {
            cid = getRequest().getParameter(Constants.COMPANY_ID);
        } else {
            cid = file.getParameter(Constants.COMPANY_ID);
        }
        if (cid!=null) {
            companyId = Long.parseLong(cid);
        } else {
            throw new Exception("Company id missing from request");
        }

        Request r = new Request();
        r.setContentHandle("company_datasource");
        r.setProperty("cm", String.valueOf(companyId));
        r.setProperty("dstid", String.valueOf(TRANSACTIONAL));
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

}
