package com.topcoder.dde.catalog.forums;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.web.ejb.forums.Forums;

public class ForumsServiceFactory {
	private static ForumsServiceFactory instance;
	
	static {
		try {
			instance = new ForumsServiceFactory();
		} catch (ForumsServiceFactoryException e) {
			throw new IllegalStateException(e);
		}
	}
	
	private ForumServiceLocator serviceLocator = null;
	
	private ForumsServiceFactory() throws ForumsServiceFactoryException {
		try {
			Class<?> clazz = Class.forName(ApplicationServer.FORUMS_SERVICE_LOCATOR);
			if (!ForumServiceLocator.class.isAssignableFrom(clazz)) {
				throw new ForumsServiceFactoryException("The class: " + clazz.getName() + " is not a subclass of " + ForumServiceLocator.class.getName());
			}
			serviceLocator = (ForumServiceLocator) clazz.newInstance();
		} catch (ClassNotFoundException e) {
			throw new ForumsServiceFactoryException(e);
		} catch (InstantiationException e) {
			throw new ForumsServiceFactoryException(e);
		} catch (IllegalAccessException e) {
			throw new ForumsServiceFactoryException(e);
		}
	}
	
	public static ForumsServiceFactory getInstance() {
		return instance;
	}
	
	public Forums createForums() throws ForumsServiceCreationException {
		return serviceLocator.createForumService();
	}
}
