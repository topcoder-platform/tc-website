package com.topcoder.web.common.model.algo;

import java.util.HashSet;
import java.util.Set;

import com.topcoder.web.common.model.Base;

/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jun 4, 2007
 */
public class Language extends Base {
    public static final int JAVA_LANGUAGE = 1;
    public static final int XML_LANGUAGE = 2;
    public static final int CPP_LANGUAGE = 3;
    public static final int CSHARP_LANGUAGE = 4;
    public static final int VB_LANGUAGE = 5;
    public static final int PHYTON_LANGUAGE = 6;

    private Integer id;
    private String name;

    public static Set<Integer> assignmentLanguages = new HashSet<Integer>(4);
    
    // Todo: add an attribute to language table to see what we can use in assignments 
    static {
        assignmentLanguages.add(JAVA_LANGUAGE);
        assignmentLanguages.add(CPP_LANGUAGE);
        assignmentLanguages.add(CSHARP_LANGUAGE);
        assignmentLanguages.add(VB_LANGUAGE);
    }
    
    public Language() {
        
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    @Override
    public int hashCode() {
        final int PRIME = 31;
        int result = 1;
        result = PRIME * result + ((id == null) ? 0 : id.hashCode());
        return result;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#equals(java.lang.Object)
     */
    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        final Language other = (Language) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        return true;
    }
    
    
}
