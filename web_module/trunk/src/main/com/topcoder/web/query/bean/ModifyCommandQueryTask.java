package com.topcoder.web.query.bean;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.query.common.*;
import com.topcoder.web.query.common.CommandQueryBean;
import com.topcoder.web.query.common.QueryBean;
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

public class ModifyCommandQueryTask extends BaseTask implements Task, Serializable {

    private static Logger log = Logger.getLogger(ModifyCommandQueryTask.class);

    private String db;
    private ArrayList currentQueryList;
    private ArrayList otherQueryList;
    private long commandId;
    private long queryId;
    private String commandDesc;
    private HashMap attributeQueue;

    /* Creates a new LoginTask */
    public ModifyCommandQueryTask() {
        super();
        currentQueryList = new ArrayList();
        otherQueryList = new ArrayList();
        commandId = 0;
        queryId = 0;
        commandDesc = "";
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
        QueryHome qHome = (QueryHome) getInitialContext().lookup(ApplicationServer.Q_QUERY);
        Query q = qHome.create();

        CommandQueryHome cqHome = (CommandQueryHome) getInitialContext().lookup(ApplicationServer.Q_COMMAND_QUERY);
        CommandQuery cq = cqHome.create();

        CommandHome cHome = (CommandHome) getInitialContext().lookup(ApplicationServer.Q_COMMAND);
        Command c = cHome.create();

        q.setDataSource(getDb());
        cq.setDataSource(getDb());
        c.setDataSource(getDb());

        setCommandDesc(c.getCommandDesc(getCommandId()));

        processAttributeQueue();

        if (step!=null && step.equals(Constants.SAVE_STEP)) {
            CommandQueryBean cqb = null;
            for (int j=0; j<getCurrentQueryList().size(); j++) {
                cqb = (CommandQueryBean)getCurrentQueryList().get(j);
                cq.setSortOrder(cqb.getCommandId(), cqb.getQueryId(), cqb.getSortOrder());
            }
        } else if (step!=null && step.equals(Constants.NEW_STEP)) {
            cq.createCommandQuery(getCommandId(), getQueryId());
        } else if (step!=null && step.equals(Constants.REMOVE_STEP)) {
            cq.removeCommandQuery(getCommandId(), getQueryId());
        }
        setCurrentQueryList(cq.getQueriesForCommand(getCommandId()));
        setOtherQueryList(q.getAllQueries(false));

        super.setNextPage(Constants.MODIFY_COMMAND_QUERY_PAGE);
    }

    public void setAttributes(String paramName, String paramValues[]) {
        String value = paramValues[0];
        value = (value == null?"":value.trim());
        log.debug("setAttributes called...param: " + paramName + " value: " + value);
        if (paramName.equalsIgnoreCase(Constants.DB_PARAM)) {
            setDb(value);
        } else if (paramName.equalsIgnoreCase(Constants.COMMAND_ID_PARAM)) {
            try {
                setCommandId(Long.parseLong(value));
            } catch (NumberFormatException e) {
                super.addError(Constants.COMMAND_ID_PARAM, e);
            }
        } else if (paramName.equalsIgnoreCase(Constants.QUERY_ID_PARAM)) {
            try {
                setQueryId(Long.parseLong(value));
            } catch (NumberFormatException e) {
                super.addError(Constants.QUERY_ID_PARAM, e);
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
            if (paramName.startsWith(Constants.SORT_ORDER_PARAM)) {
                try {
                    long queryId = Long.parseLong(paramName.substring(Constants.SORT_ORDER_PARAM.length()));
                    getCommandQuery(getCurrentQueryList(), queryId).setSortOrder(Integer.parseInt(value));
                } catch (NumberFormatException e) {
                    super.addError(Constants.SORT_ORDER_PARAM, e);
                } catch (Exception e) {
                    super.addError(Constants.SORT_ORDER_PARAM, e);
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
        for (int i=0; i<list.size() && !found; i++) {
            found = ((CommandQueryBean)list.get(i)).getQueryId()==id;
            if (found) temp = ((CommandQueryBean)list.get(i));
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
        for ( ; it.hasNext(); ) {
            rsr = (ResultSetContainer.ResultSetRow)it.next();
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
        for ( ; it.hasNext(); ) {
            rsr = (ResultSetContainer.ResultSetRow)it.next();
            qb = new QueryBean();
            qb.setQueryId(Long.parseLong(rsr.getItem("query_id").toString()));
            qb.setName(rsr.getItem("name").toString());
            /* no need to send the text to the client at this time... */
//            qb.setText(rsr.getItem("text").toString());
            qb.setRanking(rsr.getItem("ranking").toString().equals("1"));
            qb.setColumnIndex(Integer.parseInt(rsr.getItem("column_index").toString()));
            // if this input is not associated with this query already, add it to the OtherInputList
            if (getCommandQuery(getCurrentQueryList(), qb.getQueryId())==null) {
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
        if (currentQueryList==null) {
            CommandQueryHome cqHome = (CommandQueryHome) getInitialContext().lookup(ApplicationServer.Q_COMMAND_QUERY);
            CommandQuery cq = cqHome.create();
            cq.setDataSource(getDb());
            setCurrentQueryList(cq.getQueriesForCommand(getCommandId()));
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


