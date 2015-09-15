package com.topcoder.web.query.request;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.query.Input;
import com.topcoder.web.query.common.Constants;

import java.util.Enumeration;
import java.util.HashSet;

/**
 * @author Greg Paul
 *
 */

public class ModifyInput extends BaseProcessor {

    private static Logger log = Logger.getLogger(ModifyInput.class);

    private String db;
    private long inputId;
    private String inputCode;
    private String inputDesc;
    private int dataTypeId;
    private HashSet illegalInputs;

    /* Creates a new Login */
    public ModifyInput() {
        super();
        db = "";
        inputId = 0;
        inputCode = "";
        inputDesc = "";
        dataTypeId = 0;
        illegalInputs = new HashSet();
        illegalInputs.add(DataAccessConstants.COMMAND.toLowerCase());
        illegalInputs.add(DataAccessConstants.NUMBER_RECORDS.toLowerCase());
        illegalInputs.add(DataAccessConstants.START_RANK.toLowerCase());
        illegalInputs.add(DataAccessConstants.END_RANK.toLowerCase());
        illegalInputs.add(DataAccessConstants.SORT_COLUMN.toLowerCase());
        illegalInputs.add(DataAccessConstants.SORT_QUERY.toLowerCase());
        illegalInputs.add(DataAccessConstants.SORT_DIRECTION.toLowerCase());
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

    protected void businessProcessing() throws TCWebException {
        String step = getRequest().getParameter(Constants.STEP_PARAM);
        try {
            Input i = (Input) createEJB(getInitialContext(), Input.class);

            if (step != null && step.equals(Constants.SAVE_STEP)) {
                checkInputCode(getInputCode(), i);
                checkInputDesc(getInputDesc());
                checkDataTypeId(getDataTypeId());
                checkInputId(getInputId(), i);
                if (!hasErrors()) {
                    if (isNewInput()) {
                        setInputId(i.createInput(getInputCode(), getDataTypeId(), getInputDesc(), getDb()));
                    } else {
                        i.setInputCode(getInputId(), getInputCode(), getDb());
                        i.setInputDesc(getInputId(), getInputDesc(), getDb());
                        i.setDataTypeId(getInputId(), getDataTypeId(), getDb());
                    }
                }
            } else {
                if (!isNewInput()) {
                    setInputCode(i.getInputCode(getInputId(), getDb()));
                    setInputDesc(i.getInputDesc(getInputId(), getDb()));
                    setDataTypeId(i.getDataTypeId(getInputId(), getDb()));
                }

            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw(new TCWebException(e));
        }

        getRequest().setAttribute(this.getClass().getName().substring(this.getClass().getName().lastIndexOf(".") + 1), this);
        setNextPage(Constants.MODIFY_INPUT_PAGE);
        setIsNextPageInContext(true);
    }

    public void setAttributes(String paramName, String paramValues[]) {
        String value = paramValues[0];
        value = (value == null ? "" : value.trim());
        log.debug("setAttributes called...param: " + paramName + " value: " + value);

        if (paramName.equalsIgnoreCase(Constants.DB_PARAM)) {
            setDb(value);
        } else if (paramName.equalsIgnoreCase(Constants.INPUT_ID_PARAM)) {
            try {
                setInputId(Long.parseLong(value));
            } catch (NumberFormatException e) {
                addError(paramName, e);
            }
        } else if (paramName.equalsIgnoreCase(Constants.INPUT_DESC_PARAM)) {
            setInputDesc(value);
        } else if (paramName.equalsIgnoreCase(Constants.INPUT_CODE_PARAM)) {
            setInputCode(value);
        } else if (paramName.equalsIgnoreCase(Constants.DATA_TYPE_ID_PARAM)) {
            try {
                setDataTypeId(Integer.parseInt(value));
            } catch (NumberFormatException e) {
                addError(paramName, e);
            }
        }
    }

    private void checkInputCode(String inputCode, Input i) throws Exception {
        if (isEmpty(inputCode)) {
            addError(Constants.INPUT_CODE_PARAM, "You must enter an input code");
        } else if (i.inputCodeExists(inputCode, getDb()) && isNewInput()) {
            addError(Constants.INPUT_CODE_PARAM, "Input Code already exists");
        } else if (inputCode.length() > 25) {
            addError(Constants.INPUT_CODE_PARAM, "Input Code too long");
        } else if (containsNonLetters(inputCode)) {
            addError(Constants.INPUT_CODE_PARAM, "Invalid input code, letters only");
        } else if (illegalInputs.contains(inputCode.trim().toLowerCase())) {
            addError(Constants.INPUT_CODE_PARAM, "Invalid input code");
        }
    }

    private void checkInputDesc(String inputDesc) {
        if (isEmpty(inputDesc)) {
            addError(Constants.INPUT_DESC_PARAM, "You must enter an input description");
        } else if (inputDesc.length() > 100) {
            addError(Constants.INPUT_DESC_PARAM, "Input description too long");
        }
    }

    private void checkDataTypeId(int dataTypeId) {
        boolean found = false;
        for (int i = 0; i < Constants.DATA_TYPE_IDS.length && !found; i++) {
            found = Constants.DATA_TYPE_IDS[i] == dataTypeId;
        }
        if (!found) {
            addError(Constants.DATA_TYPE_ID_PARAM, "Invalid data type");
        }
    }

    private void checkInputId(long inputId, Input i) throws Exception {
        if (!isNewInput()) {
            if (i.getInputCode(inputId, getDb()) == null) {
                addError(Constants.INPUT_ID_PARAM, "Invalid input id");
            }
        }
    }

    private boolean containsNonLetters(String s) {
        for (int i = 0; i < s.length(); i++) {
            char ch = s.charAt(i);
            if ("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".indexOf(ch) < 0) {
                return true;
            }
        }
        return false;
    }

    public boolean isNewInput() {
        return getInputId() == 0;
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


