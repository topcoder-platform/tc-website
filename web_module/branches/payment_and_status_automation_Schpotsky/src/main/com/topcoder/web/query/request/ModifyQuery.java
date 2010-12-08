package com.topcoder.web.query.request;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.query.Query;
import com.topcoder.web.query.common.Constants;

import java.util.Enumeration;

/**
 * @author Greg Paul
 *
 */

public class ModifyQuery extends BaseProcessor {

    private static Logger log = Logger.getLogger(ModifyQuery.class);

    private String db;
    private long queryId;
    private boolean ranking;
    private int columnIndex;
    private String text;
    private String name;

    /* Creates a new Login */
    public ModifyQuery() {
        super();
        db = "";
        queryId = 0;
        ranking = false;
        columnIndex = 0;
        text = "";
        name = "";
    }


    protected void baseProcessing() throws TCWebException {
        super.baseProcessing();
        Enumeration parameterNames = getRequest().getParameterNames();
        while (parameterNames.hasMoreElements()) {
            String parameterName = parameterNames.nextElement().toString();
            String[] parameterValues = getRequest().getParameterValues(parameterName);
            if (parameterValues != null) {
                setAttributes(parameterName, parameterValues);
            }
        }
    }

    protected void businessProcessing() throws TCWebException {
        String step = getRequest().getParameter(Constants.STEP_PARAM);
        try {
            Query q = (Query) createEJB(getInitialContext(), Query.class);


            if (step != null && step.equals(Constants.SAVE_STEP)) {
                if (isRanking()) {
                    checkColumnIndex(getColumnIndex());
                } else {
                    setColumnIndex(q.getColumnIndex(getQueryId(), getDb()));
                }
                checkText(getText());
                checkName(getName());
                checkQueryId(getQueryId(), q);
                if (!hasErrors()) {
                    if (isNewQuery()) {
                        setQueryId(q.createQuery(getText(), getName(), isRanking() ? 1 : 0, getDb()));
                        if (isRanking()) {
                            q.setColumnIndex(getQueryId(), getColumnIndex(), getDb());
                        }
                    } else {
                        if (isRanking()) {
                            q.setColumnIndex(getQueryId(), getColumnIndex(), getDb());
                        }
                        q.setText(getQueryId(), getText(), getDb());
                        q.setName(getQueryId(), getName(), getDb());
                        q.setRanking(getQueryId(), isRanking() ? 1 : 0, getDb());
                    }
                }
            } else {
                if (!isNewQuery()) {
                    setColumnIndex(q.getColumnIndex(getQueryId(), getDb()));
                    setText(q.getText(getQueryId(), getDb()));
                    setName(q.getName(getQueryId(), getDb()));
                    setRanking(q.getRanking(getQueryId(), getDb()) == 1 ? true : false);
                }

            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw(new TCWebException(e));
        }

        getRequest().setAttribute(this.getClass().getName().substring(this.getClass().getName().lastIndexOf(".") + 1), this);
        setNextPage(Constants.MODIFY_QUERY_PAGE);
        setIsNextPageInContext(true);
    }

    public void setAttributes(String paramName, String paramValues[]) {
        String value = paramValues[0];
        value = (value == null ? "" : value.trim());
        log.debug("setAttributes called...param: " + paramName + " value: " + value);

        if (paramName.equalsIgnoreCase(Constants.DB_PARAM)) {
            setDb(value);
        } else if (paramName.equalsIgnoreCase(Constants.QUERY_ID_PARAM)) {
            try {
                setQueryId(Long.parseLong(value));
            } catch (NumberFormatException e) {
                addError(paramName, e);
            }
        } else if (paramName.equalsIgnoreCase(Constants.QUERY_NAME_PARAM)) {
            setName(value);
        } else if (paramName.equalsIgnoreCase(Constants.RANKING_PARAM)) {
            setRanking(value.equalsIgnoreCase("true"));
        } else if (paramName.equalsIgnoreCase(Constants.COLUMN_INDEX_PARAM)) {
            try {
                setColumnIndex(Integer.parseInt(value));
            } catch (NumberFormatException e) {
                addError(paramName, e);
            }
        } else if (paramName.equalsIgnoreCase(Constants.QUERY_TEXT_PARAM)) {
            setText(value);
        }

    }

    private void checkName(String name) {
        if (isEmpty(name)) {
            addError(Constants.QUERY_NAME_PARAM, "You must specify a query name");
        } else if (name.length() > 100) {
            addError(Constants.QUERY_NAME_PARAM, "Invalid Query Name, too long");
        }
    }

    private void checkColumnIndex(int columnIndex) {
        if (columnIndex < 1) {
            addError(Constants.COLUMN_INDEX_PARAM, "Invalid column Index, must be greater than 0");
        } else if (columnIndex > 999) {  //somewhat arbitrary, but i think reasonable
            addError(Constants.COLUMN_INDEX_PARAM, "Invalid column Index, must be less than 1000");
        }
    }

    private void checkText(String text) {
        if (isEmpty(text)) {
            addError(Constants.QUERY_TEXT_PARAM, "No query specified");
        } else if (!text.trim().toLowerCase().startsWith("select")) {
            addError(Constants.QUERY_TEXT_PARAM, "Invalid query entered");
        } else if (!(text.toLowerCase().indexOf("from") > -1)) {
            addError(Constants.QUERY_TEXT_PARAM, "Invalid query entered");
        }
    }

    private void checkQueryId(long queryId, Query q) throws Exception {
        if (!isNewQuery()) {
            if (q.getName(queryId, getDb()) == null) {
                addError(Constants.QUERY_ID_PARAM, "Invalid query id");
            }
        }
    }

    public boolean isNewQuery() {
        return getQueryId() == 0;
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


