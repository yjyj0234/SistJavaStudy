package spring.di.ex4;

public class SawonData {
	private String sawonName;
	private int pay;
	private String ipsaday;
	
	
	//����Ʈ������
	public SawonData() {
		
	}
	
	//�����..������ ����
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

	//�޿�,�Ի���..setter����
	public void setPay(int pay) {
		this.pay=pay;
	}
	public void setIpsaday(String ipsaday) {
		this.ipsaday=ipsaday;
	}
}
