/*
 * FixedWeekdayStartDateCalculator.java
 *
 * Copyright 2005, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;


/**
 * Calculates when a project must start, reading the weekday, hours and minutes from the configuration file.
 *
 * @author cucu
 */
public class FixedWeekdayStartDateCalculator implements StartDateCalculator {

    private Map types;

    /**
     * Will read the configuration file and store the design and development start weekday, hour and minutes.
     *
     * @throws IllegalArgumentException if it can find the needed configuration
     */
    public FixedWeekdayStartDateCalculator() {
        types = new HashMap();
        types.put(new Long (1), new ProjectTypeConfiguration("design"));
        types.put(new Long (2), new ProjectTypeConfiguration("development"));
    }

    /**
     * Calculate when a project should start, after startingFrom date.
     * It will return a fix weekday date at a fix hour:minutes, read from the configuration file.
     *
     * @param startingFrom start after that date
     * @param projectType type of project (design/dev constants)
     * @return the Date to start
     */
    public Date calculateNextStart(Calendar startingFrom, long projectType) {
        ProjectTypeConfiguration config;

        config = (ProjectTypeConfiguration) types.get(new Long(projectType));

        if (config == null) {
            throw new IllegalArgumentException("Invalid project type: " + projectType);
        }

        Calendar date = new GregorianCalendar();
        date.setTime(startingFrom.getTime());
        date.set(Calendar.HOUR_OF_DAY, config.getHour());
        date.set(Calendar.MINUTE, config.getMinutes());
        date.set(Calendar.SECOND, 0);
        date.set(Calendar.MILLISECOND, 0);

        if (date.before(startingFrom)) {
            date.add(Calendar.DAY_OF_MONTH, 1);
        }
        int remainingDays = (config.getWeekday() - date.get(Calendar.DAY_OF_WEEK) + 7) % 7;
        date.add(Calendar.DAY_OF_MONTH, remainingDays);

        return date.getTime();
    }
    /**
     * Calculate when a project should start, using now as the start moment.
     * It will return a fix weekday date at a fix hour:minutes, read from the configuration file.
     *
     * @param projectType type of project (design/dev constants)
     * @return the Date to start
     */
    public Date calculateNextStart(long projectType) {
        return calculateNextStart(new GregorianCalendar(), projectType);

    }

    /**
     * Helper class to store the configuration for each project type.
     * It reads the weekday, hour and minute from the configuration file and stores them.
     */
    class ProjectTypeConfiguration {
        private final int weekday;
        private final int hour;
        private final int minutes;

        public int getWeekday() {
            return weekday;
        }
        public int getHour() {
            return hour;
        }
        public int getMinutes() {
            return minutes;
        }
        public ProjectTypeConfiguration(String configName) {
            try {
                weekday = Integer.parseInt(ConfigHelper.getString(configName + "_start_weekday"));
                hour = Integer.parseInt(ConfigHelper.getString(configName + "_start_hour"));
                minutes = Integer.parseInt(ConfigHelper.getString(configName + "_start_minutes"));
            } catch (Exception e) {
                throw new IllegalArgumentException("can't read or parse from the configuration file using prefix: " + configName);
            }
        }
    }
}
