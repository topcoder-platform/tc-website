package com.topcoder.web.tc.view.reg.tag;

import com.topcoder.common.web.data.State;
import com.topcoder.common.web.util.Cache;
import com.topcoder.ejb.DataCache.DataCache;
import com.topcoder.ejb.DataCache.DataCacheHome;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCContext;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.jsp.JspException;
import java.util.ArrayList;

public class StateSelect
        extends Select {
    public State NOT_IN_US;
    public State SEPARATOR;

    public StateSelect() {
        super();
        init();
    }

    void init() {
        NOT_IN_US = getState("ZZ", "Not In US");
        SEPARATOR = getState("", "-----------------------");
    }

    State getState(String code, String name) {
        State s = new State();
        s.setStateCode(code);
        s.setStateName(name);
        return s;
    }


    String getOptionValue(Object o) {
        return ((State) o).getStateCode();
    }

    String getOptionText(Object o) {
        return ((State) o).getStateName();
    }

    ArrayList getSelectOptions()
            throws JspException {
        ArrayList states = new ArrayList(100);
        InitialContext context = null;
        states.add(NOT_IN_US);
        //states.add ( SEPARATOR );
        try {
            context = TCContext.getInitial();
            DataCache dataCache = Cache.get(context);
            ArrayList temp = new ArrayList(dataCache.getStates());
            for (int i = 0; i < temp.size(); i++) {
                State state = (State) temp.get(i);
                if (state.equals(NOT_IN_US)) {
                    temp.remove(i);
                }
            }
            states.addAll(temp);
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
        return states;
    }
}
