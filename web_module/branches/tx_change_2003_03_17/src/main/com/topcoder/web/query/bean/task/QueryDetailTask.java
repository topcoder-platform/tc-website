package com.topcoder.web.query.bean.task;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.query.common.AuthenticationException;
import com.topcoder.web.query.common.Constants;
import com.topcoder.web.query.ejb.QueryServices.Query;
import com.topcoder.web.query.ejb.QueryServices.QueryHome;
import com.topcoder.web.query.ejb.QueryServices.QueryInput;
import com.topcoder.web.query.ejb.QueryServices.QueryInputHome;
import com.topcoder.web.query.bean.task.BaseTask;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.Serializable;

/**
 * @author Greg Paul
 *
 */

public class QueryDetailTask extends BaseTask implements Task, Serializable {

    private static Logger log = Logger.getLogger(QueryDetailTask.class);

    private String db;
    private String queryText;
    private String queryName;
    private boolean rankingQuery;
    private int columnIndex;
    private ResultSetContainer inputList;
    private int queryId;

    /* Creates a new LoginTask */
    public QueryDetailTask() {
        super();
    }

	public void servletPreAction(HttpServletRequest request, HttpServletResponse response)
            throws AuthenticationException, Exception {
        super.servletPreAction(request, response);
        if (!super.getAuthentication().isLoggedIn()) {
            throw new AuthenticationException("User not authenticated for access to query tool resource.");
        }
	}

    public void process(String step) throws Exception {
        QueryInputHome qiHome = (QueryInputHome) getInitialContext().lookup(ApplicationServer.Q_QUERY_INPUT);
        QueryInput qi = qiHome.create();

        QueryHome qHome = (QueryHome) getInitialContext().lookup(ApplicationServer.Q_QUERY);
        Query q = qHome.create();

        setQueryText(q.getText(getQueryId(), getDb()));
        setQueryName(q.getName(getQueryId(), getDb()));
        setRankingQuery(q.getRanking(getQueryId(), getDb())==1?true:false);
        setColumnIndex(q.getColumnIndex(getQueryId(), getDb()));
        setInputList(qi.getInputsForQuery(getQueryId(), getDb()));

        super.setNextPage(Constants.QUERY_DETAIL_PAGE);
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


}


