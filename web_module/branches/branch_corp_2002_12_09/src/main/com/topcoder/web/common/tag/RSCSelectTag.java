package com.topcoder.web.common.tag;

import java.util.List;

import javax.servlet.jsp.JspException;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

/**
 * Select tag for the ResultSetContainer
 * 
 * @author djFD molc@mail.ru
 * @version 1.02
 */
public class RSCSelectTag extends SelectTag {
    private String fieldValue = null;
    private String fieldText = null;
    private ResultSetContainer list = null;
     
    /**
     * Sets the fieldText.
     * @param fieldText The fieldText to set
     */
    public void setFieldText(String txt) {
        fieldText = txt;
    }

    /**
     * Sets the fieldValue.
     * @param fieldValue The fieldValue to set
     */
    public void setFieldValue(String val) {
        fieldValue = val;
    }
    /**
     * Sets the list.
     * @param list The list to set
     */
    public void setList(ResultSetContainer rsc) {
        list = rsc;
    }
    
    /**
     * 
     * @see com.topcoder.web.common.tag.SelectTag#getOptionText(java.lang.Object)
     */
    String getOptionText(Object o) {
        ResultSetContainer.ResultSetRow row;
        row = (ResultSetContainer.ResultSetRow) o;
        return row.getItem(fieldText).toString();
    }

    /**
     * @see com.topcoder.web.common.tag.SelectTag#getOptionValue(java.lang.Object)
     */
    String getOptionValue(Object o) {
        ResultSetContainer.ResultSetRow row;
        row = (ResultSetContainer.ResultSetRow) o;
        return row.getItem(fieldValue).toString();
    }

    /**
     * @see com.topcoder.web.common.tag.SelectTag#getSelectOptions()
     */
    List getSelectOptions() throws JspException {
        return list;
    }
    /**
     * @see com.topcoder.web.common.tag.SelectTag#getSelected()
     */
    String getSelected() throws JspException {
        setSelectedValue((String)getDefaultValue());
        return super.getSelected();
    }

}
