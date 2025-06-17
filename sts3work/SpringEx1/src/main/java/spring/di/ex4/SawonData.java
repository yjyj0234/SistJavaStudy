package spring.di.ex4;

public class SawonData {
	private String sawonName;
	private int pay;
	private String ipsaday;
	
	
	//디폴트생성자
	public SawonData() {
		
	}
	
	//사원명..생성자 주입
	public SawonData(String name) {
		this.sawonName=name;
				
	}
	public String getSawonName() {
		return sawonName;
	}

	public void setSawonName(String sawonName) {
		this.sawonName = sawonName;
	}

	public int getPay() {
		return pay;
	}

	public String getIpsaday() {
		return ipsaday;
	}

	//급여,입사일..setter주입
	public void setPay(int pay) {
		this.pay=pay;
	}
	public void setIpsaday(String ipsaday) {
		this.ipsaday=ipsaday;
	}
}
