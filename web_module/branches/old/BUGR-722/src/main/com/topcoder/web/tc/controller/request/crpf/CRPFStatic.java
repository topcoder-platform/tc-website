package com.topcoder.web.tc.controller.request.crpf;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.tc.controller.request.Static;

import java.util.Map;

public class CRPFStatic extends Static {

    public void businessProcessing() throws Exception {
        Request r = new Request();
        r.setContentHandle("crpf_donation_total");

        CachedDataAccess da = (CachedDataAccess) getDataAccess(true);
        Map m = da.getData(r);
        ResultSetContainer rsc1 = (ResultSetContainer) m.get("crpf_donation_total");
        getRequest().setAttribute("donationTotal", rsc1);
        super.businessProcessing();


    }
}
