package com.topcoder.web.query.request;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.query.common.Constants;
import com.topcoder.web.query.ejb.QueryServices.Query;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.query.common.Util;

import java.util.Enumeration;

/**
 * @author Greg Paul
 *
 */

public class QueryList extends BaseProcessor {

    private static Logger log = Logger.getLogger(QueryList.class);

    private ResultSetContainer queryList;
    private String db;

    /* Creates a new Login */
    public QueryList() {
        super();
        db = "";
    }


	protected void baseProcessing() throws Exception {

        Enumeration parameterNames = request.getParameterNames();
        while (parameterNames.hasMoreElements()) {
            String parameterName = parameterNames.nextElement().toString();
            String[] parameterValues = request.getParameterValues(parameterName);
            if (parameterValues != null) {
                setAttributes(parameterName, parameterValues);
            }
        }
 	}

    protected void businessProcessing() throws Exception {
        Query q = (Query)Util.createEJB(getInitialContext(), Query.class);
        setQueryList(q.getAllQueries(false, getDb()));
        request.setAttribute(this.getClass().getName().substring(this.getClass().getName().lastIndexOf(".")+1), this);
        setNextPage(Constants.QUERY_LIST_PAGE);
        setIsNextPageInContext(true);
    }

    public void setAttributes(String paramName, String paramValues[]) {
        String value = paramValues[0];
        value = (value == null?"":value.trim());

        if (paramName.equalsIgnoreCase(Constants.DB_PARAM))
            setDb(value);
    }

    public String getDb() {
        return db;
    }

    public void setDb(String db) {
        this.db = db;
    }

    public ResultSetContainer getQueryList() {
        return queryList;
    }

    public void setQueryList(ResultSetContainer queryList) {
        this.queryList = queryList;
    }

}


