package com.topcoder.web.query.bean;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.query.common.Authentication;
import com.topcoder.web.query.common.AuthenticationException;
import com.topcoder.web.query.common.Constants;
import com.topcoder.web.query.ejb.QueryServices.Command;
import com.topcoder.web.query.ejb.QueryServices.CommandGroup;
import com.topcoder.web.query.ejb.QueryServices.CommandGroupHome;
import com.topcoder.web.query.ejb.QueryServices.CommandHome;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.Serializable;

/**
 * @author Greg Paul
 *
 */

public class ModifyCommandTask extends BaseTask implements Task, Serializable {

    private static Logger log = Logger.getLogger(ModifyCommandTask.class);

    private String db;
    private String commandDesc;
    private int groupId;
    private long commandId;
    private ResultSetContainer groups;

    /* Creates a new LoginTask */
    public ModifyCommandTask() {
        super();
        setCommandDesc("");
        setGroupId(0);
        setCommandId(0);
    }


	public void servletPreAction(HttpServletRequest request, HttpServletResponse response)
            throws AuthenticationException, Exception {
        super.servletPreAction(request, response);
        if (!super.getAuthentication().isLoggedIn()) {
            super.getAuthentication().setErrorMessage("User not authenticated for access to query tool resource.");
            throw new AuthenticationException("User not authenticated for access to query tool resource.");
        }
	}

    public void servletPostAction(HttpServletRequest request, HttpServletResponse response) throws Exception {
        super.setNavLinks(super.buildNavLinks(getServletPath(), getDb()));
    }

    public void process(String step) throws Exception {
        CommandHome cHome = (CommandHome) getInitialContext().lookup(ApplicationServer.Q_COMMAND);
        Command c = cHome.create();

        CommandGroupHome cgHome = (CommandGroupHome) getInitialContext().lookup(ApplicationServer.Q_COMMAND_GROUP);
        CommandGroup cg = cgHome.create();

        c.setDataSource(getDb());
        cg.setDataSource(getDb());

        setGroups(cg.getAllCommandGroups());

        if (step!=null && step.equals(Constants.SAVE_STEP)) {
            checkCommandDesc(getCommandDesc());
            checkGroupId(getGroupId(), cg);
            if (!super.hasErrors()) {
                if (isNewCommand()) {
                    c.createCommand(getCommandDesc(), getGroupId());
                } else {
                    c.setCommandDesc(getCommandId(), getCommandDesc());
                    c.setCommandGroupId(getCommandId(), getGroupId());
                }
            }
        } else {
            if (!isNewCommand()) {
                setCommandDesc(c.getCommandDesc(getCommandId()));
                setGroupId(c.getCommandGroupId(getCommandId()));
            }

        }

        super.setNextPage(Constants.MODIFY_COMMAND_PAGE);
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
                super.addError(Constants.GROUP_ID_PARAM, e);
            }
        }


    }

    private void checkCommandDesc(String command) {
        if (super.isEmpty(command)) {
            super.addError(Constants.COMMAND_DESC_PARAM, "Invalid Command Name");
        }
    }

    private void checkGroupId(int groupId, CommandGroup cg) throws Exception {
        if (cg.getCommandGroupName(groupId)==null) {
            super.addError(Constants.GROUP_ID_PARAM, "Invalid Group");
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


