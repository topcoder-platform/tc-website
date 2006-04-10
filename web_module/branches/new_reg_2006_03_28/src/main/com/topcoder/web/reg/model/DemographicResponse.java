package com.topcoder.web.reg.model;

import com.topcoder.web.common.model.Base;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 7, 2006
 */
public class DemographicResponse extends Base {
    //todo this may need to change to user id for the corporate demographic question
    //todo or perhaps we just move this stuff to common and refactor a little.
    private Long coderId;
    private Long questionId;
    private Long answerId;
    private String response;

    public Long getCoderId() {
        return coderId;
    }

    public void setCoderId(Long coderId) {
        this.coderId = coderId;
    }

    public Long getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Long questionId) {
        this.questionId = questionId;
    }

    public Long getAnswerId() {
        return answerId;
    }

    public void setAnswerId(Long answerId) {
        this.answerId = answerId;
    }

    public String getResponse() {
        return response;
    }

    public void setResponse(String response) {
        this.response = response;
    }
}
