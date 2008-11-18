package com.topcoder.web.codinginterface.longcontest.controller.request.stats;

import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.codinginterface.longcontest.controller.request.Base;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.codinginterface.longcontest.Constants;

/**
 * 
 * @author Cucu
 *
 */
public class CoderRank extends Base {


    public void longContestProcessing() throws Exception {

        String countryCode = StringUtils.checkNull(getRequest().getParameter(Constants.COUNTRY_CODE));
        String schoolId = StringUtils.checkNull(getRequest().getParameter(Constants.SCHOOL_ID));
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
        String page = Constants.PAGE_CODER_RANK;
            
        if (!"".equals(countryCode)) {
            r.setContentHandle("marathon_country_coder_rank");
            r.setProperty(Constants.COUNTRY_CODE, countryCode);
            Map<String, ResultSetContainer> results = getDataAccess(DBMS.DW_DATASOURCE_NAME, false).getData(r);
            ResultSetContainer countryInfo = results.get("country_info");
            if (countryInfo.size() != 1) {
                throw new NavigationException("Country with code " + countryCode + " not found");
            }
            
            getRequest().setAttribute("countryName", countryInfo.getStringItem(0, "country_name"));
            rsc = results.get("marathon_country_coder_rank");
            setDefault(Constants.COUNTRY_CODE, countryCode);
        
        
        } else if (!"".equals(schoolId)) {
            r.setContentHandle("marathon_school_coder_rank");
            r.setProperty(Constants.SCHOOL_ID, schoolId);
            Map<String, ResultSetContainer> results = getDataAccess(DBMS.DW_DATASOURCE_NAME, false).getData(r);
            ResultSetContainer info = results.get("school_info");
            if (info.size() != 1) {
                throw new NavigationException("School " + schoolId + " not found");
            }
            
            getRequest().setAttribute("schoolName", info.getStringItem(0, "name"));
            rsc = results.get("marathon_school_coder_rank");
            setDefault(Constants.SCHOOL_ID, schoolId);
            page = Constants.PAGE_SCHOOL_CODER_RANK;
        } else {
        
            // Just use cache for standard pages of 50 rows starting in 1, 51, 101... 
            boolean cached = (nr == 50) && ((sr % 50) == 1); 

            r.setContentHandle("marathon_coder_rank");
            rsc = getDataAccess(DBMS.DW_DATASOURCE_NAME, cached).getData(r).get("marathon_coder_rank");
        }

        setDefault(DataAccessConstants.NUMBER_RECORDS, nr);
        setDefault(DataAccessConstants.START_RANK, sr);

        getRequest().setAttribute("list", rsc);
        setNextPage(page);
        setIsNextPageInContext(true);
    

    }
}
