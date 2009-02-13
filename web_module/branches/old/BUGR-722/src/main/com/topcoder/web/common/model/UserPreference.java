package com.topcoder.web.common.model;

import java.io.Serializable;


/**
 * A class to hold user preference data.
 *
 * @author cucu
 * @version $Revision: 64563 $ Date: 2005/01/01 00:00:00
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
                return e;
            } catch (ClassCastException e) {
                return false;
            }

        }

        public int hashCode() {
            int i = (user.getId() + " " + preference.getId()).hashCode();
            return i;
        }
    }

    @Override
    public int hashCode() {
        return id.hashCode();
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        
        if (getClass() != obj.getClass()) {
            return false;
        }

        final UserPreference other = (UserPreference) obj;
        if (id == null) {
            if (other.id != null) {
                return false;
            }
        } else if (!id.equals(other.id)) {
            return false;
        }
        return true;
    }

}
