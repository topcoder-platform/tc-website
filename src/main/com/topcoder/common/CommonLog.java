
package com.topcoder.common;

import org.apache.log4j.*;
import org.apache.log4j.spi.*;

public class CommonLog extends Category{
    private static CommonLogFactory factory = new CommonLogFactory();
    private String className;
    
    public CommonLog(String title) {
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

class CommonLogFactory implements CategoryFactory {
  public  CommonLogFactory() {

  }

  public  Category makeNewCategoryInstance(String name) {
    return new CommonLog(name);
  }
}
