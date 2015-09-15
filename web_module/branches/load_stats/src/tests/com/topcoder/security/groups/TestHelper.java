/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups;

import java.lang.reflect.Field;

/**
 * <p>
 * Auxiliary tool for unit test.
 * </p>
 * 
 * @author leo_lol
 * @version 1.0
 * @since 1.0
 */
public final class TestHelper {
    /**
     * <p>
     * This helper method retrieve the property value of a given instance by way
     * of Java Reflection.
     * </p>
     * 
     * @param <T>
     * @param instance
     *            The object whose property will be retrieved.
     * @param property
     *            name of the property.
     * @param clazz
     *            Return type.
     * @return the value of property instance holds.
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public static <T> T getProperty(Object instance, String property,
            Class<T> clazz) {

        if (null == instance || null == property
                || property.trim().length() == 0 || null == clazz) {
            throw new IllegalArgumentException();
        }

        property = property.trim();

        T result = null;

        try {
            Class instanceClass = instance.getClass();
            Field propertyField = instanceClass.getDeclaredField(property);
            if (null == propertyField) {
                throw new IllegalArgumentException("Not such field.");
            }
            propertyField.setAccessible(true);
            result = (T) propertyField.get(instance);
        } catch (SecurityException e) {
            e.printStackTrace();
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (NoSuchFieldException e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * <p>
     * Use Java Reflection to set the property's value of the given instance.
     * </p>
     * 
     * @param instance
     *            the object whose property need to be assigned.
     * @param property
     *            the name of the property to assign to.
     * @param value
     *            the value to be assigned.
     */
    @SuppressWarnings("rawtypes")
    public static void setProperty(Object instance, String property,
            Object value) {
        if (null == instance || null == property
                || property.trim().length() == 0) {
            throw new IllegalArgumentException();
        }
        property = property.trim();
        Class instanceClass = instance.getClass();

        try {
            Field propertyField = instanceClass.getDeclaredField(property);
            if (null == propertyField) {
                throw new IllegalArgumentException("Not such field.");
            }
            propertyField.setAccessible(true);
            propertyField.set(instance, value);
        } catch (SecurityException e) {
            e.printStackTrace();
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (NoSuchFieldException e) {
            e.printStackTrace();
        }
    }
}
