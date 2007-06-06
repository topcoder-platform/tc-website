package com.topcoder.dde.persistencelayer.testbean;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import javax.ejb.EJBLocalObject;

final class ToString {

    private static final Set PROHIBITED_PROPERTIES = getProhibitedProperties();
    private static final Object[] NO_PARAMS = new Object[0];
    private static final String ID_PROPERTY_NAME = "id";

    private static Set getProhibitedProperties() {
        Set set = new HashSet();
        set.add("proxyClass");
        set.add("invocationHandler");
        set.add("class");
        set.add("eJBLocalHome");
        return set;
    }

    private ToString() {
    }

    static String toString(Object object) {
        if (object instanceof String) {
            return "\"" + object + "\"";
        }
        if (object instanceof Timestamp) {
            return "'" + object + "'";
        }
        if (object instanceof EJBLocalObject) {
            return toStringEJBLocalObject(object);
        }
        return object.toString();
    }

    private static String toStringEJBLocalObject(Object object) {
        Class aClass = object.getClass();
        Method[] methods = aClass.getMethods();
        List list = new ArrayList();
        for (int i = 0; i < methods.length; i++) {
            Method method = methods[i];
            Class[] parameterTypes = method.getParameterTypes();
            if (parameterTypes.length > 0) {
                continue;
            }
            String methodName = method.getName();
            if (!methodName.startsWith("get")) {
                continue;
            }
            String propertyName = methodName.substring(3);
            if (propertyName.length() <= 0) {
                continue;
            }
            propertyName = Character.toLowerCase(propertyName.charAt(0)) + propertyName.substring(1);
            if (PROHIBITED_PROPERTIES.contains(propertyName)) {
                continue;
            }
            Object result;
            try {
                result = method.invoke(object, NO_PARAMS);
                if (propertyName.equals("primaryKey")) {
                    propertyName = ID_PROPERTY_NAME;
                }
            } catch (IllegalAccessException e) {
                throw new RuntimeException("" + e);
            } catch (IllegalArgumentException e) {
                throw new RuntimeException("" + e);
            } catch (InvocationTargetException e) {
                throw new RuntimeException("" + e);
            }
            list.add(new Element(propertyName, result));
        }
        Collections.sort(list);
        String message = "";
        boolean first = true;
        for (Iterator iterator = list.iterator(); iterator.hasNext();) {
            Element element = (Element) iterator.next();
            if (first) {
                first = false;
            } else {
                message += ", ";
            }
            message += element.getPropertyName() + "=" + ToString.toString(element.getResult());
        }
        return "[" + message + "]";
    }

    private static class Element implements Comparable {

        private final String propertyName;
        private final Object result;

        private Element(String propertyName, Object result) {
            this.propertyName = propertyName;
            this.result = result;
        }

        private String getPropertyName() {
            return propertyName;
        }

        private Object getResult() {
            return result;
        }

        public int compareTo(Object o) {
            Element element = (Element) o;
            String propertyName2 = element.propertyName;
            if (propertyName.equals(propertyName2)) {
                throw new RuntimeException("identical properties: " + propertyName);
            }
            if (propertyName.equals(ID_PROPERTY_NAME)) {
                return -1;
            }
            if (propertyName2.equals(ID_PROPERTY_NAME)) {
                return 1;
            }
            if (result instanceof EJBLocalObject) {
                return 1;
            }
            if (element.result instanceof EJBLocalObject) {
                return -1;
            }
            return 0;
        }

    }

}
