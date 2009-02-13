/*
* ProfessorComparator
*
* Created Oct 8, 2007
*/
package com.topcoder.web.common.model.educ;

import java.util.Comparator;

import com.topcoder.web.common.model.User;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class ProfessorComparator implements Comparator<User> {

    public int compare(User o1, User o2) {
        int cmp = o1.getLastName().compareTo(o2.getLastName()); 
        if (cmp == 0) {
            cmp = o1.getFirstName().compareTo(o2.getFirstName());
        }
        return cmp;
    }

}
