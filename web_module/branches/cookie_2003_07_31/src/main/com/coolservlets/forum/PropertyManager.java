/**
 * PropertyManager.java
 * August 01, 2000
 *
 * Copyright (C) 2000 CoolServlets.com. All rights reserved.
 *
 * ===================================================================
 * The Apache Software License, Version 1.1
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in
 *    the documentation and/or other materials provided with the
 *    distribution.
 *
 * 3. The end-user documentation included with the redistribution,
 *    if any, must include the following acknowledgment:
 *       "This product includes software developed by
 *        CoolServlets.com (http://www.coolservlets.com)."
 *    Alternately, this acknowledgment may appear in the software itself,
 *    if and wherever such third-party acknowledgments normally appear.
 *
 * 4. The names "Jive" and "CoolServlets.com" must not be used to
 *    endorse or promote products derived from this software without
 *    prior written permission. For written permission, please
 *    contact webmaster@coolservlets.com.
 *
 * 5. Products derived from this software may not be called "Jive",
 *    nor may "Jive" appear in their name, without prior written
 *    permission of CoolServlets.com.
 *
 * THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESSED OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED.  IN NO EVENT SHALL COOLSERVLETS.COM OR
 * ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
 * USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
 * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals on behalf of CoolServlets.com. For more information
 * on CoolServlets.com, please see <http://www.coolservlets.com>.
 */
      
package com.coolservlets.forum;

import java.util.*;
import java.io.*;

/**
 * Manages properties for the entire Jive system. Properties are merely
 * pieces of information that need to be saved in between server restarts.
 * <p>
 * At the moment, properties are stored in a Java Properties file. In a version
 * of Jive coming soon, the properties file format will move to XML. XML
 * properties will allow hierarchical property structures which may mean the
 * API of this class will have to change.
 * <p>
 * Jive properties are only meant to be set and retrevied by core Jive classes.
 * Therefore, skin writers should probably ignore this class.
 * <p>
 * This class is implemented as a singleton since many classloaders seem to
 * take issue with doing classpath resource loading from a static context.
 */
public class PropertyManager {

    private static PropertyManager manager = null;
    private static Object managerLock = new Object();
    private static String propsName = "/jive.properties";

    /**
     * Returns a Jive property
     *
     * @param name the name of the property to return.
     * @returns the property value specified by name.
     */
    public static String getProperty(String name) {
        if (manager == null) {
            synchronized(managerLock) {
                if (manager == null) {
                    manager = new PropertyManager(propsName);
                }
            }
        }
        return manager.getProp(name);
    }

    /**
     * Sets a Jive property.
     *
     * @param name the name of the property being set.
     * @param value the value of the property being set.
     */
    public static void setProperty(String name, String value) {
        if (manager == null) {
            synchronized(managerLock) {
                if (manager == null) {
                    manager = new PropertyManager(propsName);
                }
            }
        }
        manager.setProp(name, value);
    }

    /**
     * Returns true if the properties are readable. This method is mainly
     * valuable at setup time to ensure that the properties file is setup
     * correctly.
     */
    public static boolean propertyFileIsReadable() {
        if (manager == null) {
            synchronized(managerLock) {
                if (manager == null) {
                    manager = new PropertyManager(propsName);
                }
            }
        }
        return manager.propFileIsReadable();
    }

    /**
     * Returns true if the properties are writable. This method is mainly
     * valuable at setup time to ensure that the properties file is setup
     * correctly.
     */
    public static boolean propertyFileIsWritable() {
        if (manager == null) {
            synchronized(managerLock) {
                if (manager == null) {
                    manager = new PropertyManager(propsName);
                }
            }
        }
        return manager.propFileIsWritable();
    }

    /**
     * Returns true if the jive.properties file exists where the path property
     * purports that it does.
     */
    public static boolean propertyFileExists() {
        if (manager == null) {
            synchronized(managerLock) {
                if (manager == null) {
                    manager = new PropertyManager(propsName);
                }
            }
        }
        return manager.propFileExists();
    }

    private Properties properties = null;
    private Object propertiesLock = new Object();
    private String resourceURI;

    /**
     * Singleton access only.
     */
    private PropertyManager(String resourceURI) {
        this.resourceURI = resourceURI;
    }
   
    /**
     * Gets a Jive property. Jive properties are stored in jive.properties.
     * The properties file should be accesible from the classpath. Additionally,
     * it should have a path field that gives the full path to where the
     * file is located. Getting properties is a fast operation.
     */
    public String getProp(String name) {
        //If properties aren't loaded yet. We also need to make this thread
        //safe, so synchronize...
        if (properties == null) {
            synchronized(propertiesLock) {
                //Need an additional check
                if (properties == null) {
                    loadProps();
                }
            }
        }
        return properties.getProperty(name);
    }
    /**
     * Sets a Jive property. Because the properties must be saved to disk
     * every time a property is set, property setting is relatively slow.
     */
    public void setProp(String name, String value) {
        //Only one thread should be writing to the file system at once.
        synchronized (propertiesLock) {
            //Create the properties object if necessary.
            if (properties == null) {
                loadProps();
            }
            properties.setProperty(name, value);
            //Now, save the properties to disk. In order for this to work, the user
            //needs to have set the path field in the properties file. Trim
            //the String to make sure there are no extra spaces.
            String path = properties.getProperty("path").trim();
            OutputStream out = null;
            try {
                out = new FileOutputStream(path);
                properties.store(out, "jive.properties -- " + (new java.util.Date()));
            }
            catch (Exception ioe) {
                System.err.println("There was an error writing jive.properties to " + path + ". " +
                    "Ensure that the path exists and that the Jive process has permission " +
                    "to write to it -- " + ioe);
                ioe.printStackTrace();
            }
            finally {
                try {
                    out.close();
                } catch (Exception e) { }
            }
        }
    }
    /**
     * Loads Jive properties from the disk.
     */
    private void loadProps() {
        properties = new Properties();
        InputStream in = null;
        try {
            in = getClass().getResourceAsStream(resourceURI);
            properties.load(in);
        }
        catch (IOException ioe) {
            System.err.println("Error reading Jive properties in DbForumFactory.loadProperties() " + ioe);
            ioe.printStackTrace();
        }
        finally {
            try {
                in.close();
            } catch (Exception e) { }
        }
    }

    /**
     * Returns true if the properties are readable. This method is mainly
     * valuable at setup time to ensure that the properties file is setup
     * correctly.
     */
    public boolean propFileIsReadable() {
        try {
            InputStream in = getClass().getResourceAsStream(resourceURI);
            return true;
        }
        catch (Exception e) {
            return true;
        }
    }

    /**
     * Returns true if the jive.properties file exists where the path property
     * purports that it does.
     */
    public boolean propFileExists() {
        String path = getProp("path");
		File file = new File(path);
        if (file.isFile()) {
            return true;
        }
        else {
            return false;
        }
    }

    /**
     * Returns true if the properties are writable. This method is mainly
     * valuable at setup time to ensure that the properties file is setup
     * correctly.
     */
    public boolean propFileIsWritable() {
        String path = getProp("path");
		File file = new File(path);
		if (file.isFile()) {
			//See if we can write to the file
			if (file.canWrite()) {
                return true;
            }
			else {
                return false;
            }
        }
        else {
            return false;
        }
    }

}
