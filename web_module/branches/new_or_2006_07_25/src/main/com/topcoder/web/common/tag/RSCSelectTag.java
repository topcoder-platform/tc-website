package com.topcoder.web.common.tag;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.servlet.jsp.JspException;
import java.util.Collection;

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
     *
     * @param txt The fieldText to set
     */
    public void setFieldText(String txt) {
        fieldText = txt;
    }

    /**
     * Sets the fieldValue.
     *
     * @param val The fieldValue to set
     */
    public void setFieldValue(String val) {
        fieldValue = val;
    }

    /**
     * Sets the list.
     *
     * @param rsc The list to set
     */
    public void setList(ResultSetContainer rsc) {
        list = rsc;
    }

    /**
     * @see SelectTag#getOptionText(Object)
     */
    protected String getOptionText(Object o) {
        ResultSetContainer.ResultSetRow row;
        row = (ResultSetContainer.ResultSetRow) o;
        return row.getItem(fieldText).toString();
    }

    /**
     * @see com.topcoder.web.common.tag.SelectTag#getOptionValue(java.lang.Object)
     */
    protected String getOptionValue(Object o) {
        ResultSetContainer.ResultSetRow row;
        row = (ResultSetContainer.ResultSetRow) o;
        return row.getItem(fieldValue).toString();
    }

    /**
     * @see com.topcoder.web.common.tag.SelectTag#getSelectOptions()
     */
    protected Collection getSelectOptions() throws JspException {
        return list;
    }

    /**
     * @see com.topcoder.web.common.tag.SelectTag#getSelected()
     */
    protected String getSelected() throws JspException {
        setSelectedValue(getDefaultValue() == null ? "" : getDefaultValue().toString());
        return super.getSelected();
    }

    protected void init() {
        super.init();
        this.fieldValue = null;
        this.fieldText = null;
        this.list = null;
    }

}
