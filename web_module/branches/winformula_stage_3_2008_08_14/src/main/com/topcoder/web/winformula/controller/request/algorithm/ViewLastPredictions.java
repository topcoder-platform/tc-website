/*
 * ViewLastPredictions
 * 
 * Created Aug 8, 2008
 */
package com.topcoder.web.winformula.controller.request.algorithm;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.winformula.Constants;
import com.topcoder.web.winformula.controller.request.AlgorithmBase;

/**
 * @autor Diego Belfer (Mural), Pablo Wolfus (pulky)
 * @version $Id$
 */
public class ViewLastPredictions extends AlgorithmBase {
    protected static final Logger log = Logger.getLogger(ViewLastPredictions.class);

    public static final String FULL_LIST = "full";

    protected void longContestProcessing() throws Exception {
        try {
            // get data from DB
            ResultSetContainer rsc = getData();
    
            // sort result
            sortResult(rsc);
    
            // crop result
            rsc = cropResult(rsc);
    
            getRequest().setAttribute("results", rsc);
            
            setNextPage(Constants.PAGE_LAST_PREDICTIONS);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
    
    private ResultSetContainer getData() throws Exception {
        Request r = new Request();
        r.setContentHandle("latest_user_prediction");
        r.setProperty(Constants.USER_ID, String.valueOf(getUser().getId()));

        DataAccessInt dai = new CachedDataAccess(DBMS.WINFORMULA_DATASOURCE_NAME);
        return dai.getData(r).get("latest_user_prediction");
    }

    /**
     * Sorts the result as specified
     * 
     * @param rsc the resultsetcontainter to sort
     */
    private void sortResult(ResultSetContainer rsc) {
        String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
        if (!(sortCol.equals("")) && rsc != null) {
            rsc.sortByColumn(Integer.parseInt(sortCol), !"desc".equals(sortDir));
            setDefault(DataAccessConstants.SORT_COLUMN, sortCol);
            setDefault(DataAccessConstants.SORT_DIRECTION, sortDir);
        }
        setSortInfo(rsc);
    }

    /**
     * Sets sort information
     * 
     * @param rsc
     */
    private void setSortInfo(ResultSetContainer rsc) {
        SortInfo s = new SortInfo();
        s.addDefault(rsc.getColumnIndex("home"), "asc");
        s.addDefault(rsc.getColumnIndex("visitor"), "asc");
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
   }
    
    /**
     * Crops the result as specified
     * 
     * @param rsc the resultsetcontainter to crop
     * @throws Exception
     */
    private ResultSetContainer cropResult(ResultSetContainer rsc) throws Exception {
        Boolean full = "true".equals(StringUtils.checkNull(getRequest().getParameter(FULL_LIST)));

        String startRank = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
        String numRecords = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.NUMBER_RECORDS));

        if ("".equals(numRecords)) {
            numRecords = "10";
        } else if (Integer.parseInt(numRecords) > 200) {
            numRecords = "200";
        }
   
        if (startRank.equals("") || Integer.parseInt(startRank) <= 0) {
            startRank = "1";
        }
   
        setDefault(DataAccessConstants.START_RANK, startRank);
        setDefault(DataAccessConstants.NUMBER_RECORDS, numRecords);
   
        int endRank = Integer.parseInt(startRank) + Integer.parseInt(numRecords) - 1;

        int sizeBeforeCrop = rsc.size();
        getRequest().setAttribute("totalSize", sizeBeforeCrop);
        
        if (!full) {
            // crops data
            rsc = new ResultSetContainer(rsc, Integer.parseInt(startRank), endRank);
        }
            
        getRequest().setAttribute("croppedDataBefore", new Boolean(Integer.parseInt(startRank) > 1));
        getRequest().setAttribute("croppedDataAfter", new Boolean(sizeBeforeCrop > Integer.parseInt(startRank) + rsc.size()));

        getRequest().setAttribute(FULL_LIST, full);
        return rsc;
    }
}
