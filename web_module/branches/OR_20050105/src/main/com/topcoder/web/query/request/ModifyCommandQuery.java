package com.topcoder.web.query.request;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.query.bean.CommandQueryBean;
import com.topcoder.web.query.common.Constants;
import com.topcoder.web.query.bean.QueryBean;
import com.topcoder.web.ejb.query.*;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;

import java.util.*;

/**
 * @author Greg Paul
 *
 */

public class ModifyCommandQuery extends BaseProcessor {

    private static Logger log = Logger.getLogger(ModifyCommandQuery.class);

    private String db;
    private ArrayList currentQueryList;
    private ArrayList otherQueryList;
    /**
     * used when created a new command query relation or removing one
     * not used for modifying an existing relation
     */
    private long commandId;
    private long queryId;
    private String commandDesc;
    private HashMap attributeQueue;

    /* Creates a new Login */
    public ModifyCommandQuery() {
        super();
        db = "";
        currentQueryList = null;
        otherQueryList = null;
        commandId = 0;
        queryId = 0;
        commandDesc = "";
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
            CommandQuery cq = (CommandQuery) createEJB(getInitialContext(), CommandQuery.class);
            Command c = (Command) createEJB(getInitialContext(), Command.class);
            Query q = (Query) createEJB(getInitialContext(), Query.class);

            setCommandDesc(c.getCommandDesc(getCommandId(), getDb()));

            processAttributeQueue();

            checkCommandId(getCommandId(), c);
            if (step != null && step.equals(Constants.SAVE_STEP)) {
                CommandQueryBean cqb = null;
                checkSortOrder(getCurrentQueryList());
                if (!hasErrors()) {
                    for (int j = 0; j < getCurrentQueryList().size(); j++) {
                        cqb = (CommandQueryBean) getCurrentQueryList().get(j);
                        cq.setSortOrder(cqb.getCommandId(), cqb.getQueryId(), cqb.getSortOrder(), getDb());
                    }
                }
            } else if (step != null && step.equals(Constants.NEW_STEP)) {
                checkQueryIds(getCurrentQueryList(), q);
                cq.createCommandQuery(getCommandId(), getQueryId(), getDb());
            } else if (step != null && step.equals(Constants.REMOVE_STEP)) {
                checkQueryIds(getCurrentQueryList(), q);
                cq.removeCommandQuery(getCommandId(), getQueryId(), getDb());
            }
            setCurrentQueryList(cq.getQueriesForCommand(getCommandId(), getDb()));
            setOtherQueryList(q.getAllQueries(false, getDb()));
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw(new TCWebException(e));
        }

        getRequest().setAttribute(this.getClass().getName().substring(this.getClass().getName().lastIndexOf(".") + 1), this);
        setNextPage(Constants.MODIFY_COMMAND_QUERY_PAGE);
        setIsNextPageInContext(true);
    }

    public void setAttributes(String paramName, String paramValues[]) {
        String value = paramValues[0];
        value = (value == null ? "" : value.trim());
        log.debug("setAttributes called...param: " + paramName + " value: " + value);
        if (paramName.equalsIgnoreCase(Constants.DB_PARAM)) {
            setDb(value);
        } else if (paramName.equalsIgnoreCase(Constants.COMMAND_ID_PARAM)) {
            try {
                setCommandId(Long.parseLong(value));
            } catch (NumberFormatException e) {
                addError(paramName, e);
            }
        } else if (paramName.equalsIgnoreCase(Constants.QUERY_ID_PARAM)) {
            try {
                setQueryId(Long.parseLong(value));
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
        String paramName = null;
        String value = null;
        Map.Entry me = null;

        for (Iterator it = attributeQueue.entrySet().iterator(); it.hasNext();) {
            me = (Map.Entry) it.next();
            paramName = me.getKey().toString();
            value = me.getValue().toString();
            if (paramName.startsWith(Constants.SORT_ORDER_PARAM)) {
                try {
                    long queryId = Long.parseLong(paramName.substring(Constants.SORT_ORDER_PARAM.length()));
                    getCommandQuery(getCurrentQueryList(), queryId).setSortOrder(Integer.parseInt(value));
                } catch (NumberFormatException e) {
                    addError(paramName, e);
                } catch (Exception e) {
                    addError(paramName, e);
                }
            }
        }
    }

    private void checkCommandId(long commandId, Command c) throws Exception {
        if (c.getCommandDesc(commandId, getDb()) == null) {
            addError(Constants.COMMAND_ID_PARAM, "Invalid Command");
        }
    }

    private void checkQueryIds(List list, Query q) throws Exception {
        long queryId = 0;
        for (int i = 0; i < list.size(); i++) {
            queryId = ((CommandQueryBean) list.get(i)).getQueryId();
            if (q.getName(queryId, getDb()) == null) {
                addError(Constants.QUERY_ID_PARAM + queryId, "Invalid query id");
            }
        }
    }

    /**
     * check that no two queries have the same sort order value
     * and check that no query has a sort order of 0 or greater
     * than 999.
     * @param list
     */
    private void checkSortOrder(List list) {
        CommandQueryBean curr = null;
        CommandQueryBean next = null;
        Collections.sort(list, new Comparator() {
            public int compare(Object o1, Object o2) {
                return (new Integer(((CommandQueryBean) o1).getSortOrder()).compareTo(
                        new Integer(((CommandQueryBean) o2).getSortOrder())));
            }
        });
        boolean found = false;
        for (int i = 0; i < list.size() - 1 && !found; i++) {
            curr = (CommandQueryBean) list.get(i);
            next = (CommandQueryBean) list.get(i + 1);
            found = curr.getSortOrder() == next.getSortOrder();
            if (found) {
                addError(Constants.SORT_ORDER_PARAM + curr.getQueryId(), "No two sort order entries may be the same");
            } else {
                if (curr.getSortOrder() == 0) {
                    found = true;
                    addError(Constants.SORT_ORDER_PARAM + curr.getQueryId(), "You must fill in a sort order");
                } else if (next.getSortOrder() == 0) {
                    found = true;
                    addError(Constants.SORT_ORDER_PARAM + next.getQueryId(), "You must fill in a sort order");
                } else if (curr.getSortOrder() > 999) {
                    found = true;
                    addError(Constants.SORT_ORDER_PARAM + curr.getQueryId(), "Invalid sortorder specified");
                } else if (next.getSortOrder() > 999) {
                    found = true;
                    addError(Constants.SORT_ORDER_PARAM + next.getQueryId(), "Invalid sort order specified");
                }


            }
        }
    }


    /**
     * Looks through the given list of CommandQueryBean objects
     * for one that has an queryId that matches the given id.
     * Note: there should be at most 1 command's queries represented
     * in the list.  If there is more than one command, then the
     * same queryId could appear twice.  This method will return the first.
     * @param list
     * @param id
     * @return
     */
    private CommandQueryBean getCommandQuery(ArrayList list, long id) {
        CommandQueryBean temp = null;
        boolean found = false;
        for (int i = 0; i < list.size() && !found; i++) {
            found = ((CommandQueryBean) list.get(i)).getQueryId() == id;
            if (found) temp = ((CommandQueryBean) list.get(i));
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

    private void setCurrentQueryList(ResultSetContainer currentQueryList) {
        Iterator it = currentQueryList.iterator();
        ResultSetContainer.ResultSetRow rsr = null;
        ArrayList list = new ArrayList(currentQueryList.size());
        CommandQueryBean cqb = null;
        for (; it.hasNext();) {
            rsr = (ResultSetContainer.ResultSetRow) it.next();
            cqb = new CommandQueryBean();
            cqb.setCommandId(Long.parseLong(rsr.getItem("command_id").toString()));
            cqb.setQueryId(Long.parseLong(rsr.getItem("query_id").toString()));
            cqb.setQueryName(rsr.getItem("name").toString());
            cqb.setSortOrder(Integer.parseInt(rsr.getItem("sort_order").toString()));
            list.add(cqb);
        }
        setCurrentQueryList(list);
    }


    /**
     * Be sure the currentQueryList has been updated before calling this guy.
     * It will use that list to determine if the query should be added
     * to this list, or not.
     * @param otherQueryList
     */
    private void setOtherQueryList(ResultSetContainer otherQueryList) throws Exception {
        Iterator it = otherQueryList.iterator();
        ResultSetContainer.ResultSetRow rsr = null;
        ArrayList list = new ArrayList(otherQueryList.size());
        QueryBean qb = null;
        for (; it.hasNext();) {
            rsr = (ResultSetContainer.ResultSetRow) it.next();
            qb = new QueryBean();
            qb.setQueryId(Long.parseLong(rsr.getItem("query_id").toString()));
            qb.setName(rsr.getItem("name").toString());
            /* no need to send the text to the client at this time... */
//            qb.setText(rsr.getItem("text").toString());
            qb.setRanking(rsr.getItem("ranking").toString().equals("1"));
            qb.setColumnIndex(Integer.parseInt(rsr.getItem("column_index").toString()));
            // if this input is not associated with this query already, add it to the OtherInputList
            if (getCommandQuery(getCurrentQueryList(), qb.getQueryId()) == null) {
                list.add(qb);
            }
        }
        setOtherQueryList(list);
    }

    /**
     * Gets the current list of queries for this command.  if we
     * don't have that information in memory, get it from the db.
     * @return
     * @throws Exception
     */
    public ArrayList getCurrentQueryList() throws Exception {
        if (currentQueryList == null) {
            CommandQuery cq = (CommandQuery) createEJB(getInitialContext(), CommandQuery.class);
            setCurrentQueryList(cq.getQueriesForCommand(getCommandId(), getDb()));
        }
        return currentQueryList;
    }

    public void setCurrentQueryList(ArrayList currentQueryList) {
        this.currentQueryList = currentQueryList;
    }

    public ArrayList getOtherQueryList() {
        return otherQueryList;
    }

    public void setOtherQueryList(ArrayList otherQueryList) {
        this.otherQueryList = otherQueryList;
    }

    public long getCommandId() {
        return commandId;
    }

    public void setCommandId(long commandId) {
        this.commandId = commandId;
    }

    public String getCommandDesc() {
        return commandDesc;
    }

    public void setCommandDesc(String commandDesc) {
        this.commandDesc = commandDesc;
    }

}


