package com.topcoder.web.tc.controller.legacy.reg.bean;

// package com.topcoder.web.bean;

import com.topcoder.common.web.data.User;
import com.topcoder.shared.util.logging.Logger;

import java.io.Serializable;
import java.util.Hashtable;

public class Task implements Serializable {
    private static Logger log = Logger.getLogger(Task.class);
    protected Hashtable errors;
    protected boolean userChanged;
    protected User user;
    protected String step;
    protected String[] validSteps;

    public Task() {
        super();
        errors = new Hashtable();
        userChanged = false;
        user = null;
        step = null;
        validSteps = new String[0];
    }

    void init() {
    }

    public boolean addError(String key, Object error) {
        if (!hasError(key)) {
            errors.put(key, error);
            return true;
        }
        return false;
    }

    public String getError(String key) {
        if (errors.containsKey(key) && errors.get(key) != null) {
            return errors.get(key).toString();
        }
        return "";
    }

    public boolean hasError(String key) {
        return errors.containsKey(key);
    }

    public boolean removeError(String key) {
        if (hasError(key)) {
            errors.remove(key);
            return true;
        }
        return false;
    }

    public void clearErrors() {
        errors.clear();
    }

    public String getClearErrors() {
        clearErrors();
        return "";
    }

    public boolean isValid() {
        return errors.size() == 0;
    }

    public boolean isEmpty(String s) {
        return s == null || s.trim().length() == 0;
    }

    public boolean isNumber(String s) {
        if (isEmpty(s)) return false;
        for (int i = 0; i < s.length(); i++) {
            if (!Character.isDigit(s.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    public boolean isNumber(String s, boolean acceptFloat) {
        if (isEmpty(s)) return false;
        if (acceptFloat) {
            try {
                Float.parseFloat(s);
            } catch (Exception e) {
                return false;
            }
        } else {
            for (int i = 0; i < s.length(); i++) {
                if (!Character.isDigit(s.charAt(i))) {
                    return false;
                }
            }
        }
        return true;
    }

    public void setUser(User user) {
        log.debug("Task.setUser()");
        if (user != null && (this.user == null || this.user.getUserId() != user.getUserId())) {
            log.debug("...userId=" + user.getUserId());
            this.userChanged = true;
            this.user = user;
        }
    }

    public void resetUser() {
        this.user = null;
    }

    public User getUser() {
        return this.user;
    }

    public void setStep(String step) {
        if (step != null) {
            for (int i = 0; i < validSteps.length; i++) {
                if (validSteps[i].equalsIgnoreCase(step)) {
                    log.debug("Task.setStep(\"" + step + "\")");
                    this.step = step;
                }
            }
        } else {
            this.step = null;
        }
    }

    public String getStep() {
        return step;
    }

    public boolean isStep(String s) {
        log.debug("s: " + s + " step : " + step);
        return s != null && step != null && step.equalsIgnoreCase(s);
    }

    public void process()
            throws TaskException {
    }

    public String getNextPage() {
        return "";
    }

    public boolean setAttribute(String name, String value) {
        return false;
    }

    public boolean setAttributes(String name, String[] value) {
        return false;
    }
}
