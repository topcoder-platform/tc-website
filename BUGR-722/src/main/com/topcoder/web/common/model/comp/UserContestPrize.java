package com.topcoder.web.common.model.comp;

import java.io.Serializable;

import com.topcoder.web.common.model.Base;
import com.topcoder.web.common.model.User;


/**
 * @author cucu
 */
public class UserContestPrize extends Base {

    protected Identifier id = new Identifier();
    protected Double payment = null;

    public Double getPayment() {
        return payment;
    }

    public void setPayment(Double payment) {
        this.payment = payment;
    }

    public UserContestPrize() {
    }

    public Identifier getId() {
        return id;
    }

    public void setId(Identifier id) {
        this.id = id;
    }


    public static class Identifier implements Serializable {

        private User user = null;
        private ContestPrize prize = null;


        public Identifier(User user, ContestPrize prize) {
            super();
            this.user = user;
            this.prize = prize;
        }


        public Identifier() {

        }


        public boolean equals(Object o) {

            if (o == null || !(o instanceof UserContestPrize.Identifier)) {
                return false;
            }
            UserContestPrize.Identifier iec = (UserContestPrize.Identifier) o;
            return iec.getUser().getId().equals(this.getUser().getId())
                && iec.getPrize().getId().equals(this.getPrize().getId());
        }

        public int hashCode() {
            StringBuffer buf = new StringBuffer(100);
            buf.append(getUser().getId());
            buf.append(" ");
            buf.append(getPrize());
            return buf.toString().hashCode();
        }


        public ContestPrize getPrize() {
            return prize;
        }


        public void setPrize(ContestPrize prize) {
            this.prize = prize;
        }


        public User getUser() {
            return user;
        }


        public void setUser(User user) {
            this.user = user;
        }
    }



}
