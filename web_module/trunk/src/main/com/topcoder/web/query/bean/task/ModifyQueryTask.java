package com.topcoder.web.query.bean.task;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.query.common.AuthenticationException;
import com.topcoder.web.query.common.Constants;
import com.topcoder.web.query.ejb.QueryServices.Query;
import com.topcoder.web.query.ejb.QueryServices.QueryHome;
import com.topcoder.web.common.BaseProcessor;

import java.util.Enumeration;

/**
 * @author Greg Paul
 *
 */

public class ModifyQueryTask extends BaseProcessor {

    private static Logger log = Logger.getLogger(ModifyQueryTask.class);

    private String db;
    private long queryId;
    private boolean ranking;
    private int columnIndex;
    private String text;
    private String name;

    /* Creates a new LoginTask */
    public ModifyQueryTask() {
        super();
        db = "";
        queryId = 0;
        ranking = false;
        columnIndex = 0;
        text = "";
        name = "";
    }


	protected void baseProcessing() throws Exception {
        if (userIdentified()) {
            throw new AuthenticationException("User not authenticated for access to query tool resource.");
        }
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
        String step = request.getParameter(Constants.STEP_PARAM);
        QueryHome qHome = (QueryHome) getInitialContext().lookup(ApplicationServer.Q_QUERY);
        Query q = qHome.create();

        if (step!=null && step.equals(Constants.SAVE_STEP)) {
            if (isRanking()) {
                checkColumnIndex(getColumnIndex());
            } else {
                setColumnIndex(q.getColumnIndex(getQueryId(), getDb()));
            }
            checkText(getText());
            checkName(getName());
            checkQueryId(getQueryId(), q);
            if (!super.hasErrors()) {
                if (isNewQuery()) {
                    setQueryId(q.createQuery(getText(), getName(), isRanking()?1:0, getDb()));
                    if (isRanking()) {
                        q.setColumnIndex(getQueryId(), getColumnIndex(), getDb());
                    }
                } else {
                    if (isRanking()) {
                        q.setColumnIndex(getQueryId(), getColumnIndex(), getDb());
                    }
                    q.setText(getQueryId(), getText(), getDb());
                    q.setName(getQueryId(), getName(), getDb());
                    q.setRanking(getQueryId(), isRanking()?1:0, getDb());
                }
            }
        } else {
            if (!isNewQuery()) {
                setColumnIndex(q.getColumnIndex(getQueryId(), getDb()));
                setText(q.getText(getQueryId(), getDb()));
                setName(q.getName(getQueryId(), getDb()));
                setRanking(q.getRanking(getQueryId(), getDb())==1?true:false);
            }

        }

        super.setNextPage(Constants.MODIFY_QUERY_PAGE);
    }

    public void setAttributes(String paramName, String paramValues[]) {
        String value = paramValues[0];
        value = (value == null?"":value.trim());
        log.debug("setAttributes called...param: " + paramName + " value: " + value);

        if (paramName.equalsIgnoreCase(Constants.DB_PARAM)) {
            setDb(value);
        } else if (paramName.equalsIgnoreCase(Constants.QUERY_ID_PARAM)) {
            try {
                setQueryId(Long.parseLong(value));
            } catch (NumberFormatException e) {
                super.addError(paramName, e);
            }
        } else if (paramName.equalsIgnoreCase(Constants.QUERY_NAME_PARAM)) {
            setName(value);
        } else if (paramName.equalsIgnoreCase(Constants.RANKING_PARAM)) {
            setRanking(value.equalsIgnoreCase("true"));
        } else if (paramName.equalsIgnoreCase(Constants.COLUMN_INDEX_PARAM)) {
            try {
                setColumnIndex(Integer.parseInt(value));
            } catch (NumberFormatException e) {
                super.addError(paramName, e);
            }
        } else if (paramName.equalsIgnoreCase(Constants.QUERY_TEXT_PARAM)) {
            setText(value);
        }

    }

    private void checkName(String name) {
        if (super.isEmpty(name)) {
            super.addError(Constants.QUERY_NAME_PARAM, "You must specify a query name");
        } else if (name.length() > 100) {
            super.addError(Constants.QUERY_NAME_PARAM, "Invalid Query Name, too long");
        }
    }

    private void checkColumnIndex(int columnIndex) {
        if (columnIndex < 1) {
            super.addError(Constants.COLUMN_INDEX_PARAM, "Invalid column Index, must be greater than 0");
        } else if (columnIndex > 999) {  //somewhat arbitrary, but i think reasonable
            super.addError(Constants.COLUMN_INDEX_PARAM, "Invalid column Index, must be less than 1000");
        }
    }

    private void checkText(String text) {
        if (super.isEmpty(text)) {
            super.addError(Constants.QUERY_TEXT_PARAM, "No query specified");
        } else if (!text.trim().toLowerCase().startsWith("select")) {
            super.addError(Constants.QUERY_TEXT_PARAM, "Invalid query entered");
        } else if (!(text.toLowerCase().indexOf("from") > -1)) {
            super.addError(Constants.QUERY_TEXT_PARAM, "Invalid query entered");
        }
    }

    private void checkQueryId(long queryId, Query q) throws Exception {
        if (!isNewQuery()) {
            if (q.getName(queryId, getDb())==null) {
                super.addError(Constants.QUERY_ID_PARAM, "Invalid query id");
            }
        }
    }

    public boolean isNewQuery() {
        return getQueryId()==0;
    }

    public String getDb() {
        return db;
    }

    public void setDb(String db) {
        this.db = db;
    }

    public long getQueryId() {
        return queryId;
    }

    public void setQueryId(long queryId) {
        this.queryId = queryId;
    }

    public boolean isRanking() {
        return ranking;
    }

    public void setRanking(boolean ranking) {
        this.ranking = ranking;
    }

    public int getColumnIndex() {
        return columnIndex;
    }

    public void setColumnIndex(int columnIndex) {
        this.columnIndex = columnIndex;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}


