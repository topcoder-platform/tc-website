package com.topcoder.web.query.request;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.query.common.Constants;
import com.topcoder.web.query.ejb.QueryServices.Command;
import com.topcoder.web.query.ejb.QueryServices.CommandHome;
import com.topcoder.web.common.BaseProcessor;

import java.util.Enumeration;

/**
 * @author Greg Paul
 *
 */

public class CommandList extends BaseProcessor {

    private static Logger log = Logger.getLogger(CommandList.class);

    private ResultSetContainer commandList;
    private String db;

    /* Creates a new Login */
    public CommandList() {
        super();
        db = "";
    }

	protected void baseProcessing() throws Exception {
        Enumeration parameterNames = request.getParameterNames();
        log.debug("baseProcessng called: " + parameterNames.toString());
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
        log.debug("putting this into request as " + this.getClass().getName());
        request.setAttribute(this.getClass().getName(), this);
        setNextPage(Constants.COMMAND_LIST_PAGE);
        setIsNextPageInContext(true);
    }

    public void setAttributes(String paramName, String paramValues[]) {
        log.debug("set attrbutes called " + paramName + " " + paramValues[0]);
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


