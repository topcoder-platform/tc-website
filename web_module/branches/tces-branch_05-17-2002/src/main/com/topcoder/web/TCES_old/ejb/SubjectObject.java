package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the subject table.
 * @see com.topcoder.web.TCES.ejb.Subject
 * @author Phil Selby, May 22nd, 2002
 */

public class SubjectObject 
  implements Serializable {
	public Integer	subject_id;
	public String	description;
}
