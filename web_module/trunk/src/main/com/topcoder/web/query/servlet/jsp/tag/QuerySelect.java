package com.topcoder.web.query.servlet.jsp.tag;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.query.common.Constants;

import javax.servlet.jsp.JspException;
import java.util.List;

public class QuerySelect extends Select {

    private ResultSetContainer list;

    public QuerySelect() {
        super();
    }

    public void setList(ResultSetContainer list) {
        this.list = list;
    }

    String getOptionValue(Object o) {
        return Constants.QUERY_ID_PARAM+((ResultSetContainer.ResultSetRow)o).getItem("query_id").toString();
    }

    String getOptionText(Object o) {
        return ((ResultSetContainer.ResultSetRow)o).getItem("query_name").toString();
    }

    List getSelectOptions() throws JspException {
        return list;
    }
}

