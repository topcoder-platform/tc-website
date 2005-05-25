package com.topcoder.web.tc.controller.request.statistics;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.tc.Constants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: May 25, 2005
 */
public class AlgoRank extends Base {



    public void businessProcessing() throws Exception {
        String countryCode = StringUtils.checkNull(getRequest().getParameter(Constants.COUNTRY_CODE));
        String schoolId = StringUtils.checkNull(getRequest().getParameter(Constants.SCHOOL_ID));

        Request r = new Request();
        ResultSetContainer ret = null;
        if (!"".equals(countryCode)) {
            r.setContentHandle("country_algo_coder_rank");
            if (countryCode.length()!=3)  {
                throw new NavigationException("Sorry, You entered an invalid request parameter");
            }
            r.setProperty(Constants.COUNTRY_CODE, countryCode);
            ret = (ResultSetContainer)getDataAccess().getData(r).get("country_algo_coder_rank");
        } else if (!"".equals(schoolId)) {
            r.setContentHandle("school_algo_coder_rank");
            r.setProperty(Constants.SCHOOL_ID, schoolId);
            ret = (ResultSetContainer)getDataAccess().getData(r).get("school_algo_coder_rank");
        } else {
            r.setContentHandle("coder_ratings");
            ret = (ResultSetContainer)getDataAccess().getData(r).get("Coder_Ratings");
        }

        getRequest().setAttribute("list", ret);
        setNextPage("/statistics/algorithmRankList.jsp");
        setIsNextPageInContext(true);


    }
}
