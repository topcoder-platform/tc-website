package com.topcoder.web.query.servlet.jsp.tag;

import com.topcoder.web.common.tag.SelectTag;
import com.topcoder.web.query.common.Constants;

import javax.servlet.jsp.JspException;
import java.util.ArrayList;
import java.util.List;
import java.util.TreeMap;

public class DataTypeSelect extends SelectTag {

    private static final List list;
    static {
        list = new ArrayList();
        TreeMap m = null;
        for (int i = 0; i < Constants.DATA_TYPE_IDS.length; i++) {
            m = new TreeMap();
            m.put("" + Constants.DATA_TYPE_IDS[i], Constants.DATA_TYPE_DESCS[i]);
            list.add(m);
        }
    }

    protected String getOptionValue(Object o) {
        return ((TreeMap) o).firstKey().toString();
    }

    protected String getOptionText(Object o) {
        return ((TreeMap) o).get(((TreeMap) o).firstKey()).toString();
    }

    protected List getSelectOptions() throws JspException {
        return list;
    }
}

