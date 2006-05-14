package com.topcoder.web.reg.model;

import com.topcoder.web.common.model.Base;

import java.util.List;
import java.util.Collections;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 7, 2006
 */
public class DemographicQuestion extends Base {
    private Long id;
    private String text;
    private Character selectable;
    private String description;
    private List answers;

    public static final Character MULTIPLE_SELECT = new Character('M');
    public static final Character SINGLE_SELECT = new Character('Y');
    public static final Character FREE_FORM = new Character('N');

    protected DemographicQuestion() {

    }

    public Long getId() {
        return id;
    }

    public String getText() {
        return text;
    }

    public Character getSelectable() {
        return selectable;
    }

    public String getDescription() {
        return description;
    }

    public int hashCode() {
        return id.hashCode();
    }

    public List getAnswers() {
        return Collections.unmodifiableList(answers);
    }

    public boolean isMultipleSelect() {
        return MULTIPLE_SELECT.equals(selectable);
    }

    public boolean isSingleSelect() {
        return SINGLE_SELECT.equals(selectable);
    }

    public boolean isFreeForm() {
        return FREE_FORM.equals(selectable);
    }


}
