package com.topcoder.web.query.servlet.jsp.tag;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.query.common.Constants;

import javax.servlet.jsp.JspException;
import java.util.List;

public class CommandGroupSelect extends Select {

    private ResultSetContainer list;

    public CommandGroupSelect() {
        super();
    }

    public void setList(ResultSetContainer list) {
        this.list = list;
    }

    String getOptionValue(Object o) {
        return ((ResultSetContainer.ResultSetRow)o).getItem("command_group_id").toString();
    }

    String getOptionText(Object o) {
        return ((ResultSetContainer.ResultSetRow)o).getItem("command_group_name").toString();
    }

    List getSelectOptions() throws JspException {
        return list;
    }
}

