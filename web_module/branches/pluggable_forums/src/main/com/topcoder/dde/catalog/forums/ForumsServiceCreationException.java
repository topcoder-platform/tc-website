package com.topcoder.dde.catalog.forums;

import com.topcoder.dde.catalog.CatalogException;

public class ForumsServiceCreationException extends CatalogException {

	public ForumsServiceCreationException() {
		super();
	}

	public ForumsServiceCreationException(String message) {
		super(message);
	}
	
	public ForumsServiceCreationException(String message, Throwable initCause) {
		super(message);
		initCause(initCause);
	}

}
