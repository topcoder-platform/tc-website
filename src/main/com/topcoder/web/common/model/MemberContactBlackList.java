package com.topcoder.web.common.model;

import java.io.Serializable;


/**
 * A class to hold the black list for member contact, i.e. the users that each user has blocked.
 *
 * @author cucu
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: July 6, 2006
 */
public class MemberContactBlackList extends Base {

    private Identifier id;
    private boolean blocked;

    public Identifier getId() {
        return id;
    }

    public boolean isBlocked() {
        return blocked;
    }

    public void setBlocked(boolean blocked) {
        this.blocked = blocked;
    }

    public MemberContactBlackList() {
    }

    public void setId(Identifier id) {
        this.id = id;
    }


    public static class Identifier implements Serializable {
        private User user = null;
        private User blockedUser = null;

        public User getBlockedUser() {
            return blockedUser;
        }

        public void setBlockedUser(User blockedUser) {
            this.blockedUser = blockedUser;
        }

        public User getUser() {
            return user;
        }

        public Identifier() {
        }

        public void setUser(User user) {
            this.user = user;
        }

        public Identifier(User user, User blockedUser) {
            super();
            this.user = user;
            this.blockedUser = blockedUser;
        }

        public boolean equals(Object o) {
            if (o == null) {
                return false;
            }
            try {
                MemberContactBlackList.Identifier up = (MemberContactBlackList.Identifier) o;
                return (up.getBlockedUser().equals(getBlockedUser()) &&
                        up.getUser().equals(getUser()));
            } catch (ClassCastException e) {
                return false;
            }

        }

        public int hashCode() {
            return (user.getId() + " " + blockedUser.getId()).hashCode();
        }

    }


}
