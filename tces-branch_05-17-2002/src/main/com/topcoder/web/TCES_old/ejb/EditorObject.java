package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the editor table.
 * @see com.topcoder.web.TCES.ejb.Editor
 * @author Phil Selby, May 22nd, 2002
 */

public class EditorObject 
  implements Serializable {
	public Integer	editor_id;
	public String	editor_desc;
}
