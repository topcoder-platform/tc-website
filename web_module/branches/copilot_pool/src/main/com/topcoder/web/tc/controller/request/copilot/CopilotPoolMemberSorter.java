/*
 * Copyright (c) 2010 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.web.tc.controller.request.copilot;

import com.topcoder.direct.services.copilot.dto.CopilotPoolMember;
import org.apache.commons.beanutils.BeanComparator;
import org.apache.commons.collections.comparators.ComparableComparator;
import org.apache.commons.collections.comparators.ReverseComparator;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * This is a static helper class that is used by request processor <code>ViewCopilotPool</code> to sort the Copilot pool
 * members with specified sort index or sort property name.
 * </p>
 *
 * <p>This class is only visible in the package com.topcoder.web.tc.controller.request.copilot.
 * </p>
 *
 * <p>Thread-safety: This class is static, and has not no internal state to modify, thus is thread-safe, it can be used
 * by multiple instances of request processor concurrently.
 * </p>
 *
 * @author:TCSASSEMBLER
 * @version 1.0
 */
class CopilotPoolMemberSorter {

    /**
     * The map which is used to cache the created bean comparators.
     */
    private static Map<String, BeanComparator> cachedComparators = new HashMap<String, BeanComparator>();

    /**
     * The map which is used to cached the created reverse bean comparators
     */
    private static Map<String, BeanComparator> cachedReverseComparators = new HashMap<String, BeanComparator>();

    /**
     * The mapping array to map sort index to sort column name.
     */
    private static String[] sortRequestMapping = new String[]{"noSorting", "totalProjects", "totalContests",
            "totalRepostedContests", "totalFailedContests", "totalBugRaces", "currentProjects", "currentContests"};

    /**
     * Private constructor which prevents instantiation of this class.
     */
    private CopilotPoolMemberSorter() {
        // empty
    }

    /**
     * Sort the list of CopilotPoolMember instances by specifying sort request index and sort order.
     *
     * @param toSort the list of CopilotPoolMembers to sort
     * @param sortRequest the sort request index.
     * @param isDescending false for ascending, true for descending
     * @return  the sorted list of CopilotPoolMembers.
     */
    public static List<CopilotPoolMember> sort(List<CopilotPoolMember> toSort, int sortRequest, boolean isDescending) {
        // when sortRequest is 0 we use the default order
        // thus we don't sort the list
        if(sortRequest >0 && (sortRequest % 10) < sortRequestMapping.length) {
            sort(toSort, sortRequestMapping[sortRequest], isDescending);
        }
        return toSort;
    }

    /**
     * Sort the list of CopilotPoolMember instances by specifying sort property name and sort order.
     *
     * @param toSort the list of CopilotPoolMembers to sort
     * @param propertyName the sort property name.
     * @param isDescending false for ascending, true for descending
     * @return  the sorted list of CopilotPoolMembers.
     */
    public static List<CopilotPoolMember> sort(List<CopilotPoolMember> toSort, String propertyName,
                                               boolean isDescending) {
        toSort = new ArrayList<CopilotPoolMember>(toSort);
        
        BeanComparator beanComparator
                = getComparator(propertyName, isDescending);

        Collections.sort(toSort, beanComparator);

        return toSort;
    }

    /**
     * Creates a bean comparator which utilities the apache common bean util lib. If isDescending is true, a reversed
     * bean comparator will be created. If the specified BeanComparator has been created before, it will be retrieved
     * from the cached map.
     *
     * @param propertyName the property name of the bean to sort on.
     * @param isDescending false for ascending, true for descending.
     * @return the BeanComparator instance.
     */
    private static BeanComparator getComparator(String propertyName, boolean isDescending) {
        BeanComparator beanComparator;

        if (isDescending) {
            beanComparator = cachedReverseComparators.get(propertyName);
            if (beanComparator == null) {
                // create new one, and cache it
                beanComparator = new BeanComparator(propertyName, new ReverseComparator(new ComparableComparator()));
                cachedReverseComparators.put(propertyName, beanComparator);
            }
        } else {
            beanComparator = cachedComparators.get(propertyName);
            if (beanComparator == null) {
                beanComparator = new BeanComparator(propertyName);
                cachedComparators.put(propertyName, beanComparator);
            }
        }

        return beanComparator;
    }
}
