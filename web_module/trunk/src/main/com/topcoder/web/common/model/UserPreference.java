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
                return (up.getPreference().equals(getPreference()) &&
                        up.getUser().equals(getUser()));
            } catch (ClassCastException e) {
                return false;
            }

        }

        public int hashCode() {
            return (user.getId() + " " + preference.getId()).hashCode();
        }

    }

}
