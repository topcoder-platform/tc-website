package com.topcoder.web.query.request;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.query.Query;
import com.topcoder.web.query.bean.QueryBean;
import com.topcoder.web.query.common.Constants;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

/**
 * @author Greg Paul
 *
 */

public class QuerySearch extends BaseProcessor {

    private static Logger log = Logger.getLogger(QuerySearch.class);

    private String db;
    private String searchCriteria;
    private List searchResults;


    /* Creates a new Login */
    public QuerySearch() {
        super();
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
        try {

            Query q = (Query) createEJB(getInitialContext(), Query.class);

            ResultSetContainer rsc = q.getAllQueries(true, getDb());
            if (getSearchCriteria() != null && !getSearchCriteria().equals("")) {
                setSearchResults(find(rsc, getSearchCriteria()));
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw(new TCWebException(e));
        }

        getRequest().setAttribute(this.getClass().getName().substring(this.getClass().getName().lastIndexOf(".") + 1), this);
        setNextPage(Constants.QUERY_SEARCH_PAGE);
        setIsNextPageInContext(true);
    }

    public void setAttributes(String paramName, String paramValues[]) {
        String value = paramValues[0];
        value = (value == null ? "" : value.trim());

        if (paramName.equalsIgnoreCase(Constants.DB_PARAM))
            setDb(value);
        else if (paramName.equalsIgnoreCase(Constants.SEARCH_CRITERIA_PARAM))
            setSearchCriteria(value);
    }

    public String getDb() {
        return db;
    }

    public void setDb(String db) {
        this.db = db;
    }

    public String getSearchCriteria() {
        return searchCriteria;
    }

    public void setSearchCriteria(String searchCriteria) {
        this.searchCriteria = searchCriteria;
    }

    public List getSearchResults() {
        return searchResults;
    }

    public void setSearchResults(List searchResults) {
        this.searchResults = searchResults;
    }

    private List find(ResultSetContainer list, String searchCriteria) {
        log.debug("searchcriteria: " + searchCriteria);
        List ret = new ArrayList(4);
        StringBuffer word = new StringBuffer(10);
        String temp = searchCriteria.trim();
        boolean inQuote = false;
        List searchList = new ArrayList(4);
        /*
         * look through the search criteria and isolate all the "words".
         * words are separated by spaces, or double quotes.  one may
         * have spaces between doubles quotes, and it will still count as
         * a single word.  given the following input:  search for "this word"
         * we would have the search terms:  "search" , "for", "this word"
        */
        for (int i = 0; i < temp.length(); i++) {
            if ((temp.charAt(i) == '\"' && inQuote) || (temp.charAt(i) == ' ' && word.length() > 0 && !inQuote)) {
                searchList.add(word.toString());
                word = new StringBuffer(10);
                if (inQuote) inQuote = false;
                continue;
            }
            if (temp.charAt(i) == '\"') {
                inQuote = !inQuote;
            } else {
                if (inQuote || temp.charAt(i) != ' ')
                    word.append(temp.charAt(i));
            }
        }
        //add the last chunk that's remaining
        if (word.length() > 0)
            searchList.add(word.toString());
        log.debug("searching for: " + searchList);

        ResultSetContainer.ResultSetRow row = null;
        String text = null;
        for (Iterator it = list.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow) it.next();
            text = (String) row.getItem("text").getResultData();
            boolean found = true;
            for (int i = 0; i < searchList.size(); i++) {
                found &= text.indexOf((String) searchList.get(i)) > -1;
            }
            QueryBean query = null;
            if (found) {
                query = new QueryBean();
                query.setColumnIndex(((Integer) row.getItem("column_index").getResultData()).intValue());
                query.setName(((String) row.getItem("name").getResultData()));
                query.setQueryId(((Long) row.getItem("query_id").getResultData()).longValue());
                query.setRanking(((Integer) row.getItem("ranking").getResultData()).intValue() == 1);
                ret.add(query);
            }
        }

        return ret;
    }
}


