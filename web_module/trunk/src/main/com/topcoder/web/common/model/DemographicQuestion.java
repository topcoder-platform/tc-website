package com.topcoder.web.common.model;

import java.util.Collections;
import java.util.Iterator;
import java.util.Set;
import java.util.TreeSet;

public class DemographicQuestion extends Base {

    public static final Long COLLEGE_MAJOR_DESC = new Long(14);
    public static final Long DEGREE_PROGRAM = new Long(16);
    public static final Long COLLEGE_MAJOR = new Long(17);

    private Long id;
    private String text;
    private Character selectable;
    private String description;
    /*
        private List answers = new ArrayList();
    */
    private Set answers = new TreeSet();

    public static final Character MULTIPLE_SELECT = new Character('M');
    public static final Character SINGLE_SELECT = new Character('Y');
    public static final Character FREE_FORM = new Character('N');

    public Long getId() {
        return id;
    }

    public DemographicQuestion() {
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

    public boolean equals(Object o) {
        if (o == null) {
            return false;
        } else {
            try {
                DemographicQuestion oa = (DemographicQuestion) o;
                return oa.getId().equals(getId());
            } catch (ClassCastException e) {
                return false;
            }
        }
    }

    /**
     * The we're be returning the answers in the correct order.  Really
     * this should be returning a <code>SortedSet</code> but I couldn't
     * get hibernate to work right.
     *
     * @return the potential answers to this question
     */
    public Set getAnswers() {
        return Collections.unmodifiableSet(answers);
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


    public void setId(Long id) {
        this.id = id;
    }

    public void setText(String text) {
        this.text = text;
    }

    public void setSelectable(Character selectable) {
        this.selectable = selectable;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setAnswers(Set answers) {
        this.answers = answers;
    }

    public void addAnswer(DemographicAnswer a) {
        this.answers.add(a);
    }


    public DemographicAnswer getAnswer(Long id) {
        boolean found = false;
        DemographicAnswer da = null;
        for (Iterator it = answers.iterator(); it.hasNext() && !found;) {
            da = (DemographicAnswer) it.next();
            found = da.getId().equals(id);
        }
        return da;
    }


}
