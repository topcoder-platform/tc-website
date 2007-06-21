package com.topcoder.web.common.model;

import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 31, 2006
 */
public class Country extends Base {

    public static final String US_CODE = "840";

    private String code;
    private String name;
    private Set regions;

    public Country() {
        regions = new HashSet();
    }

    public Set getRegions() {
        return Collections.unmodifiableSet(regions);
    }

    public Region getRegionByType(RegionType rt) {
        Region ret = null;
        boolean foundRegion = false;
        for (Iterator it = regions.iterator(); it.hasNext() && !foundRegion;) {
            ret = (Region) it.next();
            if (ret.getType().getId().equals(rt.getId())) {
                foundRegion = true;
            }
        }
        return foundRegion ? ret : null;
    }

    public String getCode() {
        return code;
    }

    public String getName() {
        return name;
    }


    public void setCode(String code) {
        this.code = code;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setRegions(Set regions) {
        this.regions = regions;
    }

    @Override
    public int hashCode() {
        final int PRIME = 31;
        int result = 1;
        result = PRIME * result + ((code == null) ? 0 : code.hashCode());
        result = PRIME * result + ((name == null) ? 0 : name.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        final Country other = (Country) obj;
        if (code == null) {
            if (other.code != null)
                return false;
        } else if (!code.equals(other.code))
            return false;
        if (name == null) {
            if (other.name != null)
                return false;
        } else if (!name.equals(other.name))
            return false;
        return true;
    }


}
