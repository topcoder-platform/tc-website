package com.topcoder.web.winformula.controller.request;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.util.DBMS;
import com.topcoder.util.format.ObjectFormatter;
import com.topcoder.util.format.ObjectFormatterFactory;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.winformula.Constants;

/**
 * Copyright (c) 2001-2008 TopCoder, Inc. All rights reserved.
 * Only for use in connection with a TopCoder competition.
 *
 * @author pulky
 * @version $Id$
 * Create Date: Aug 5, 2008
 */
public class CurrentPredictions extends BaseProcessor {

    public static final String FULL_LIST = "full";

    protected void businessProcessing() throws Exception {
        // get data from DB
        ResultSetContainer rsc = getData();

        // sort result
        sortResult(rsc);

        getRequest().setAttribute("list", makeList(rsc));

        // crop result
        rsc = cropResult(rsc);

        getRequest().setAttribute("results", rsc);
        
        getRequest().setAttribute("customRenderer", new SimpleEvenOddRowRenderer());

        List formatters = new ArrayList();
        
        ObjectFormatter a = ObjectFormatterFactory.getEmptyFormatter();
        
        DecimalFormat formatter = new DecimalFormat("000");

        setNextPage("/latestPrediction.jsp");
        setIsNextPageInContext(true);
    }
    
    private List<List<String>> makeList(ResultSetContainer rsc) {
        List list = new ArrayList<String>(rsc.size());
        for (ResultSetRow rsr : rsc) {
            List<String> temp = new ArrayList<String>(3);
            temp.add(rsr.getStringItem("home"));
            temp.add("<strong>"+ rsr.getStringItem("visitor") + "<strong>");
            temp.add(rsr.getStringItem("home_pred") + "- " + rsr.getStringItem("visitor_pred"));
            list.add(temp);
        }
        return list;
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

        if (!full) {
            // crops data
            rsc = new ResultSetContainer(rsc, Integer.parseInt(startRank), endRank);
        }
            
        getRequest().setAttribute(FULL_LIST, full);
        return rsc;
    }

}