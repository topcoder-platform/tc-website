package com.topcoder.web.codinginterface.longcontest.controller.request.stats;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.codinginterface.longcontest.controller.request.Base;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.tc.Constants;

/**
 * 
 * @author Cucu
 *
 */
public class CoderRank extends Base {


    public void longContestProcessing() throws Exception {

        String countryCode = StringUtils.checkNull(getRequest().getParameter(Constants.COUNTRY_CODE));
        String startRank = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
        String numRecords = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.NUMBER_RECORDS));

        if ("".equals(numRecords)) {
            numRecords = "50";
        } else if (Integer.parseInt(numRecords)>200) {
            numRecords="200";
        }

        if ("".equals(startRank)||Integer.parseInt(startRank)<=0) {
            startRank = "1";
        }

        int sr =  Integer.parseInt(startRank);
        int nr = Integer.parseInt(numRecords);
        int endRank = sr + nr - 1;


        Request r = new Request();
        r.setProperty(DataAccessConstants.START_RANK, startRank);
        r.setProperty(DataAccessConstants.END_RANK, String.valueOf(endRank));

        ResultSetContainer rsc = null;
        
        if (!"".equals(countryCode)) {
            // TO DO
            /*
            r.setContentHandle("country_algo_coder_rank");
            if (countryCode.length()!=3)  {
                throw new NavigationException("Sorry, You entered an invalid request parameter");
            }
            r.setProperty(Constants.COUNTRY_CODE, countryCode);
            r.setProperty(DataAccessConstants.SORT_QUERY, "country_algo_coder_rank");
        
            Map m = getDataAccess().getData(r);
            
            ret = (ResultSetContainer)m.get("country_algo_coder_rank");
            String countryName = ((ResultSetContainer)m.get("country_info")).getStringItem(0, "country_name");
            setDefault(Constants.COUNTRY_CODE, countryCode);
            getRequest().setAttribute("countryName", countryName);*/
            
        } else {
            r.setContentHandle("marathon_coder_rank");
            rsc = getDataAccess(DBMS.DW_DATASOURCE_NAME, true).getData(r).get("marathon_coder_rank");
        }

        setDefault(DataAccessConstants.NUMBER_RECORDS, nr);
        setDefault(DataAccessConstants.START_RANK, sr);

        getRequest().setAttribute("list", rsc);
        setNextPage("/stats/coderRank.jsp");
        setIsNextPageInContext(true);
    

    }
}
