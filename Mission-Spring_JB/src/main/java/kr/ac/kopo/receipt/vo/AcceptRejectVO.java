package kr.ac.kopo.receipt.vo;

public class AcceptRejectVO {

	
	private String confirm;
	private int receiptNo;
	private String rejectSelBox;
	private String rejectBoxDirect;
	private String rejectReason;
	
	public String getRejectReason() {
		return rejectReason;
	}
	public void setRejectReason(String rejectReason) {
		this.rejectReason = rejectReason;
	}
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	public int getReceiptNo() {
		return receiptNo;
	}
	public void setReceiptNo(int receiptNo) {
		this.receiptNo = receiptNo;
	}
	public String getRejectSelBox() {
		return rejectSelBox;
	}
	public void setRejectSelBox(String rejectSelBox) {
		this.rejectSelBox = rejectSelBox;
	}
	public String getRejectBoxDirect() {
		return rejectBoxDirect;
	}
	public void setRejectBoxDirect(String rejectBoxDirect) {
		this.rejectBoxDirect = rejectBoxDirect;
	}
	
	
	@Override
	public String toString() {
		return "AcceptRejectVO [confirm=" + confirm + ", receiptNo=" + receiptNo + ", rejectSelBox=" + rejectSelBox
				+ ", rejectBoxDirect=" + rejectBoxDirect + ", rejectReason=" + rejectReason + "]";
	}
	
	
}
