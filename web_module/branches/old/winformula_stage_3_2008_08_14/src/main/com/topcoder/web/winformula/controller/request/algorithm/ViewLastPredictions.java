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
        if (sortCol.equals("")) {
            sortCol = "5";
            sortDir = "asc";
        }
        if (rsc != null) {
            rsc.sortByColumn(Integer.parseInt(sortCol), !"desc".equals(sortDir));
        }
        setDefault(DataAccessConstants.SORT_COLUMN, sortCol);
        setDefault(DataAccessConstants.SORT_DIRECTION, sortDir);
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
        String numPage = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.NUMBER_PAGE));
        String numRecords = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.NUMBER_RECORDS));

        int sizeBeforeCrop = rsc.size();

        if (!"25".equals(numRecords) &&
                !"50".equals(numRecords) &&
                !String.valueOf(sizeBeforeCrop).equals(numRecords)) {
            numRecords = "10";
        }
   
        if (numPage.equals("") || Integer.parseInt(numPage) <= 0) {
            numPage = "1";
        }
   
        setDefault(DataAccessConstants.NUMBER_PAGE, numPage);
        setDefault(DataAccessConstants.NUMBER_RECORDS, numRecords);
   
        rsc = new ResultSetContainer(rsc, 
                getStartRank(Integer.parseInt(numPage), Integer.parseInt(numRecords)), 
                getEndRank(Integer.parseInt(numPage), Integer.parseInt(numRecords)));

        getRequest().setAttribute("totalSize", sizeBeforeCrop);
        getRequest().setAttribute("croppedDataBefore", rsc.croppedDataBefore());
        getRequest().setAttribute("croppedDataAfter", rsc.croppedDataAfter());

        return rsc;
    }

    private int getStartRank(int numPage, int numRecords) {
        return (numPage - 1) * numRecords + 1;
    }

    private int getEndRank(int numPage, int numRecords) {
        return numPage * numRecords + 1;
    }
}
