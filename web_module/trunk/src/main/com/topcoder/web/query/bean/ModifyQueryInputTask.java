package com.topcoder.web.query.bean;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.query.common.*;
import com.topcoder.web.query.common.InputBean;
import com.topcoder.web.query.common.QueryInputBean;
import com.topcoder.web.query.ejb.QueryServices.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Greg Paul
 *
 */

public class ModifyQueryInputTask extends BaseTask implements Task, Serializable {

    private static Logger log = Logger.getLogger(ModifyQueryInputTask.class);

    private String db;
    private ArrayList currentInputList;
    private ArrayList otherInputList;

    private long queryId;

    /**
     * used when creating a new query input relation, or deleting one.
     * not used for modifying an existing relation
     */
    private long inputId;

    private String queryName;

    private HashMap attributeQueue;

    /* Creates a new LoginTask */
    public ModifyQueryInputTask() {
        super();
        attributeQueue = new HashMap();
    }


	public void servletPreAction(HttpServletRequest request, HttpServletResponse response)
            throws AuthenticationException, Exception {
        super.servletPreAction(request, response);
        if (!super.getAuthentication().isLoggedIn()) {
            throw new AuthenticationException("User not authenticated for access to query tool resource.");
        }
	}

    public void servletPostAction(HttpServletRequest request, HttpServletResponse response) throws Exception {
        super.setNavLinks(super.buildNavLinks(getServletPath(), getDb()));
    }

    public void process(String step) throws Exception {
        InputHome iHome = (InputHome) getInitialContext().lookup(ApplicationServer.Q_INPUT);
        Input i = iHome.create();

        QueryInputHome qiHome = (QueryInputHome) getInitialContext().lookup(ApplicationServer.Q_QUERY_INPUT);
        QueryInput qi = qiHome.create();

        QueryHome qHome = (QueryHome) getInitialContext().lookup(ApplicationServer.Q_QUERY);
        Query q = qHome.create();

        i.setDataSource(getDb());
        qi.setDataSource(getDb());
        q.setDataSource(getDb());

        processAttributeQueue();

        setQueryName(q.getName(getQueryId()));

        if (step!=null && step.equals(Constants.SAVE_STEP)) {
            QueryInputBean qib = null;
            for (int j=0; j<getCurrentInputList().size(); j++) {
                qib = (QueryInputBean)getCurrentInputList().get(j);
                qi.setDefaultValue(qib.getQueryId(), qib.getInputId(), qib.getDefaultValue());
                qi.setOptional(qib.getQueryId(), qib.getInputId(), qib.isOptional()?'Y':'N');
                qi.setSortOrder(qib.getQueryId(), qib.getInputId(), qib.getSortOrder());
            }
        } else if (step!=null && step.equals(Constants.NEW_STEP)) {
            qi.createQueryInput(getQueryId(), getInputId());
        } else if (step!=null && step.equals(Constants.REMOVE_STEP)) {
            qi.removeQueryInput(getQueryId(), getInputId());
        }

        setCurrentInputList(qi.getInputsForQuery(getQueryId()));
        setOtherInputList(i.getAllInputs());

        super.setNextPage(Constants.MODIFY_QUERY_INPUT_PAGE);
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
                super.addError(Constants.QUERY_ID_PARAM, e);
            }
        } else if (paramName.equalsIgnoreCase(Constants.INPUT_ID_PARAM)) {
            try {
                setInputId(Long.parseLong(value));
            } catch (NumberFormatException e) {
                super.addError(Constants.INPUT_ID_PARAM, e);
            }
        } else {
            /*
             * queue the rest up, we need these fields populated
             * before we can figure out what to do with the rest
             */
            attributeQueue.put(paramName, value);
        }
    }

    private void processAttributeQueue() {
        Iterator it = attributeQueue.entrySet().iterator();

        String paramName = null;
        String value = null;
        Map.Entry me = null;

        for ( ; it.hasNext(); ) {
            me = (Map.Entry)it.next();
            paramName = me.getKey().toString();
            value = me.getValue().toString();
            if (paramName.startsWith(Constants.OPTIONAL_PARAM)) {
                try {
                    long inputId = Long.parseLong(paramName.substring(Constants.OPTIONAL_PARAM.length()));
                    getQueryInput(getCurrentInputList(), inputId).setOptional(value.equals("on"));
                } catch (NumberFormatException e) {
                    super.addError(Constants.OPTIONAL_PARAM, e);
                } catch (Exception e) {
                    super.addError(Constants.OPTIONAL_PARAM, e);
                }
            } else if (paramName.startsWith(Constants.DEFAULT_VALUE_PARAM)) {
                try {
                    long inputId = Long.parseLong(paramName.substring(Constants.DEFAULT_VALUE_PARAM.length()));
                    getQueryInput(getCurrentInputList(), inputId).setDefaultValue(value);
                } catch (NumberFormatException e) {
                    super.addError(Constants.DEFAULT_VALUE_PARAM, e);
                } catch (Exception e) {
                    super.addError(Constants.DEFAULT_VALUE_PARAM, e);
                }
            } else if (paramName.startsWith(Constants.SORT_ORDER_PARAM)) {
                try {
                    long inputId = Long.parseLong(paramName.substring(Constants.SORT_ORDER_PARAM.length()));
                    getQueryInput(getCurrentInputList(), inputId).setSortOrder(Integer.parseInt(value));
                } catch (NumberFormatException e) {
                    super.addError(Constants.SORT_ORDER_PARAM, e);
                } catch (Exception e) {
                    super.addError(Constants.SORT_ORDER_PARAM, e);
                }
            }
        }
    }


    /**
     * Looks through the given list of QueryInputBean objects
     * for one that has an inputId that matches the given id.
     * Note: there should be at most 1 query's inputs represented
     * in the list.  If there is more than one query, then the
     * same inputId could appear twice.  This method will return the first.
     * @param list
     * @param id
     * @return
     */
    private QueryInputBean getQueryInput(ArrayList list, long id) {
        QueryInputBean temp = null;
        boolean found = false;
        for (int i=0; i<list.size() && !found; i++) {
            found = ((QueryInputBean)list.get(i)).getInputId()==id;
            if (found) temp = ((QueryInputBean)list.get(i));
        }
        return temp;
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

    public long getInputId() {
        return inputId;
    }

    public void setInputId(long inputId) {
        this.inputId = inputId;
    }

    /**
     * Gets the current list of inputs for this query.  if we
     * don't have that information in memory, get it from the db.
     * @return
     * @throws Exception
     */
    public ArrayList getCurrentInputList() throws Exception {
        if (currentInputList==null) {
            QueryInputHome qiHome = (QueryInputHome) getInitialContext().lookup(ApplicationServer.Q_QUERY_INPUT);
            QueryInput qi = qiHome.create();
            qi.setDataSource(getDb());
            setCurrentInputList(qi.getInputsForQuery(getQueryId()));
        }
        return currentInputList;
    }

    public void setCurrentInputList(ArrayList currentInputList) {
        this.currentInputList = currentInputList;
    }

    private void setCurrentInputList(ResultSetContainer currentInputList) {
        Iterator it = currentInputList.iterator();
        ResultSetContainer.ResultSetRow rsr = null;
        ArrayList list = new ArrayList(currentInputList.size());
        QueryInputBean qib = null;
        for ( ; it.hasNext(); ) {
            rsr = (ResultSetContainer.ResultSetRow)it.next();
            qib = new QueryInputBean();
            qib.setInputId(Long.parseLong(rsr.getItem("input_id").toString()));
            qib.setQueryId(Long.parseLong(rsr.getItem("query_id").toString()));
            qib.setInputCode(rsr.getItem("input_code").toString());
            qib.setInputDesc(rsr.getItem("input_desc").toString());
            qib.setDataTypeId(Integer.parseInt(rsr.getItem("data_type_id").toString()));
            qib.setDefaultValue(rsr.getItem("default_value").toString());
            qib.setSortOrder(Integer.parseInt(rsr.getItem("sort_order").toString()));
            list.add(qib);
        }
        setCurrentInputList(list);
    }


    public ArrayList getOtherInputList() {
        return otherInputList;
    }

    public void setOtherInputList(ArrayList otherInputList) {
        this.otherInputList = otherInputList;
    }

    /**
     * Be sure the currentInputList has been updated before calling this guy.
     * It will use that list to determine if the input should be added
     * to this list, or not.
     * @param otherInputList
     */
    private void setOtherInputList(ResultSetContainer otherInputList) throws Exception {
        Iterator it = otherInputList.iterator();
        ResultSetContainer.ResultSetRow rsr = null;
        ArrayList list = new ArrayList(otherInputList.size());
        InputBean ib = null;
        for ( ; it.hasNext(); ) {
            rsr = (ResultSetContainer.ResultSetRow)it.next();
            ib = new InputBean();
            ib.setInputId(Long.parseLong(rsr.getItem("input_id").toString()));
            ib.setInputCode(rsr.getItem("input_code").toString());
            ib.setInputDesc(rsr.getItem("input_desc").toString());
            ib.setDataTypeId(Integer.parseInt(rsr.getItem("data_type_id").toString()));
            // if this input is not associated with this query already, add it to the OtherInputList
            if (getQueryInput(getCurrentInputList(), ib.getInputId())==null) {
                list.add(ib);
            }
        }
        setOtherInputList(list);
    }

    public String getQueryName() {
        return queryName;
    }

    public void setQueryName(String queryName) {
        this.queryName = queryName;
    }



}


