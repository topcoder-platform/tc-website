package com.topcoder.web.tc.controller.legacy.resume.bean;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.tc.controller.request.Base;

import java.util.Map;

public abstract class ResumeTask extends Base {
    private static Logger log = Logger.getLogger(ResumeTask.class);

    protected long companyId = -1;
    protected String db = DBMS.OLTP_DATASOURCE_NAME;

    public long getCompanyId() {
        return companyId;
    }

    public boolean hasCompany() {
        return companyId > 0;
    }

    public void setCompanyId(long companyId) {
        this.companyId = companyId;
    }

    protected String getCompanyDb(long companyId) throws Exception {
        Request r = new Request();
        r.setContentHandle("company_datasource");
        r.setProperty("cm", String.valueOf(companyId));
        r.setProperty("dstid", "2");  //non jts transactional datasource
        //not sure if this db is ok...we'll see
        Map m = getDataAccess(DBMS.OLTP_DATASOURCE_NAME, true).getData(r);
        ResultSetContainer rsc = (ResultSetContainer) m.get("company_datasource");
        if (rsc == null || rsc.isEmpty()) {
            throw new Exception("Could not find datasource for company: " + companyId);
        } else {
            return rsc.getStringItem(0, "datasource_name");
        }
    }

}
