package com.topcoder.web.query.bean.task;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.query.common.AuthenticationException;
import com.topcoder.web.query.common.Constants;
import com.topcoder.web.query.ejb.QueryServices.Command;
import com.topcoder.web.query.ejb.QueryServices.CommandHome;
import com.topcoder.web.common.BaseProcessor;

import java.util.Enumeration;

/**
 * @author Greg Paul
 *
 */

public class CommandListTask extends BaseProcessor {

    private static Logger log = Logger.getLogger(CommandListTask.class);

    private ResultSetContainer commandList;
    private String db;

    /* Creates a new LoginTask */
    public CommandListTask() {
        super();
        db = "";
    }

	protected void baseProcessing() throws Exception {
        if (userIdentified()) {
            throw new AuthenticationException("User not authenticated for access to query tool resource.");
        }
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
        CommandHome cHome = (CommandHome) getInitialContext().lookup(ApplicationServer.Q_COMMAND);
        Command c = cHome.create();
        setCommandList(c.getCommandList(getDb()));
        super.setNextPage(Constants.COMMAND_LIST_PAGE);
    }

    public void setAttributes(String paramName, String paramValues[]) {
        String value = paramValues[0];
        value = (value == null?"":value.trim());

        if (paramName.equalsIgnoreCase(Constants.DB_PARAM))
            setDb(value);
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



}


