package wagle.board;

import java.util.List;

public class WagleDataBean {

	  
	  private int wboardid;
	  private String wname;
	  private String whost;
	  private String wagler;
	  private int wmax;
	  private String wprofile;
	  private String wintro;
	  private String wcategory;
	  private String wloc;
	  private String wstart;
	  private String wend;
	  private String filename;
	  private int filesize;
	  
	  private String host; //호스트만 가져오기
	  private List member; //와글에 가입한 와글러만 가져오기
	  private int all; //가입한 회원 수 구하기
	  
	public String getHost() {
		String host = WaglelistDBMybatis.getInstance().getHost(wboardid);
		return host;
	}
	
	public void setHost(String host) {
		this.host = host;
	}

	public List getMember() {
		List member = WaglelistDBMybatis.getInstance().getWagleMember(wboardid);
		return member;
	}

	public void setMember(List member) {
		this.member = member;
	}

	public int getAll() {
		int all=WaglelistDBMybatis.getInstance().getWagleCount3(wboardid);
		return all;
	}
	
	public void setAll(int all) {
		this.all = all;
	}
	
	public int getWboardid() {
		return wboardid;
	}
	public void setWboardid(int wboardid) {
		this.wboardid = wboardid;
	}
	public String getWname() {
		return wname;
	}
	public void setWname(String wname) {
		this.wname = wname;
	}
	public String getWhost() {
		return whost;
	}
	public void setWhost(String whost) {
		this.whost = whost;
	}
	public String getWagler() {
		return wagler;
	}
	public void setWagler(String wagler) {
		this.wagler = wagler;
	}
	/**
	 * @return the wmax
	 */
	public int getWmax() {
		return wmax;
	}
	/**
	 * @param wmax the wmax to set
	 */
	public void setWmax(int wmax) {
		this.wmax = wmax;
	}
	public String getWprofile() {
		return wprofile;
	}
	public void setWprofile(String wprofile) {
		this.wprofile = wprofile;
	}
	public String getWintro() {
		return wintro;
	}
	public void setWintro(String wintro) {
		this.wintro = wintro;
	}
	public String getWcategory() {
		return wcategory;
	}
	public void setWcategory(String wcategory) {
		this.wcategory = wcategory;
	}
	public String getWloc() {
		return wloc;
	}
	public void setWloc(String wloc) {
		this.wloc = wloc;
	}
	public String getWstart() {
		return wstart;
	}
	public void setWstart(String wstart) {
		this.wstart = wstart;
	}
	public String getWend() {
		return wend;
	}
	public void setWend(String wend) {
		this.wend = wend;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	
	@Override
	public String toString() {
		return "WagleDataBean [wboardid=" + wboardid + ", wname=" + wname + ", whost=" + whost + ", wagler=" + wagler
				+ ", wmax=" + wmax + ", wprofile=" + wprofile + ", wintro=" + wintro + ", wcategory=" + wcategory
				+ ", wloc=" + wloc + ", wstart=" + wstart + ", wend=" + wend + ", filename=" + filename + ", filesize="
				+ filesize + "]";
	}

	
	  
}

