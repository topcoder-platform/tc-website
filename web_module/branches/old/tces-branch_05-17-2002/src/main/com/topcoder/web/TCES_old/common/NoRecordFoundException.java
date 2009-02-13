package	com.topcoder.web.TCES.common;

import	java.sql.SQLException;

/**
 * Convenience class to indicate no matching record found.
 * This class extends java.sql.SQLException so that we don't have to alter
 * the signatures for any methods which throw this exception. In the catch
 * block for SQLException we can just add a check for e instanceof NoRecordFoundException
 * to rule out no matching record as the exception cause.
 * @author Phil Selby, June 15th, 2002
 */

public class NoRecordFoundException extends SQLException {

	/**
	 * No argument constructor.
	 * @author Phil Selby, June 15th, 2002
	 */

	public NoRecordFoundException() {
		super();
	}

	/**
	 * Constructor with a single message argument.
	 * @param message the message to include in the SQLException
	 * @author Phil Selby, June 15th, 2002
	 */

	public NoRecordFoundException( String message ) {
		super( message );
	}
}
