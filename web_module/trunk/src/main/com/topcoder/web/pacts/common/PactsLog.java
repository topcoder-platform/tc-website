
package com.topcoder.web.pacts.common;

import org.apache.log4j.*;
import org.apache.log4j.spi.*;

public class PactsLog extends Category{
    private static PactsLogFactory factory = new PactsLogFactory();
    private String className;
    
    public PactsLog(String title) {
	super(title);
	className = title;
	addAppender(new ConsoleAppender(new SimpleLayout()));
    }

    public static Category getInstance(String name) {
	return Category.getInstance(name, factory); 
    }

    public void debug(Object str) {
	super.debug(new String(className + ":\n" + str.toString()));
    }

    public void error(Object str) {
	super.error(new String(className + ":\n" + str.toString()));
    }

    public void warn(Object str) {
	super.warn(new String(className + ":\n" + str.toString()));
    }
}

class PactsLogFactory implements CategoryFactory {
  public  PactsLogFactory() {

  }

  public  Category makeNewCategoryInstance(String name) {
    return new PactsLog(name);
  }
}
