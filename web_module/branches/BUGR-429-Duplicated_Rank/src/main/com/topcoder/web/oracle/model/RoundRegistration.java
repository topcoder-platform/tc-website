package com.topcoder.web.oracle.model;

import com.topcoder.web.common.model.Base;
import com.topcoder.web.common.model.TermsOfUse;
import com.topcoder.web.common.model.User;

import java.io.Serializable;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 22, 2007
 */
public class RoundRegistration extends Base {
    private TermsOfUse terms;
    private Identifier id = new Identifier();

    public Identifier getId() {
        return id;
    }

    public void setId(Identifier id) {
        this.id = id;
    }

    public Round getRound() {
        return id.getRound();
    }

    public void setRound(Round round) {
        id.setRound(round);
    }

    public User getUser() {
        return id.getUser();
    }

    public void setUser(User user) {
        id.setUser(user);
    }

    public TermsOfUse getTerms() {
        return terms;
    }

    public void setTerms(TermsOfUse terms) {
        this.terms = terms;
    }

    public boolean equals(Object o) {
        if (o == null) {
            return false;
        } else {
            try {
                RoundRegistration oa = (RoundRegistration) o;
                boolean sameUser = (oa.getUser().getId() == null && getUser().getId() == null) ||
                        (oa.getUser().getId() != null && getUser().getId() != null && oa.getUser().getId().equals(getUser().getId()));
                boolean setRound = (oa.getRound().getId() == null && getRound().getId() == null) ||
                        (oa.getRound().getId() != null && getRound().getId() != null && oa.getRound().getId().equals(getRound().getId()));
                boolean sameTerms = (oa.getTerms().getId() == null && getTerms().getId() == null) ||
                        (oa.getTerms().getId() != null && getTerms().getId() != null && oa.getTerms().getId().equals(getTerms().getId()));
                return sameUser && setRound && sameTerms;
            } catch (ClassCastException e) {
                return false;
            }
        }
    }

    public int hashCode() {
        StringBuffer buf = new StringBuffer(30);

        if (getUser() == null) {
            buf.append("");
        } else if (getUser().getId() == null) {
            buf.append(getUser().hashCode());
        } else {
            buf.append(getUser().getId());
        }
        buf.append(" ");
        if (getRound() == null) {
            buf.append("");
        } else if (getRound().getId() == null) {
            buf.append(getRound().hashCode());
        } else {
            buf.append(getRound().getId());
        }
        buf.append(" ");
        if (getUser() == null) {
            buf.append("");
        } else if (getUser().getId() == null) {
            buf.append(getUser().hashCode());
        } else {
            buf.append(getUser().getId());
        }
        //log.debug(buf.toString() + " code: " + ret);
        return buf.toString().hashCode();
    }

    public static class Identifier implements Serializable, Cloneable {

        private User user;
        private Round round;

        public Identifier() {

        }

        public Identifier(User user, Round round) {
            this.user = user;
            this.round = round;
        }

        public User getUser() {
            return user;
        }

        public void setUser(User user) {
            this.user = user;
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
                    RoundRegistration.Identifier oa = (RoundRegistration.Identifier) o;
                    return (oa.user.getId().equals(user.getId()) &&
                            oa.round.getId().equals(round.getId()));
                } catch (ClassCastException e) {
                    return false;
                }
            }
        }

        public int hashCode() {
            StringBuffer buf = new StringBuffer(100);
            buf.append(user.getId());
            buf.append(" ");
            buf.append(round.getId());
            return buf.toString().hashCode();
        }


    }
}


