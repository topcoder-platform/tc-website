package com.topcoder.web.query.request;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.query.common.Constants;
import com.topcoder.web.query.common.Util;
import com.topcoder.web.query.ejb.QueryServices.Query;
import com.topcoder.web.query.ejb.QueryServices.QueryInput;
import com.topcoder.web.query.ejb.QueryServices.CommandQuery;
import com.topcoder.web.common.BaseProcessor;

import java.util.Enumeration;
import java.util.List;

/**
 * @author Greg Paul
 *
 */

public class QueryDetail extends BaseProcessor {

    private static Logger log = Logger.getLogger(QueryDetail.class);

    private String db;
    private String queryText;
    private String queryName;
    private boolean rankingQuery;
    private int columnIndex;
    private ResultSetContainer inputList;
    private int queryId;
    private List commandList;

    /* Creates a new Login */
    public QueryDetail() {
        super();
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
        QueryInput qi = (QueryInput)Util.createEJB(getInitialContext(), QueryInput.class);
        Query q = (Query)Util.createEJB(getInitialContext(), Query.class);
        CommandQuery cq = (CommandQuery)Util.createEJB(getInitialContext(), CommandQuery.class);

        setQueryText(q.getText(getQueryId(), getDb()));
        setQueryName(q.getName(getQueryId(), getDb()));
        setRankingQuery(q.getRanking(getQueryId(), getDb())==1?true:false);
        setColumnIndex(q.getColumnIndex(getQueryId(), getDb()));
        setInputList(qi.getInputsForQuery(getQueryId(), getDb()));
        setCommandList(cq.getCommandsForQuery(getQueryId(), getDb()));

        request.setAttribute(this.getClass().getName().substring(this.getClass().getName().lastIndexOf(".")+1), this);
        setNextPage(Constants.QUERY_DETAIL_PAGE);
        setIsNextPageInContext(true);
    }

    public void setAttributes(String paramName, String paramValues[]) {
        String value = paramValues[0];
        value = (value == null?"":value.trim());

        if (paramName.equalsIgnoreCase(Constants.DB_PARAM))
            setDb(value);
        else if (paramName.equalsIgnoreCase(Constants.QUERY_ID_PARAM))
            setQueryId(Integer.parseInt(value));
    }

    public String getDb() {
        return db;
    }

    public void setDb(String db) {
        this.db = db;
    }

    public String getQueryText() {
        return queryText;
    }

    public void setQueryText(String queryText) {
        this.queryText = queryText;
    }

    public String getQueryName() {
        return queryName;
    }

    public void setQueryName(String queryName) {
        this.queryName = queryName;
    }

    public int getColumnIndex() {
        return columnIndex;
    }

    public void setColumnIndex(int columnIndex) {
        this.columnIndex = columnIndex;
    }

    public boolean isRankingQuery() {
        return rankingQuery;
    }

    public void setRankingQuery(boolean rankingQuery) {
        this.rankingQuery = rankingQuery;
    }

    public ResultSetContainer getInputList() {
        return inputList;
    }

    public void setInputList(ResultSetContainer inputList) {
        this.inputList = inputList;
    }

    public int getQueryId() {
        return queryId;
    }

    public void setQueryId(int queryId) {
        this.queryId = queryId;
    }

    public List getCommandList() {
        return commandList;
    }

    public void setCommandList(List commandList) {
        this.commandList = commandList;
    }

}


