package com.topcoder.web.oracle.model;

import com.topcoder.web.common.model.Base;

import java.io.Serializable;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 20, 2007
 */
public class RoundConfig extends Base {
    private String value;
    private Identifier id = new Identifier();


    public Round getRound() {
        return id.getRound();
    }

    public void setRound(Round round) {
        id.setRound(round);
    }

    public RoundProperty getProperty() {
        return id.getProperty();
    }

    public void setProperty(RoundProperty property) {
        id.setProperty(property);
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

    public void setId(RoundConfig.Identifier id) {
        this.id = id;
    }


    public boolean equals(Object o) {
        if (o == null) {
            return false;
        } else {
            try {
                RoundConfig oa = (RoundConfig) o;
                boolean sameContest = (oa.getRound().getId() == null && getRound().getId() == null) ||
                        (oa.getRound().getId() != null && getRound().getId() != null && oa.getRound().getId().equals(getRound().getId()));
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

        if (getRound() == null) {
            buf.append("");
        } else if (getRound().getId() == null) {
            buf.append(getRound().hashCode());
        } else {
            buf.append(getRound().getId());
        }
        buf.append(" ");
        if (getProperty() == null) {
            buf.append("");
        } else if (getProperty().getId() == null) {
            buf.append(getProperty().hashCode());
        } else {
            buf.append(getProperty().getId());
        }
        return buf.toString().hashCode();
    }

    public static class Identifier implements Serializable, Cloneable {

        private RoundProperty property;
        private Round round;

        public Identifier() {

        }

        public Identifier(RoundProperty property, Round round) {
            this.property = property;
            this.round = round;
        }

        public RoundProperty getProperty() {
            return property;
        }

        public void setProperty(RoundProperty property) {
            this.property = property;
        }

        public Round getRound() {
            return round;
        }

        public void setRound(Round round) {
            this.round = round;
        }


        public boolean equals(Object o) {
            if (o == null) {
                return false;
            } else {
                try {
                    RoundConfig.Identifier oa = (RoundConfig.Identifier) o;
                    return (oa.property.getId().equals(property.getId()) &&
                            oa.round.getId().equals(round.getId()));
                } catch (ClassCastException e) {
                    return false;
                }
            }
        }

        public int hashCode() {
            StringBuffer buf = new StringBuffer(100);
            buf.append(property.getId());
            buf.append(" ");
            buf.append(round.getId());
            return buf.toString().hashCode();
        }


    }
}
