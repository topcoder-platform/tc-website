package com.topcoder.web.reg.model;

import com.topcoder.web.common.model.Base;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 7, 2006
 */
public class DemographicAnswer extends Base {
    private Long id;
    private Long questionId;
/*
    private DemographicQuestion question;
*/
    private String text;
    private Integer sort;
    private String status;

    protected DemographicAnswer() {

    }
    
    public Long getId() {
        return id;
    }

    public Long getQuestionId() {
        return questionId;
    }

/*
    public DemographicQuestion getQuestion() {
        return question;
    }
*/

    public String getText() {
        return text;
    }

    public Integer getSort() {
        return sort;
    }

    public String getStatus() {
        return status;
    }


    public void setId(Long id) {
        this.id = id;
    }

/*
    public void setQuestion(DemographicQuestion question) {
        this.question = question;
    }
*/

    public void setText(String text) {
        this.text = text;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public void setStatus(String status) {
        this.status = status;
    }


}
