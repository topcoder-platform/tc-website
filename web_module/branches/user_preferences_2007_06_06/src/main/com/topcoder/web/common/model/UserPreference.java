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



    @Override
    public int hashCode() {
        final int PRIME = 31;
        int result = 1;
        result = PRIME * result + ((id == null) ? 0 : id.hashCode());
        result = PRIME * result + ((preferenceValue == null) ? 0 : preferenceValue.hashCode());
        result = PRIME * result + ((value == null) ? 0 : value.hashCode());
        log.debug("UserPreference.hashCode() : " + result);
        return result;
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
        if (preferenceValue == null) {
            if (other.preferenceValue != null) {
                log.debug("6) UserPreference.equals() : false");
                return false;
            }
        } else if (!preferenceValue.equals(other.preferenceValue)) {
            log.debug("7) serPreference.equals() : false");
            return false;
        }
        if (value == null) {
            if (other.value != null) {
                log.debug("8) UserPreference.equals() : false");
                return false;
            }
        } else if (!value.equals(other.value)) {
            log.debug("9) UserPreference.equals() : false");
            return false;
        }
        log.debug("10) UserPreference.equals() : true");        
        return true;
    }

}
