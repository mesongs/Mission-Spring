package kr.ac.kopo.receipt.vo;

public class ReceiptFileVO {
	
	int fileNo;
	String filePath;
	String fileOriginalName;
	String fileSaveName;
	int fileSize;
	
	public int getReceiptNo() {
		return fileNo;
	}
	public void setReceiptNo(int receiptNo) {
		this.fileNo = receiptNo;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getFileOriginalName() {
		return fileOriginalName;
	}
	public void setFileOriginalName(String fileOriginalName) {
		this.fileOriginalName = fileOriginalName;
	}
	public String getFileSaveName() {
		return fileSaveName;
	}
	public void setFileSaveName(String fileSaveName) {
		this.fileSaveName = fileSaveName;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	
	@Override
	public String toString() {
		return "ReceiptFileVO [fileNo=" + fileNo + ", filePath=" + filePath + ", fileOriginalName=" + fileOriginalName
				+ ", fileSaveName=" + fileSaveName + ", fileSize=" + fileSize + "]";
	}
	
	
	
	
	
	
}
