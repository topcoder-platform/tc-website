package com.topcoder.web.query.request;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.query.common.Constants;
import com.topcoder.web.query.common.Util;
import com.topcoder.web.query.ejb.QueryServices.Command;
import com.topcoder.web.query.ejb.QueryServices.CommandGroup;
import com.topcoder.web.common.BaseProcessor;

import java.util.Enumeration;

/**
 * @author Greg Paul
 *
 */

public class ModifyCommand extends BaseProcessor {

    private static Logger log = Logger.getLogger(ModifyCommand.class);

    private String db;
    private String commandDesc;
    private int groupId;
    private long commandId;
    private ResultSetContainer groups;

    /* Creates a new Login */
    public ModifyCommand() {
        super();
        db = "";
        commandDesc = "";
        groupId = 0;
        commandId = 0;
        groups = null;
    }


	protected void baseProcessing() throws Exception {
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

    protected void businessProcessing() throws Exception {
        String step = getRequest().getParameter(Constants.STEP_PARAM);
        Command c = (Command)Util.createEJB(getInitialContext(), Command.class);
        CommandGroup cg = (CommandGroup)Util.createEJB(getInitialContext(), CommandGroup.class);


        setGroups(cg.getAllCommandGroups(getDb()));

        if (step!=null && step.equals(Constants.SAVE_STEP)) {
            checkCommandDesc(getCommandDesc());
            checkGroupId(getGroupId(), cg);
            checkCommandId(getCommandId(), c);
            if (!hasErrors()) {
                if (isNewCommand()) {
                    setCommandId(c.createCommand(getCommandDesc(), getGroupId(), getDb()));
                } else {
                    c.setCommandDesc(getCommandId(), getCommandDesc(), getDb());
                    c.setCommandGroupId(getCommandId(), getGroupId(), getDb());
                }
            }
        } else {
            if (!isNewCommand()) {
                setCommandDesc(c.getCommandDesc(getCommandId(), getDb()));
                setGroupId(c.getCommandGroupId(getCommandId(), getDb()));
            }
        }

        getRequest().setAttribute(this.getClass().getName().substring(this.getClass().getName().lastIndexOf(".")+1), this);
        setNextPage(Constants.MODIFY_COMMAND_PAGE);
        setIsNextPageInContext(true);
    }

    public void setAttributes(String paramName, String paramValues[]) {
        String value = paramValues[0];
        value = (value == null?"":value.trim());
        log.debug("setAttributes called...param: " + paramName + " value: " + value);

        if (paramName.equalsIgnoreCase(Constants.DB_PARAM)) {
            setDb(value);
        } else if (paramName.equalsIgnoreCase(Constants.COMMAND_ID_PARAM)) {
            setCommandId(Long.parseLong(value));
        } else if (paramName.equalsIgnoreCase(Constants.COMMAND_DESC_PARAM)) {
            setCommandDesc(value);
        } else if (paramName.equalsIgnoreCase(Constants.GROUP_ID_PARAM)) {
            try {
                setGroupId(Integer.parseInt(value));
            } catch (NumberFormatException e) {
                addError(paramName, e);
            }
        }
    }

    private void checkCommandDesc(String command) {
        if (isEmpty(command)) {
            addError(Constants.COMMAND_DESC_PARAM, "You must specify a command name");
        } else if (command.length() > 100) {
            addError(Constants.COMMAND_DESC_PARAM, "Invalid Command Name, too long");
        }
    }

    private void checkGroupId(int groupId, CommandGroup cg) throws Exception {
        if (cg.getCommandGroupName(groupId, getDb())==null) {
            addError(Constants.GROUP_ID_PARAM, "Invalid Group");
        }
    }

    private void checkCommandId(long commandId, Command c) throws Exception {
        if (!isNewCommand()) {
            if (c.getCommandDesc(commandId, getDb())==null) {
                addError(Constants.COMMAND_ID_PARAM, "Invalid Command");
            }
        }
    }

    public boolean isNewCommand() {
        return getCommandId()==0;
    }

    public String getDb() {
        return db;
    }

    public void setDb(String db) {
        this.db = db;
    }

    public long getCommandId() {
        return commandId;
    }

    public void setCommandId(long commandId) {
        this.commandId = commandId;
    }

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        log.debug("setGroupId called..." + groupId);
        this.groupId = groupId;
    }

    public String getCommandDesc() {
        return commandDesc;
    }

    public void setCommandDesc(String commandDesc) {
        this.commandDesc = commandDesc;
    }

    public ResultSetContainer getGroups() {
        log.debug("getGroups called, " + groups.size() + " items returned");
        return groups;
    }

    public void setGroups(ResultSetContainer groups) {
        this.groups = groups;
    }

}


