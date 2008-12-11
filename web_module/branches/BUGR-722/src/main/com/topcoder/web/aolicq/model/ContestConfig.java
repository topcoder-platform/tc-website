package com.topcoder.web.aolicq.model;

import com.topcoder.web.common.model.Base;

import java.io.Serializable;

/**
 * @author dok
 * @version $Revision: 73726 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 28, 2006
 */
public class ContestConfig extends Base {
    private String value;
    private Identifier id = new Identifier();


    public Contest getContest() {
        return id.getContest();
    }

    public void setContest(Contest contest) {
        this.id.setContest(contest);
    }

    public ContestProperty getProperty() {
        return id.getProperty();
    }

    public void setProperty(ContestProperty property) {
        this.id.setProperty(property);
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public Identifier getId() {
        return id;
    }

    public void setId(Identifier id) {
        this.id = id;
    }


    public boolean equals(Object o) {
        if (o == null) {
            return false;
        } else {
            try {
                ContestConfig oa = (ContestConfig) o;
                boolean sameContest = (oa.getContest().getId() == null && getContest().getId() == null) ||
                        (oa.getContest().getId() != null && getContest().getId() != null && oa.getContest().getId().equals(getContest().getId()));
                boolean sameProperty = (oa.getProperty().getId() == null && getProperty().getId() == null) ||
                        (oa.getProperty().getId() != null && getProperty().getId() != null && oa.getProperty().getId().equals(getProperty().getId()));
                return sameProperty && sameContest;
            } catch (ClassCastException e) {
                return false;
            }
        }
    }

    public int hashCode() {
        StringBuffer buf = new StringBuffer(30);

        if (getContest() == null) {
            buf.append("");
        } else if (getContest().getId() == null) {
            buf.append(getContest().hashCode());
        } else {
            buf.append(getContest().getId());
        }
        buf.append(" ");
        if (getProperty() == null) {
            buf.append("");
        } else if (getProperty().getId() == null) {
            buf.append(getProperty().hashCode());
        } else {
            buf.append(getProperty().getId());
        }
        //log.debug(buf.toString() + " code: " + ret);
        return buf.toString().hashCode();
    }

    public static class Identifier implements Serializable, Cloneable {

        private ContestProperty property;
        private Contest contest;

        public Identifier() {

        }

        public Identifier(ContestProperty property, Contest contest) {
            this.property = property;
            this.contest = contest;
        }

        public ContestProperty getProperty() {
            return property;
        }

        public void setProperty(ContestProperty property) {
            this.property = property;
        }

        public Contest getContest() {
            return contest;
        }

        public void setContest(Contest contest) {
            this.contest = contest;
        }


        public boolean equals(Object o) {
            if (o == null) {
                return false;
            } else {
                try {
                    ContestConfig.Identifier oa = (ContestConfig.Identifier) o;
                    return (oa.property.getId().equals(property.getId()) &&
                            oa.contest.getId().equals(contest.getId()));
                } catch (ClassCastException e) {
                    return false;
                }
            }
        }

        public int hashCode() {
            StringBuffer buf = new StringBuffer(100);
            buf.append(property.getId());
            buf.append(" ");
            buf.append(contest.getId());
            return buf.toString().hashCode();
        }


    }
}




