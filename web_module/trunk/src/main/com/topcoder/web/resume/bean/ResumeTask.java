package com.topcoder.web.resume.bean;

import com.topcoder.servlet.request.FileUpload;
import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;

import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.sql.DataSource;
import java.util.Map;

public abstract class ResumeTask {
    private static Logger log = Logger.getLogger(ResumeTask.class);

    private InitialContext ctx;
    private String nextPage;
    private FileUpload fileUpload;
    private boolean nextPageInternal;
    protected long companyId = -1;
    protected String db = DBMS.OLTP_DATASOURCE_NAME;

    public ResumeTask() {
        setInitialContext(null);
        setNextPage(null);
        setFileUpload(null);
        setNextPageInternal(true);
    }

    public abstract void processStep(String step) throws Exception;

    public void setInitialContext(InitialContext ctx) {
        this.ctx = ctx;
    }

    public InitialContext getInitialContext() {
        return ctx;
    }

    public void setNextPage(String nextPage) {
        this.nextPage = nextPage;
    }

    public String getNextPage() {
        return nextPage;
    }

    public FileUpload getFileUpload() {
        return fileUpload;
    }

    public void setFileUpload(FileUpload fileUpload) {
        this.fileUpload = fileUpload;
    }

    public void setNextPageInternal(boolean nextPageInternal) {
        this.nextPageInternal = nextPageInternal;
    }

    public boolean getNextPageInternal() {
        return this.nextPageInternal;
    }

    protected String getCompanyDb(long companyId) throws Exception {
        Request r = new Request();
        r.setContentHandle("company_datasource");
        r.setProperty("cm", String.valueOf(companyId));
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
        InitialContext context = new InitialContext();
        DataSource ds = (DataSource)
                PortableRemoteObject.narrow(context.lookup(datasource),
                        DataSource.class);
        BaseProcessor.close(context);
        DataAccessInt dAccess = null;
        if (cached)
            dAccess = new CachedDataAccess(ds);
        else
            dAccess = new DataAccess(ds);
        return dAccess;
    }

}
