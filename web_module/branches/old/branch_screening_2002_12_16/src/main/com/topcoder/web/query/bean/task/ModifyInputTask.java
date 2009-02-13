package com.topcoder.web.query.bean.task;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.query.common.AuthenticationException;
import com.topcoder.web.query.common.Constants;
import com.topcoder.web.query.ejb.QueryServices.Input;
import com.topcoder.web.query.ejb.QueryServices.InputHome;
import com.topcoder.web.query.bean.task.BaseTask;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.Serializable;

/**
 * @author Greg Paul
 *
 */

public class ModifyInputTask extends BaseTask implements Task, Serializable {

    private static Logger log = Logger.getLogger(ModifyInputTask.class);

    private String db;
    private long inputId;
    private String inputCode;
    private String inputDesc;
    private int dataTypeId;

    /* Creates a new LoginTask */
    public ModifyInputTask() {
        super();
        db = "";
        inputId = 0;
        inputCode = "";
        inputDesc = "";
        dataTypeId = 0;
    }


	public void servletPreAction(HttpServletRequest request, HttpServletResponse response)
            throws AuthenticationException, Exception {
        super.servletPreAction(request, response);
        if (!super.getAuthentication().isLoggedIn()) {
            throw new AuthenticationException("User not authenticated for access to query tool resource.");
        }
	}

    public void process(String step) throws Exception {
        InputHome iHome = (InputHome) getInitialContext().lookup(ApplicationServer.Q_INPUT);
        Input i = iHome.create();

        i.setDataSource(getDb());

        if (step!=null && step.equals(Constants.SAVE_STEP)) {
            checkInputCode(getInputCode(), i);
            checkInputDesc(getInputDesc());
            checkDataTypeId(getDataTypeId());
            checkInputId(getInputId(), i);
            if (!super.hasErrors()) {
                if (isNewInput()) {
                    setInputId(i.createInput(getInputCode(), getDataTypeId(), getInputDesc()));
                } else {
                    i.setInputCode(getInputId(), getInputCode());
                    i.setInputDesc(getInputId(), getInputDesc());
                    i.setDataTypeId(getInputId(), getDataTypeId());
                }
            }
        } else {
            if (!isNewInput()) {
                setInputCode(i.getInputCode(getInputId()));
                setInputDesc(i.getInputDesc(getInputId()));
                setDataTypeId(i.getDataTypeId(getInputId()));
            }

        }

        super.setNextPage(Constants.MODIFY_INPUT_PAGE);
    }

    public void setAttributes(String paramName, String paramValues[]) {
        String value = paramValues[0];
        value = (value == null?"":value.trim());
        log.debug("setAttributes called...param: " + paramName + " value: " + value);

        if (paramName.equalsIgnoreCase(Constants.DB_PARAM)) {
            setDb(value);
        } else if (paramName.equalsIgnoreCase(Constants.INPUT_ID_PARAM)) {
            try {
                setInputId(Long.parseLong(value));
            } catch (NumberFormatException e) {
                super.addError(paramName, e);
            }
        } else if (paramName.equalsIgnoreCase(Constants.INPUT_DESC_PARAM)) {
            setInputDesc(value);
        } else if (paramName.equalsIgnoreCase(Constants.INPUT_CODE_PARAM)) {
            setInputCode(value);
        } else if (paramName.equalsIgnoreCase(Constants.DATA_TYPE_ID_PARAM)) {
            try {
                setDataTypeId(Integer.parseInt(value));
            } catch (NumberFormatException e) {
                super.addError(paramName, e);
            }
        }
    }

    private void checkInputCode(String inputCode, Input i) throws Exception {
        if (super.isEmpty(inputCode)) {
            super.addError(Constants.INPUT_CODE_PARAM, "You must enter an input code");
        } else if (i.inputCodeExists(inputCode) && isNewInput()) {
            super.addError(Constants.INPUT_CODE_PARAM, "Input Code already exists");
        } else if (inputCode.length() > 25) {
            super.addError(Constants.INPUT_CODE_PARAM, "Input Code too long");
        } else if (containsNonLetters(inputCode)) {
            super.addError(Constants.INPUT_CODE_PARAM, "Invalid input code, letters only");
        } else if (inputCode.trim().toLowerCase().equals(com.topcoder.shared.dataAccess.DataAccessConstants.COMMAND)) {
            super.addError(Constants.INPUT_CODE_PARAM, "Invalid input code");
        }
    }

    private void checkInputDesc(String inputDesc) {
        if (super.isEmpty(inputDesc)) {
            super.addError(Constants.INPUT_DESC_PARAM, "You must enter an input description");
        } else if (inputDesc.length() > 100) {
            super.addError(Constants.INPUT_DESC_PARAM, "Input description too long");
        }
    }

    private void checkDataTypeId(int dataTypeId) {
        boolean found = false;
        for(int i=0; i<Constants.DATA_TYPE_IDS.length && !found; i++) {
            found = Constants.DATA_TYPE_IDS[i]==dataTypeId;
        }
        if (!found) {
            super.addError(Constants.DATA_TYPE_ID_PARAM,  "Invalid data type");
        }
    }

    private void checkInputId(long inputId, Input i) throws Exception {
        if (!isNewInput()) {
            if (i.getInputCode(inputId)==null) {
                super.addError(Constants.INPUT_ID_PARAM, "Invalid input id");
            }
        }
    }

    private boolean containsNonLetters(String s) { 
        for (int i=0; i<s.length(); i++) {
            char ch = s.charAt(i);
            if ("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".indexOf(ch) < 0) {
                return true;
            }
        }
        return false;
    }

    public boolean isNewInput() {
        return getInputId()==0;
    }

    public String getDb() {
        return db;
    }

    public void setDb(String db) {
        this.db = db;
    }

    public long getInputId() {
        return inputId;
    }

    public void setInputId(long inputId) {
        this.inputId = inputId;
    }

    public String getInputCode() {
        return inputCode;
    }

    public void setInputCode(String inputCode) {
        this.inputCode = inputCode;
    }

    public String getInputDesc() {
        return inputDesc;
    }

    public void setInputDesc(String inputDesc) {
        this.inputDesc = inputDesc;
    }

    public int getDataTypeId() {
        return dataTypeId;
    }

    public void setDataTypeId(int dataTypeId) {
        this.dataTypeId = dataTypeId;
    }

}


