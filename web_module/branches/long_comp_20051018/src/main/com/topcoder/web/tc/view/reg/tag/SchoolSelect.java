package com.topcoder.web.tc.view.reg.tag;

import com.topcoder.common.web.data.School;
import com.topcoder.common.web.data.State;
import com.topcoder.common.web.util.Cache;
import com.topcoder.ejb.DataCache.DataCache;

import javax.naming.Context;
import javax.servlet.jsp.JspException;
import java.util.ArrayList;

public class SchoolSelect
        extends Select {
    private String state = null;
    public static School NOT_IN_LIST = new School("Not in List");

    public SchoolSelect() {
        super();
        init();
    }

    void init() {
    }

    String getOptionValue(Object o) {
        return "" + ((School) o).getSchoolId();
    }

    String getOptionText(Object o) {
        return ((School) o).getName();
    }

    public void setState(String state) {
        this.state = state;
    }

    ArrayList getSelectOptions()
            throws JspException {
        ArrayList schools = new ArrayList();
        Context context = null;
        try {
            DataCache cache = Cache.get();
            schools.addAll(cache.getSchools());
        } catch (Exception e) {
            throw new JspException(e.toString());
        } finally {
            if (context != null) {
                try {
                    context.close();
                } catch (Exception e) {
                }
            }
        }
        if (state == null) {
            return schools;
        } else {
            ArrayList schoolsInState = new ArrayList();
            for (int i = 0; i < schools.size(); i++) {
                School school = (School) schools.get(i);
                State schoolState = school.getState();
                if (schoolState != null && (schoolState.getStateCode().equals(state) || schoolState.getStateName().equals(state))) {
                    schoolsInState.add(school);
                }
            }
            schoolsInState.add(NOT_IN_LIST);
            return schoolsInState;
        }
    }
}
