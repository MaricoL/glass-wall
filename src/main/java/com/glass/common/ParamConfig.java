package com.glass.common;

public class ParamConfig {
	   private String serialNumber;// 串口号
	    private int baudRate;        // 波特率
	    private int checkoutBit;    // 校验位
	    private int dataBit;        // 数据位
	    private int stopBit;        // 停止位
		public ParamConfig() {
			super();
			// TODO Auto-generated constructor stub
		}
		public ParamConfig(String serialNumber, int baudRate, int checkoutBit, int dataBit, int stopBit) {
			super();
			this.serialNumber = serialNumber;
			this.baudRate = baudRate;
			this.checkoutBit = checkoutBit;
			this.dataBit = dataBit;
			this.stopBit = stopBit;
		}
		@Override
		public String toString() {
			return "ParamConfig [serialNumber=" + serialNumber + ", baudRate=" + baudRate + ", checkoutBit="
					+ checkoutBit + ", dataBit=" + dataBit + ", stopBit=" + stopBit + "]";
		}
		public String getSerialNumber() {
			return serialNumber;
		}
		public void setSerialNumber(String serialNumber) {
			this.serialNumber = serialNumber;
		}
		public int getBaudRate() {
			return baudRate;
		}
		public void setBaudRate(int baudRate) {
			this.baudRate = baudRate;
		}
		public int getCheckoutBit() {
			return checkoutBit;
		}
		public void setCheckoutBit(int checkoutBit) {
			this.checkoutBit = checkoutBit;
		}
		public int getDataBit() {
			return dataBit;
		}
		public void setDataBit(int dataBit) {
			this.dataBit = dataBit;
		}
		public int getStopBit() {
			return stopBit;
		}
		public void setStopBit(int stopBit) {
			this.stopBit = stopBit;
		}
	    
	    

}
