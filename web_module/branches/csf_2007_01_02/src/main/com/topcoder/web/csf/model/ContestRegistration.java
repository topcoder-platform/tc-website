package com.topcoder.web.csf.model;

import com.topcoder.web.common.model.Base;
import com.topcoder.web.common.model.TermsOfUse;
import com.topcoder.web.common.model.User;

import java.io.Serializable;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 19, 2006
 */
public class ContestRegistration extends Base {
    private Contest contest;
    private User user;
    private TermsOfUse terms;
    private ContestRegistration.Identifier id = new ContestRegistration.Identifier();

    public ContestRegistration.Identifier getId() {
        return id;
    }

    public void setId(ContestRegistration.Identifier id) {
        this.id = id;
    }

    public Contest getContest() {
        return contest;
    }

    public void setContest(Contest contest) {
        this.contest = contest;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
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
                ContestRegistration oa = (ContestRegistration) o;
                boolean sameUser = (oa.getUser().getId() == null && getUser().getId() == null) ||
                        (oa.getUser().getId() != null && getUser().getId() != null && oa.getUser().getId().equals(getUser().getId()));
                boolean sameContest = (oa.getContest().getId() == null && getContest().getId() == null) ||
                        (oa.getContest().getId() != null && getContest().getId() != null && oa.getContest().getId().equals(getContest().getId()));
                boolean sameTerms = (oa.getTerms().getId() == null && getTerms().getId() == null) ||
                        (oa.getTerms().getId() != null && getTerms().getId() != null && oa.getTerms().getId().equals(getTerms().getId()));
                return sameUser && sameContest && sameTerms;
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
        if (getContest() == null) {
            buf.append("");
        } else if (getContest().getId() == null) {
            buf.append(getContest().hashCode());
        } else {
            buf.append(getContest().getId());
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
        private Contest contest;

        public Identifier() {

        }

        public Identifier(User user, Contest contest) {
            this.user = user;
            this.contest = contest;
        }

        public User getUser() {
            return user;
        }

        public void setUser(User user) {
            this.user = user;
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
                    ContestRegistration.Identifier oa = (ContestRegistration.Identifier) o;
                    return (oa.user.getId().equals(user.getId()) &&
                            oa.contest.getId().equals(contest.getId()));
                } catch (ClassCastException e) {
                    return false;
                }
            }
        }

        public int hashCode() {
            StringBuffer buf = new StringBuffer(100);
            buf.append(user.getId());
            buf.append(" ");
            buf.append(contest.getId());
            return buf.toString().hashCode();
        }


    }
}
