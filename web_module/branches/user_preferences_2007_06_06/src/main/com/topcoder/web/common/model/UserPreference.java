package com.topcoder.web.common.model;

import java.io.Serializable;


/**
 * A class to hold user preference data.
 *
 * @author cucu
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: July 6, 2006
 */
public class UserPreference extends Base {

    private Identifier id = new Identifier();
    private String value;
    private PreferenceValue preferenceValue;

    public UserPreference() {
    }

    public Identifier getId() {
        return id;
    }

    public void setId(Identifier id) {
        this.id = id;
    }

    public PreferenceValue getPreferenceValue() {
        return preferenceValue;
    }

    public void setPreferenceValue(PreferenceValue preferenceValue) {
        this.preferenceValue = preferenceValue;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }


    
    
    public static class Identifier implements Serializable {
        private User user;
        private Preference preference;

        public Identifier(User user, Preference preference) {
            this.user = user;
            this.preference = preference;
        }

        public Identifier() {
        }

        public Preference getPreference() {
            return preference;
        }

        public void setPreference(Preference preference) {
            this.preference = preference;
        }

        public User getUser() {
            return user;
        }

        public void setUser(User user) {
            this.user = user;
        }

        public boolean equals(Object o) {
            if (o == null) {
                return false;
            }
            try {
                UserPreference.Identifier up = (UserPreference.Identifier) o;
                boolean e = (up.getPreference().getId().equals(getPreference().getId()) &&
                        up.getUser().getId().equals(getUser().getId()));
                log.debug("------------");
                log.debug("getPreference().getId(): " + getPreference().getId());
                log.debug("getUser().getId(): " + getUser().getId());
                log.debug("up.getPreference().getId(): " + up.getPreference().getId());
                log.debug("up.getUser().getId(): " + up.getUser().getId());
                log.debug("Identifier.equals: " + e);
                return e;
            } catch (ClassCastException e) {
                return false;
            }

        }

        public int hashCode() {
            log.debug("------------");
            log.debug("user.getId(): " + user.getId());
            log.debug("preference.getId(): " + preference.getId());
            int i = (user.getId() + " " + preference.getId()).hashCode();
            log.debug("Identifier.hashcode: " + i);
            return i;
        }

    }

    @Override
    public int hashCode() {
        log.debug("---UserPreference.hashCode()---------");
        return id.hashCode();
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            log.debug("1) UserPreference.equals() : true");
            return true;
        }
        if (obj == null) {
            log.debug("2) UserPreference.equals() : false");
            return false;
        }
        
        if (getClass() != obj.getClass()) {
            log.debug("3) UserPreference.equals() : false");
            return false;
        }

        final UserPreference other = (UserPreference) obj;
        if (id == null) {
            if (other.id != null) {
                log.debug("4) UserPreference.equals() : false");
                return false;
            }
        } else if (!id.equals(other.id)) {
            log.debug("5) UserPreference.equals() : false");
            return false;
        }
        return true;
    }

}
