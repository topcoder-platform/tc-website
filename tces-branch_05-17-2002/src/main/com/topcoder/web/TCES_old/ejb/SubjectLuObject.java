package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the subject_lu table.
 * @see com.topcoder.web.TCES.ejb.SubjectLu
 * @author Phil Selby, May 22nd, 2002
 */

public class SubjectLuObject 
  implements Serializable {
	public Integer	subject_id;
	public String	subject_desc;
}
