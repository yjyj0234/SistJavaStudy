package spring.di.ex5;

import java.util.ArrayList;

public class SawonInfo {
	private String sname;
	private ArrayList<String> buseo;
	private int pay;
	private String position;
	
	//name,position 생성자 주입
	public SawonInfo(String name, String position) {
		this.sname=name;
		this.position=position;
	}
	//buseo,pay는 setter주입



	public void setBuseo(ArrayList<String> buseo) {
		this.buseo = buseo;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	
	
	//모든 getter(private이라서)
	public int getPay() {
		return pay;
	}
	public ArrayList<String> getBuseo() {
		return buseo;
	}

	public String getSname() {
		return sname;
	}

	public String getPosition() {
		return position;
	}

}
