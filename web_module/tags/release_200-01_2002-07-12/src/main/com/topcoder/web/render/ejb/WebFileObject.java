package	com.topcoder.web.render.ejb;

import	java.sql.Date;
import	java.io.Serializable;

public class WebFileObject 
  implements Serializable {
	public Integer	file_id;
	public String	file_desc;
	public Integer	image_height;
	public Integer	image_width;
	public Integer	modify_by;
	public Date	modify_date;
}
