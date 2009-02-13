package com.topcoder.web.common.model;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.model.Base;
import com.topcoder.web.common.model.DemographicAnswer;

import java.util.*;

public class DemographicQuestion extends Base implements Comparable {
    protected static Logger log = Logger.getLogger(DemographicQuestion.class);

    public static final int MULTIPLE_SELECT = 1;
    public static final int SINGLE_SELECT = 2;
    public static final int FREE_FORM = 3;

    private long id;
    private String text;
    private String desc;
    private String selectable;
    private boolean required;
    private HashMap answers;
    private int sort;

    public DemographicQuestion() {
    }

    public Object clone() throws OutOfMemoryError {
        DemographicQuestion ret = new DemographicQuestion();
        ret.setId(id);
        ret.setText(text);
        ret.setDesc(desc);
        ret.setSelectable(selectable);
        ret.setRequired(required);
        ret.setSort(sort);
        HashMap list = new HashMap();
        DemographicAnswer a = null;
        for (Iterator it = answers.values().iterator(); it.hasNext();) {
            a = (DemographicAnswer) it.next();
            list.put(new Long(a.getAnswerId()), a.clone());
        }
        ret.setAnswers(list);
        return ret;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    /**
     * get the list of potential answers associated with this question.
     * they will be returned in ascending order based on their sort
     * order from the database
     * @return
     */
    public List getAnswers() {
        List list = null;
        if (answers != null) {
            list = new ArrayList(answers.size());
            for (Iterator it = answers.values().iterator(); it.hasNext();) {
                list.add(((DemographicAnswer) it.next()).clone());
            }
            Collections.sort(list);
        }
        return list;
    }

    public void setAnswers(List answers) {
        this.answers = new HashMap();
        DemographicAnswer a = null;
        for (Iterator it = answers.iterator(); it.hasNext();) {
            a = (DemographicAnswer) it.next();
            this.answers.put(new Long(a.getAnswerId()), a.clone());
        }
    }

    private void setAnswers(HashMap answers) {
        this.answers = answers;
    }

    /**
     * return an answer specified by the input.  returns null
     * if the answer is not associated with this question
     * @param answerId
     * @return
     */
    public DemographicAnswer getAnswer(long answerId) {
        Long key = new Long(answerId);
        DemographicAnswer ret = null;
        if (answers.containsKey(key))
            ret = (DemographicAnswer) ((DemographicAnswer) answers.get(key)).clone();
        return ret;
    }

    public int getAnswerType() {
        if (selectable.equals("M"))
            return MULTIPLE_SELECT;
        else if (selectable.equals("Y"))
            return SINGLE_SELECT;
        else if (selectable.equals("N")) return FREE_FORM;
        throw new RuntimeException("Invalid type found: " + selectable);
    }

    public void setSelectable(String selectable) {
        this.selectable = selectable;
    }

    public boolean isRequired() {
        return required;
    }

    public void setRequired(boolean required) {
        this.required = required;
    }

    public int getSort() {
        return sort;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }

    public int compareTo(Object o) {
        DemographicQuestion other = (DemographicQuestion) o;
        return new Integer(getSort()).compareTo(new Integer(other.getSort()));
    }

}
