package com.topcoder.dde.catalog.forums;

import com.topcoder.dde.catalog.CatalogException;

public class ForumsServiceFactoryException extends CatalogException {

	public ForumsServiceFactoryException() {
		super();
	}

	public ForumsServiceFactoryException(String message) {
		super(message);
	}

	public ForumsServiceFactoryException(String message, Throwable initCause) {
		super(message);
		initCause(initCause);
	}
	
	public ForumsServiceFactoryException(Throwable initCause) {
		this();
		initCause(initCause);
	}
}
