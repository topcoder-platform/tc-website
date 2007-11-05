/*
* ProfessorComparator
*
* Created Oct 8, 2007
*/
package com.topcoder.web.common.model.educ;

import java.util.Comparator;

import com.topcoder.web.common.model.Coder;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class StudentComparator implements Comparator<Coder> {
    public int compare(Coder o1, Coder o2) {
        int cmp = o1.getUser().getLastName().compareTo(o2.getUser().getLastName()); 
        if (cmp == 0) {
            cmp = o1.getUser().getFirstName().compareTo(o2.getUser().getFirstName());
        }
        if (cmp == 0) {
            cmp = o1.getUser().getHandle().compareTo(o2.getUser().getHandle());
        }
        return cmp;
    }
}
