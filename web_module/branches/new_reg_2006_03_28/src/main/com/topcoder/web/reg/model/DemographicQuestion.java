package com.topcoder.web.reg.model;

import com.topcoder.web.common.model.Base;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 7, 2006
 */
public class DemographicQuestion extends Base {
    private Long id;
    private String text;
    private String selectable;
    private String description;

    protected DemographicQuestion() {

    }
    
    public Long getId() {
        return id;
    }

    public String getText() {
        return text;
    }

    public String getSelectable() {
        return selectable;
    }

    public String getDescription() {
        return description;
    }

    public int hashCode() {
        return id.hashCode();
    }

}
