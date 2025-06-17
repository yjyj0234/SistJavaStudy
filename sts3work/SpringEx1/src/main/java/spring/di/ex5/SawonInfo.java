package spring.di.ex5;

import java.util.ArrayList;

public class SawonInfo {
	private String sname;
	private ArrayList<String> buseo;
	private int pay;
	private String position;
	
	//name,position ������ ����
	public SawonInfo(String name, String position) {
		this.sname=name;
		this.position=position;
	}
	//buseo,pay�� setter����



	public void setBuseo(ArrayList<String> buseo) {
		this.buseo = buseo;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	
	
	//��� getter(private�̶�)
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
