package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.web.privatelabel.model.VerizonRegInfo;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

public class VerizonReg extends FullReg {

    protected void setNextPage() {
        setNextPage(Constants.VERIZON_REG_PAGE);
        setIsNextPageInContext(true);
    }

    protected SimpleRegInfo makeRegInfo() throws Exception {
        SimpleRegInfo ret = super.makeRegInfo();
        if (!(ret instanceof VerizonRegInfo)) {
            ret = new VerizonRegInfo(ret);
        }
        ((VerizonRegInfo)ret).setRegFull(getActiveCount(db)>Constants.MAX_VERIZON_REGISTRATIONS);
        //set a couple of additional defaults for this verizon deal
        if (ret.getCity()==null || ret.getCity().length()==0) ret.setCity("Chennai");
        if (ret.getCountryCode()==null || ret.getCountryCode().length()==0) ret.setCountryCode("356");
        return ret;
    }

    protected static int getActiveCount(String db) throws Exception {
        DataAccessInt dai = getDataAccess(db);
        Request r = new Request();
        r.setContentHandle("active count");
        ResultSetContainer rsc = (ResultSetContainer)dai.getData(r).get("active count");
        return rsc.getIntItem(0, "count");
    }
}
