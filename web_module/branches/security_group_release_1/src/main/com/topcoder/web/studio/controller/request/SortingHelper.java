/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * This class is a helper used for supporting multi-sorting.
 * </p>
 * @author duxiaoyang
 * @version 1.0
 */
public final class SortingHelper {

    /**
     * <p>
     * The key used for storing sorting criteria into request.
     * </p>
     */
    public static String SORTING_CRITERIA_KEY = "sortCriteria";

    /**
     * <p>
     * The key used for query tool query input.
     * </p>
     */
    public static String MULTI_SORTING_KEY = "ms";

    /**
     * <p>
     * Gets sorting clause which can be used in SQL statement.
     * </p>
     * @param sortPriority
     *            the sorting priority.
     * @param sortDirection
     *            the sorting direction.
     * @return a string can be used after ORDER BY in SQL statement.
     */
    static String getSortingClause(List<Integer> sortPriority, Map<Integer, Boolean> sortDirection) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < sortPriority.size(); ++i) {
            sb.append(sortPriority.get(i) + 1).append(" ");
            sb.append(sortDirection.get(sortPriority.get(i)) ? "asc" : "desc").append(",");
        }
        return sb.substring(0, sb.length() - 1);
    }

    /**
     * <p>
     * Changes sorting order for the given column. If the column is of the highest priority, its direction will be
     * change; otherwise, its priority will be changed to the top but the direction is kept.
     * </p>
     * @param sortPriority
     *            the sorting priority.
     * @param sortDirection
     *            the sorting direction.
     * @param sortColumn
     *            the column that to be sorted.
     * @param sortOrder
     *            the expected sorting order for the highest priority column.
     * @return the next sorting order of the specified column.
     */
    static String changeSortingOrder(List<Integer> sortPriority, Map<Integer, Boolean> sortDirection, int sortColumn,
            String sortOrder) {
        int pos = sortPriority.indexOf(sortColumn);
        if (pos == 0) {
            sortDirection.put(sortColumn, !sortOrder.equals("asc"));
            return sortOrder.equals("asc") ? "asc" : "desc";
        } else {
            sortPriority.remove(pos);
            sortPriority.add(0, sortColumn);
            return sortDirection.get(sortColumn) ? "desc" : "asc";
        }
    }

    /**
     * <p>
     * Parses sorting parameter into given sort priority list and sort direction map.
     * </p>
     * @param sortParameter
     *            the sorting parameter to parse.
     * @param sortPriority
     *            the sorting priority.
     * @param sortDirection
     *            the sorting direction.
     */
    public static void parseSortingParameter(String sortParameter, List<Integer> sortPriority,
            Map<Integer, Boolean> sortDirection) {
        if (sortParameter != null && sortParameter.trim().length() > 0) {
            sortPriority.clear();
            sortDirection.clear();
        }
        String[] sortColumns = sortParameter.split(",");
        for (String sortColumn : sortColumns) {
            String[] sortCriteria = sortColumn.split("\\s");
            sortPriority.add(Integer.parseInt(sortCriteria[0]) - 1);
            sortDirection.put(Integer.parseInt(sortCriteria[0]) - 1, sortCriteria[1].equals("asc"));
        }
    }
}
