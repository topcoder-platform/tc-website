package com.topcoder.web.query.bean;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.query.common.Constants;
import com.topcoder.web.query.common.AuthenticationException;
import com.topcoder.web.query.ejb.QueryServices.*;
import com.topcoder.shared.util.ApplicationServer;


import javax.servlet.http.*;
import java.io.Serializable;

/**
 * @author Greg Paul
 *
 */

public class ModifyGroupTask extends BaseTask implements Task, Serializable {

    private static Logger log = Logger.getLogger(ModifyGroupTask.class);

    private String db;
    private int groupId;
    private String groupDesc;

    /* Creates a new LoginTask */
    public ModifyGroupTask() {
        super();
        setGroupId(0);
        setGroupDesc("");
    }


	public void servletPreAction(HttpServletRequest request, HttpServletResponse response)
            throws AuthenticationException, Exception {
        HttpSession session = request.getSession(true);
        if (!Authentication.isLoggedIn(session)) {
            log.debug("User not authenticated for access to TCES resource.");
            throw new AuthenticationException("User not authenticated for access to TCES resource.");
        }
 	}

    public void servletPostAction(HttpServletRequest request, HttpServletResponse response) throws Exception {
    }

    public void process(String step) throws Exception {
        CommandGroupHome cgHome = (CommandGroupHome) getInitialContext().lookup(ApplicationServer.Q_COMMAND_GROUP);
        CommandGroup cg = cgHome.create();

        cg.setDataSource(getDb());

        if (step!=null && step.equals(Constants.SAVE_STEP)) {
            checkGroupDesc(getGroupDesc());
            if (!super.hasErrors()) {
                if (isNewGroup()) {
                    cg.createCommandGroup(getGroupDesc());
                } else {
                    cg.setCommandGroupDesc(getGroupId(), getGroupDesc());
                }
            }
        } else {
            if (!isNewGroup()) {
                setGroupDesc(cg.getCommandGroupDesc(getGroupId()));
            }
        }
        super.setNextPage(Constants.MODIFY_COMMAND_PAGE);
    }

    public void setAttributes(String paramName, String paramValues[]) {
        String value = paramValues[0];
        value = (value == null?"":value.trim());

        if (paramName.equalsIgnoreCase(Constants.DB_PARAM))
            setDb(value);
        else if (paramName.equalsIgnoreCase(Constants.GROUP_ID_PARAM))
            setGroupId(Integer.parseInt(value));
    }

    private void checkGroupDesc(String groupDesc) {
        if (super.isEmpty(groupDesc)) {
            super.addError(Constants.GROUP_DESC_PARAM, "Invalid Group Description");
        }
    }

    private boolean isNewGroup() {
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


