package com.topcoder.web.tc.controller.request.crpf;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.Constants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import java.util.Map;

public class Report extends Base {
    public void businessProcessing() throws TCWebException {
        Request r = new Request();
        r.setContentHandle("crpf_donation_list");

        String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

        if (!(sortCol.equals("") || sortDir.equals(""))) {
            r.setProperty(DataAccessConstants.SORT_DIRECTION,
                    StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION)));
            r.setProperty(DataAccessConstants.SORT_COLUMN,
                    StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN)));
            r.setProperty(DataAccessConstants.SORT_QUERY, "crpf_donation_list");
        }

        try {
            CachedDataAccess da = (CachedDataAccess)getDataAccess(true);
            da.setExpireTime(30*60*1000); //30 minutes should be sufficient
            Map m = da.getData(r);
            ResultSetContainer rsc = (ResultSetContainer)m.get("crpf_donation_list");
            SortInfo s = new SortInfo();
            s.addDefault(rsc.getColumnIndex("rank"), "asc");
            s.addDefault(rsc.getColumnIndex("handle"), "asc");
            s.addDefault(rsc.getColumnIndex("rating"), "desc");
            s.addDefault(rsc.getColumnIndex("amount"), "desc");
            getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
            getRequest().setAttribute("donationInfo", m.get("crpf_donation_list"));
        } catch (Exception e) {
            throw new TCWebException(e);
        }
        setNextPage(Constants.CRPF_REPORT);
        setIsNextPageInContext(true);

    }

}
