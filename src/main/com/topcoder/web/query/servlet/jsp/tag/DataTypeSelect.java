package com.topcoder.web.query.servlet.jsp.tag;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.query.common.Constants;

import javax.servlet.jsp.JspException;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.TreeMap;

public class DataTypeSelect extends Select {

    private List list;

    public DataTypeSelect() {
        super();
        list = new ArrayList();
        TreeMap m = null;
        for (int i=0; i<Constants.DATA_TYPE_IDS.length; i++) {
            m = new TreeMap();
            m.put(Constants.DATA_TYPE_ID_PARAM, Constants.DATA_TYPE_DESCS[i]);
            list.add(m);
        }
    }

    String getOptionValue(Object o) {
        return ((TreeMap)o).firstKey().toString();
    }

    String getOptionText(Object o) {
        return ((TreeMap)o).get(((TreeMap)o).firstKey()).toString();
    }

    List getSelectOptions() throws JspException {
        return list;
    }
}

