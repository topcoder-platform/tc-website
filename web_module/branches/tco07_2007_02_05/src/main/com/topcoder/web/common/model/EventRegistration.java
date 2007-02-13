package com.topcoder.web.common.model;

import java.io.Serializable;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2007
 */
public class EventRegistration extends Base {

    private Identifier id = new Identifier();
    private Boolean eligible;

    public Identifier getId() {
        return id;
    }

    public Boolean isEligible() {
        return eligible;
    }

    public void setEligible(Boolean eligible) {
        this.eligible = eligible;
    }

    public void setId(Identifier id) {
        this.id = id;
    }


    public static class Identifier implements Serializable {
        private User user = null;
        private Event event = null;

        public User getUser() {
            return user;
        }

        public void setUser(User user) {
            this.user = user;
        }

        public Identifier() {
        }


        public Event getEvent() {
            return event;
        }

        public void setEvent(Event event) {
            this.event = event;
        }

        public Identifier(User user, Event event) {
            super();
            this.user = user;
            this.event = event;
        }

        public boolean equals(Object o) {
            if (o == null) {
                return false;
            }
            try {
                Identifier up = (Identifier) o;
                return (up.getEvent().getId().equals(getEvent().getId()) &&
                        up.getUser().getId().equals(getUser().getId()));
            } catch (ClassCastException e) {
                return false;
            }

        }

        public int hashCode() {
            return (user.getId() + " " + event.getId()).hashCode();
        }

    }


}
