package com.topcoder.web.query.servlet.jsp.tag;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.tag.SelectTag;

import javax.servlet.jsp.JspException;
import java.util.List;

public class CommandGroupSelect extends SelectTag {

    private ResultSetContainer list;

    public CommandGroupSelect() {
        super();
    }

    public void setList(ResultSetContainer list) {
        this.list = list;
    }

    protected String getOptionValue(Object o) {
        return ((ResultSetContainer.ResultSetRow) o).getItem("command_group_id").toString();
    }

    protected String getOptionText(Object o) {
        return ((ResultSetContainer.ResultSetRow) o).getItem("command_group_name").toString();
    }

    protected List getSelectOptions() throws JspException {
        return list;
    }
}

