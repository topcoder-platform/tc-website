package com.topcoder.web.query.request;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.query.common.AuthenticationException;
import com.topcoder.web.query.common.Constants;
import com.topcoder.web.query.ejb.QueryServices.CommandGroup;
import com.topcoder.web.query.ejb.QueryServices.CommandGroupHome;
import com.topcoder.web.common.BaseProcessor;

import java.util.Enumeration;

/**
 * @author Greg Paul
 *
 */

public class ModifyGroup extends BaseProcessor {

    private static Logger log = Logger.getLogger(ModifyGroup.class);

    private String db;
    private int groupId;
    private String groupDesc;

    /* Creates a new Login */
    public ModifyGroup() {
        super();
        db = "";
        groupId = 0;
        groupDesc = "";
    }


	protected void baseProcessing() throws Exception {
        Enumeration parameterNames = request.getParameterNames();
        while (parameterNames.hasMoreElements()) {
            String parameterName = parameterNames.nextElement().toString();
            String[] parameterValues = request.getParameterValues(parameterName);
            if (parameterValues != null) {
                setAttributes(parameterName, parameterValues);
            }
        }
 	}

    protected void businessProcessing() throws Exception {
        String step = request.getParameter(Constants.STEP_PARAM);
        CommandGroupHome cgHome = (CommandGroupHome) getInitialContext().lookup(ApplicationServer.Q_COMMAND_GROUP);
        CommandGroup cg = cgHome.create();

        if (step!=null && step.equals(Constants.SAVE_STEP)) {
            checkGroupDesc(getGroupDesc());
            checkGroupId(getGroupId(), cg);
            if (!hasErrors()) {
                if (isNewGroup()) {
                    setGroupId(cg.createCommandGroup(getGroupDesc(), getDb()));
                } else {
                    cg.setCommandGroupName(getGroupId(), getGroupDesc(), getDb());
                }
            }
        } else {
            if (!isNewGroup()) {
                setGroupDesc(cg.getCommandGroupName(getGroupId(), getDb()));
            }
        }
        request.setAttribute(this.getClass().getName().substring(this.getClass().getName().lastIndexOf(".")+1), this);
        setNextPage(Constants.MODIFY_GROUP_PAGE);
        setIsNextPageInContext(true);
    }

    public void setAttributes(String paramName, String paramValues[]) {
        String value = paramValues[0];
        value = (value == null?"":value.trim());

        if (paramName.equalsIgnoreCase(Constants.DB_PARAM)) {
            setDb(value);
        } else if (paramName.equalsIgnoreCase(Constants.GROUP_ID_PARAM)) {
            try {
                setGroupId(Integer.parseInt(value));
            } catch (NumberFormatException e) {
                addError(Constants.GROUP_ID_PARAM, e);
            }
        } else if (paramName.equalsIgnoreCase(Constants.GROUP_DESC_PARAM)) {
            setGroupDesc(value);
        }

    }

    private void checkGroupDesc(String groupDesc) {
        if (isEmpty(groupDesc)) {
            addError(Constants.GROUP_DESC_PARAM, "You must specify a group description");
        } else if (groupDesc.length() > 100) {
            addError(Constants.GROUP_DESC_PARAM, "Invalid Group Description, too long");
        }
    }

    private void checkGroupId(int groupId, CommandGroup cg) throws Exception {
        if (!isNewGroup()) {
            if (cg.getCommandGroupName(groupId, getDb())==null) {
                addError(Constants.GROUP_ID_PARAM, "Invalid Group Id");
            }
        }
    }

    public boolean isNewGroup() {
        return getGroupId()==0;
    }

    public String getDb() {
        return db;
    }

    public void setDb(String db) {
        this.db = db;
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

}


