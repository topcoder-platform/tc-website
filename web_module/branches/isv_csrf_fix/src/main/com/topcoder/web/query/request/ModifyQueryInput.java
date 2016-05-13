package com.topcoder.web.query.request;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.query.Input;
import com.topcoder.web.ejb.query.Query;
import com.topcoder.web.ejb.query.QueryInput;
import com.topcoder.web.query.bean.InputBean;
import com.topcoder.web.query.bean.QueryInputBean;
import com.topcoder.web.query.common.Constants;

import java.util.*;

/**
 * @author Greg Paul
 *
 */

public class ModifyQueryInput extends BaseProcessor {

    private static Logger log = Logger.getLogger(ModifyQueryInput.class);

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

    /* Creates a new Login */
    public ModifyQueryInput() {
        super();
        db = "";
        currentInputList = null;
        otherInputList = null;
        queryId = 0;
        inputId = 0;
        queryName = "";
        attributeQueue = new HashMap();
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
            QueryInput qi = (QueryInput) createEJB(getInitialContext(), QueryInput.class);
            Input i = (Input) createEJB(getInitialContext(), Input.class);

            processAttributeQueue();

            setQueryName(q.getName(getQueryId(), getDb()));

            checkQueryId(getQueryId(), q);
            if (step != null && step.equals(Constants.SAVE_STEP)) {
                checkSortOrder(getCurrentInputList());
                checkDefaultValue(getCurrentInputList());
                if (!hasErrors()) {
                    QueryInputBean qib = null;
                    for (int j = 0; j < getCurrentInputList().size(); j++) {
                        qib = (QueryInputBean) getCurrentInputList().get(j);
                        if (qib.isOptional()) {
                            qi.setDefaultValue(qib.getQueryId(), qib.getInputId(), qib.getDefaultValue(), getDb());
                        } else {
                            qib.setDefaultValue(qi.getDefaultValue(qib.getQueryId(), qib.getInputId(), getDb()));
                        }
                        qi.setOptional(qib.getQueryId(), qib.getInputId(), qib.isOptional() ? 'Y' : 'N', getDb());
                        qi.setSortOrder(qib.getQueryId(), qib.getInputId(), qib.getSortOrder(), getDb());
                    }
                }
            } else if (step != null && step.equals(Constants.NEW_STEP)) {
                checkInputId(getInputId(), i);
                qi.createQueryInput(getQueryId(), getInputId(), getDb());
            } else if (step != null && step.equals(Constants.REMOVE_STEP)) {
                checkInputId(getInputId(), i);
                qi.removeQueryInput(getQueryId(), getInputId(), getDb());
            }

            setCurrentInputList(qi.getInputsForQuery(getQueryId(), getDb()));
            setOtherInputList(i.getAllInputs(getDb()));
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw(new TCWebException(e));
        }

        getRequest().setAttribute(this.getClass().getName().substring(this.getClass().getName().lastIndexOf(".") + 1), this);
        setNextPage(Constants.MODIFY_QUERY_INPUT_PAGE);
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
        } else if (paramName.equalsIgnoreCase(Constants.INPUT_ID_PARAM)) {
            try {
                setInputId(Long.parseLong(value));
            } catch (NumberFormatException e) {
                addError(paramName, e);
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

        for (; it.hasNext();) {
            me = (Map.Entry) it.next();
            paramName = me.getKey().toString();
            value = me.getValue().toString();
            if (paramName.startsWith(Constants.OPTIONAL_PARAM)) {
                try {
                    long inputId = Long.parseLong(paramName.substring(Constants.OPTIONAL_PARAM.length()));
                    getQueryInput(getCurrentInputList(), inputId).setOptional(value.equalsIgnoreCase("true"));
                } catch (NumberFormatException e) {
                    addError(paramName, e);
                } catch (Exception e) {
                    addError(paramName, e);
                }
            } else if (paramName.startsWith(Constants.DEFAULT_VALUE_PARAM)) {
                try {
                    long inputId = Long.parseLong(paramName.substring(Constants.DEFAULT_VALUE_PARAM.length()));
                    getQueryInput(getCurrentInputList(), inputId).setDefaultValue(value);
                } catch (NumberFormatException e) {
                    addError(paramName, e);
                } catch (Exception e) {
                    addError(paramName, e);
                }
            } else if (paramName.startsWith(Constants.SORT_ORDER_PARAM)) {
                try {
                    long inputId = Long.parseLong(paramName.substring(Constants.SORT_ORDER_PARAM.length()));
                    getQueryInput(getCurrentInputList(), inputId).setSortOrder(Integer.parseInt(value));
                } catch (NumberFormatException e) {
                    addError(paramName, e);
                } catch (Exception e) {
                    addError(paramName, e);
                }
            }
        }
    }

    private void checkQueryId(long queryId, Query q) throws Exception {
        if (q.getName(queryId, getDb()) == null) {
            addError(Constants.QUERY_ID_PARAM, "Invalid query id");
        }
    }

    private void checkInputId(long inputId, Input i) throws Exception {
        if (i.getInputCode(inputId, getDb()) == null) {
            addError(Constants.INPUT_ID_PARAM, "Invalid input id");
        }
    }

    /**
     * check that no two inputs have the same sort order value
     * and check that no input has a sort order of 0 or greater
     * than 999.
     * @param list
     */
    private void checkSortOrder(List list) {
        QueryInputBean curr = null;
        QueryInputBean next = null;
        Collections.sort(list, new Comparator() {
            public int compare(Object o1, Object o2) {
                return (new Integer(((QueryInputBean) o1).getSortOrder()).compareTo(
                        new Integer(((QueryInputBean) o2).getSortOrder())));
            }
        });
        boolean found = false;
        for (int i = 0; i < list.size() - 1 && !found; i++) {
            curr = (QueryInputBean) list.get(i);
            next = (QueryInputBean) list.get(i + 1);
            found = curr.getSortOrder() == next.getSortOrder();
            if (found) {
                addError(Constants.SORT_ORDER_PARAM + curr.getInputId(), "No two sort order entries may be the same");
            } else {
                if (curr.getSortOrder() == 0) {
                    found = true;
                    addError(Constants.SORT_ORDER_PARAM + curr.getInputId(), "You must fill in a sort order");
                } else if (next.getSortOrder() == 0) {
                    found = true;
                    addError(Constants.SORT_ORDER_PARAM + next.getInputId(), "You must fill in a sort order");
                } else if (curr.getSortOrder() > 999) {
                    found = true;
                    addError(Constants.SORT_ORDER_PARAM + curr.getInputId(), "Invalid sortorder specified");
                } else if (next.getSortOrder() > 999) {
                    found = true;
                    addError(Constants.SORT_ORDER_PARAM + next.getInputId(), "Invalid sortorder specified");
                }
            }
        }
    }

    private void checkDefaultValue(List list) {
        QueryInputBean curr = null;
        boolean found = false;
        for (int i = 0; i < list.size() - 1 && !found; i++) {
            curr = (QueryInputBean) list.get(i);
            if (curr.isOptional()) {
                if (curr.getDefaultValue().length() == 0) {
                    addError(Constants.DEFAULT_VALUE_PARAM + curr.getInputId(), "Missing default value");
                } else if (curr.getDefaultValue().length() > 100) {
                    addError(Constants.DEFAULT_VALUE_PARAM + curr.getInputId(), "Default value too long");
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
        for (int i = 0; i < list.size() && !found; i++) {
            found = ((QueryInputBean) list.get(i)).getInputId() == id;
            if (found) temp = ((QueryInputBean) list.get(i));
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
        if (currentInputList == null) {
            QueryInput qi = (QueryInput) createEJB(getInitialContext(), QueryInput.class);
            setCurrentInputList(qi.getInputsForQuery(getQueryId(), getDb()));
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
        for (; it.hasNext();) {
            rsr = (ResultSetContainer.ResultSetRow) it.next();
            qib = new QueryInputBean();
            qib.setInputId(Long.parseLong(rsr.getItem("input_id").toString()));
            qib.setQueryId(Long.parseLong(rsr.getItem("query_id").toString()));
            qib.setInputCode(rsr.getItem("input_code").toString());
            qib.setInputDesc(rsr.getItem("input_desc").toString());
            qib.setDataTypeId(Integer.parseInt(rsr.getItem("data_type_id").toString()));
            qib.setDefaultValue(rsr.getItem("default_value").toString());
            qib.setSortOrder(Integer.parseInt(rsr.getItem("sort_order").toString()));
            qib.setOptional(rsr.getItem("optional").toString().trim().equals("Y"));
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
        for (; it.hasNext();) {
            rsr = (ResultSetContainer.ResultSetRow) it.next();
            ib = new InputBean();
            ib.setInputId(Long.parseLong(rsr.getItem("input_id").toString()));
            ib.setInputCode(rsr.getItem("input_code").toString());
            ib.setInputDesc(rsr.getItem("input_desc").toString());
            ib.setDataTypeId(Integer.parseInt(rsr.getItem("data_type_id").toString()));
            // if this input is not associated with this query already, add it to the OtherInputList
            if (getQueryInput(getCurrentInputList(), ib.getInputId()) == null) {
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


