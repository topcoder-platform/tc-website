package com.topcoder.web.query.request;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.query.common.Constants;
import com.topcoder.web.ejb.query.*;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;

import java.util.Enumeration;

/**
 * @author Greg Paul
 *
 */

public class CommandDetail extends BaseProcessor {

    private static Logger log = Logger.getLogger(CommandDetail.class);

    private String db;
    private String commandDesc;
    private String groupDesc;
    private int groupId;
    private ResultSetContainer queryList;
    private ResultSetContainer inputList;
    private int commandId;

    /* Creates a new Login */
    public CommandDetail() {
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

    public void businessProcessing() throws TCWebException {
        try {
            CommandQuery cq = (CommandQuery) createEJB(getInitialContext(), CommandQuery.class);
            Command c = (Command) createEJB(getInitialContext(), Command.class);
            CommandGroup cg = (CommandGroup) createEJB(getInitialContext(), CommandGroup.class);
            QueryInput qi = (QueryInput) createEJB(getInitialContext(), QueryInput.class);

            setQueryList(cq.getQueriesForCommand(getCommandId(), getDb()));
            setGroupId(c.getCommandGroupId(getCommandId(), getDb()));
            setGroupDesc(cg.getCommandGroupName(getGroupId(), getDb()));
            setCommandDesc(c.getCommandDesc(getCommandId(), getDb()));
            setInputList(qi.getInputsForCommand(getCommandId(), getDb()));
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw(new TCWebException(e));
        }

        getRequest().setAttribute(this.getClass().getName().substring(this.getClass().getName().lastIndexOf(".") + 1), this);
        setNextPage(Constants.COMMAND_DETAIL_PAGE);
        setIsNextPageInContext(true);
    }

    public void setAttributes(String paramName, String paramValues[]) {
        String value = paramValues[0];
        value = (value == null ? "" : value.trim());

        if (paramName.equalsIgnoreCase(Constants.DB_PARAM))
            setDb(value);
        else if (paramName.equalsIgnoreCase(Constants.COMMAND_ID_PARAM))
            setCommandId(Integer.parseInt(value));
    }

    public String getDb() {
        return db;
    }

    public void setDb(String db) {
        this.db = db;
    }

    public String getCommandDesc() {
        return commandDesc;
    }

    public void setCommandDesc(String commandDesc) {
        this.commandDesc = commandDesc;
    }

    public String getGroupDesc() {
        return groupDesc;
    }

    public void setGroupDesc(String groupDesc) {
        this.groupDesc = groupDesc;
    }

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public ResultSetContainer getQueryList() {
        return queryList;
    }

    public void setQueryList(ResultSetContainer queryList) {
        this.queryList = queryList;
    }

    public ResultSetContainer getInputList() {
        return inputList;
    }

    public void setInputList(ResultSetContainer inputList) {
        this.inputList = inputList;
    }

    public int getCommandId() {
        return commandId;
    }

    public void setCommandId(int commandId) {
        this.commandId = commandId;
    }


}


