package com.topcoder.web.query.request;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.query.common.Constants;

import com.topcoder.web.ejb.query.Command;
import com.topcoder.web.ejb.query.CommandGroup;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;

import java.util.Enumeration;

/**
 * @author Greg Paul
 *
 */

public class CommandList extends BaseProcessor {

    private static Logger log = Logger.getLogger(CommandList.class);

    private ResultSetContainer commandList;
    private String db;
    private ResultSetContainer commandGroupList;
    private int commandGroupId;

    /* Creates a new Login */
    public CommandList() {
        super();
        db = "";
        commandGroupId = 0;
    }

    protected void baseProcessing() throws TCWebException {
        super.baseProcessing();
        Enumeration parameterNames = getRequest().getParameterNames();
        log.debug("baseProcessng called: " + parameterNames.toString());
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
            Command c = (Command) createEJB(getInitialContext(), Command.class);
            CommandGroup cg = (CommandGroup) createEJB(getInitialContext(), CommandGroup.class);

            if (getCommandGroupId() > 0) {
                setCommandList(c.getCommandList(getDb(), getCommandGroupId()));
            } else {
                setCommandList(c.getCommandList(getDb()));
            }
            setCommandGroupList(cg.getAllCommandGroups(getDb()));
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw(new TCWebException(e));
        }

        getRequest().setAttribute(this.getClass().getName().substring(this.getClass().getName().lastIndexOf(".") + 1), this);
        setNextPage(Constants.COMMAND_LIST_PAGE);
        setIsNextPageInContext(true);
    }

    public void setAttributes(String paramName, String paramValues[]) {
        log.debug("set attrbutes called " + paramName + " " + paramValues[0]);
        String value = paramValues[0];
        value = (value == null ? "" : value.trim());

        if (paramName.equalsIgnoreCase(Constants.DB_PARAM))
            setDb(value);
        if (paramName.equalsIgnoreCase(Constants.GROUP_ID_PARAM)) {
            try {
                log.debug("setting group id: " + Integer.parseInt(value));
                setCommandGroupId(Integer.parseInt(value));
            } catch (NumberFormatException e) {
                addError(Constants.GROUP_ID_PARAM, e);
            }
        }
    }

    public String getDb() {
        return db;
    }

    public void setDb(String db) {
        this.db = db;
    }

    public ResultSetContainer getCommandList() {
        return commandList;
    }

    public void setCommandList(ResultSetContainer commandList) {
        this.commandList = commandList;
    }

    public ResultSetContainer getCommandGroupList() {
        return commandGroupList;
    }

    public void setCommandGroupList(ResultSetContainer commandGroupList) {
        this.commandGroupList = commandGroupList;
    }

    public int getCommandGroupId() {
        return commandGroupId;
    }

    public void setCommandGroupId(int commandGroupId) {
        this.commandGroupId = commandGroupId;
    }


}


