package com.topcoder.web.common.model;

import java.io.Serializable;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 13, 2006
 */
public class DemographicAssignment extends Base {
    private DemographicQuestion question;
    private CoderType coderType;
    private RegistrationType regType;
    private Integer sort;
    private String status;
    private Identifier id = new Identifier();
    private Boolean required;

    public DemographicAssignment() {

    }


    public Identifier getId() {
        return id;
    }

    public void setId(Identifier id) {
        this.id = id;
    }

    public DemographicQuestion getQuestion() {
        return question;
    }

    public CoderType getCoderType() {
        return coderType;
    }

    public RegistrationType getRegType() {
        return regType;
    }

    public Integer getSort() {
        return sort;
    }

    public String getStatus() {
        return status;
    }

    public Boolean getRequired() {
        return required;
    }

    public boolean isRequired() {
        return required.booleanValue();
    }

    public boolean equals(Object o) {
        if (o == null) {
            return false;
        } else {
            try {
                DemographicAssignment oa = (DemographicAssignment) o;
                return oa.getQuestion().equals(question) && oa.getRegType().equals(regType) && oa.getCoderType().equals(coderType);
            } catch (ClassCastException e) {
                return false;
            }
        }
    }

    public static class Identifier implements Serializable {
        private Long demographicQuestionId;
        private Integer coderTypeId;
        private Integer regTypeId;

        public Identifier() {

        }

        public Identifier(Long demographicQuestionId, Integer coderTypeId, Integer regTypeId) {
            this.demographicQuestionId = demographicQuestionId;
            this.coderTypeId = coderTypeId;
            this.regTypeId = regTypeId;
        }

        public Long getDemographicQuestionId() {
            return demographicQuestionId;
        }

        public void setDemographicQuestionId(Long demographicQuestionId) {
            this.demographicQuestionId = demographicQuestionId;
        }

        public Integer getCoderTypeId() {
            return coderTypeId;
        }

        public void setCoderTypeId(Integer coderTypeId) {
            this.coderTypeId = coderTypeId;
        }

        public Integer getRegTypeId() {
            return regTypeId;
        }

        public void setRegTypeId(Integer regTypeId) {
            this.regTypeId = regTypeId;
        }


        public boolean equals(Object o) {
            if (o == null) {
                return false;
            } else {
                try {
                    DemographicAssignment.Identifier oa = (DemographicAssignment.Identifier) o;
                    return (oa.coderTypeId.equals(coderTypeId) &&
                            oa.demographicQuestionId.equals(demographicQuestionId) &&
                            oa.regTypeId.equals(regTypeId));
                } catch (ClassCastException e) {
                    return false;
                }
            }
        }

        public int hashCode() {
            StringBuffer buf = new StringBuffer(100);
            buf.append(coderTypeId);
            buf.append(" ");
            buf.append(demographicQuestionId);
            buf.append(" ");
            buf.append(regTypeId);
            return buf.toString().hashCode();
        }
    }


}
