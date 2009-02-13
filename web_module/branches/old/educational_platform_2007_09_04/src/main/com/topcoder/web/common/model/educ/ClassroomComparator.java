/*
* ProfessorComparator
*
* Created Oct 8, 2007
*/
package com.topcoder.web.common.model.educ;

import java.util.Comparator;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class ClassroomComparator implements Comparator<Classroom> {

    public int compare(Classroom o1, Classroom o2) {
        return o1.getName().compareTo(o2.getName()); 
    }

}
