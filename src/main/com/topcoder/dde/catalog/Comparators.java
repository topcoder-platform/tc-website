/*
 * Comparators.java
 * 23 September 2002
 * 1.0
 *
 * Copyright (c) 2002, TopCoder, Inc.
 * All rights reserved.
 */


package com.topcoder.dde.catalog;

import java.io.Serializable;
import java.util.Comparator;


/**
 * A private class that provides <code>Comparator</code>s to enable the catalog
 * to return sorted results. This class cannot be instantiated.
 *
 * @version 1.0, 23 September 2002
 * @author  Albert Mao
 */
class Comparators {


    private Comparators() {
    }


    public static class ComponentSummarySorter
            implements Serializable, Comparator {
        public int compare(Object o1, Object o2) {
            ComponentSummary t1 = (ComponentSummary) o1;
            ComponentSummary t2 = (ComponentSummary) o2;
            return t1.getName().compareTo(t2.getName());
        }
    }

    public static class CategorySorter
            implements Serializable, Comparator {
        public int compare(Object o1, Object o2) {
            Category t1 = (Category) o1;
            Category t2 = (Category) o2;
            return t1.getName().compareTo(t2.getName());
        }
    }

    public static class VersionSorter
            implements Serializable, Comparator {
        public int compare(Object o1, Object o2) {
            long t1 = ((ComponentVersionInfo) o1).getVersion();
            long t2 = ((ComponentVersionInfo) o2).getVersion();
            if (t1 < t2) {
                return 1;
            } else if (t1 > t2) {
                return -1;
            } else {
                return 0;
            }
        }
    }

    public static class ReviewSorter
            implements Serializable, Comparator {
        public int compare(Object o1, Object o2) {
            Review t1 = (Review) o1;
            Review t2 = (Review) o2;
            return t1.getReviewDate().compareTo(t2.getReviewDate());
        }
    }

    public static class DocumentSorter
            implements Serializable, Comparator {
        public int compare(Object o1, Object o2) {
            Document t1 = (Document) o1;
            Document t2 = (Document) o2;
            if (t1.getType() < t2.getType()) {
                return -1;
            } else if (t1.getType() > t2.getType()) {
                return 1;
            } else {
                return t1.getName().compareTo(t2.getName());
            }
        }
    }

    public static class ExampleSorter
            implements Serializable, Comparator {
        public int compare(Object o1, Object o2) {
            Example t1 = (Example) o1;
            Example t2 = (Example) o2;
            return t1.getDescription().compareTo(t2.getDescription());
        }
    }

    public static class DownloadSorter
            implements Serializable, Comparator {
        public int compare(Object o1, Object o2) {
            Download t1 = (Download) o1;
            Download t2 = (Download) o2;
            return t1.getDescription().compareTo(t2.getDescription());
        }
    }

    public static class TechnologySorter
            implements Serializable, Comparator {
        public int compare(Object o1, Object o2) {
            Technology t1 = (Technology) o1;
            Technology t2 = (Technology) o2;
            return t1.getName().compareTo(t2.getName());
        }
    }

    public static class RoleSorter
            implements Serializable, Comparator {
        public int compare(Object o1, Object o2) {
            Role t1 = (Role) o1;
            Role t2 = (Role) o2;
            return t1.getName().compareTo(t2.getName());
        }
    }

    public static class TeamMemberRoleSorter
            implements Serializable, Comparator {
        /*
         * WARNING: This comparator is inconsistent with equals. Since the
         * username is not defined (has a value of null) in TeamMemberRole
         * objects that are constructed by the client, it is not checked for
         * equality when comparing two TeamMemberRoles.
         */
        public int compare(Object o1, Object o2) {
            TeamMemberRole t1 = (TeamMemberRole) o1;
            TeamMemberRole t2 = (TeamMemberRole) o2;
            return t1.getUsername().compareTo(t2.getUsername());
        }
    }

    public static class LicenseLevelSorter
            implements Serializable, Comparator {
        public int compare(Object o1, Object o2) {
            double t1 = ((LicenseLevel) o1).getPriceMultiplier();
            double t2 = ((LicenseLevel) o2).getPriceMultiplier();
            if (t1 < t2) {
                return -1;
            } else if (t1 > t2) {
                return 1;
            } else {
                return 0;
            }
        }
    }

    public static class ForumSorter
            implements Serializable, Comparator {
        public int compare(Object o1, Object o2) {
            Forum t1 = (Forum) o1;
            Forum t2 = (Forum) o2;
            return t2.getStartDate().compareTo(t1.getStartDate());
        }
    }


}