package com.glass.entity.cq;

import java.math.BigDecimal;

import lombok.Data;

@Data
public class StockStatisticsCq {

	    private Integer id;

	    private String compId;
	    private String compUscd;

	    private String investCompId;
	    private String investCompName;
	    private String investCompUscd;


	    private BigDecimal subContributionTotal;
	    private BigDecimal actualContributionTotal;
	    private BigDecimal stockPercent;
	    private String investType;


	    
		// 通用字段
		private String createPersonName;
		private String createPersonId;
		private String createDate;
		private String lastModifyPersonId;
		private String lastModifyPersonName;
		private String lastModifyDate;
		private Boolean isDel;
		private String approvalState;
		@Override
		public boolean equals(Object obj) {
			if (this == obj) {
				return true;
			}
			if (obj == null) {
				return false;
			}
			if (getClass() != obj.getClass()) {
				return false;
			}
			StockStatisticsCq other = (StockStatisticsCq) obj;
			if (actualContributionTotal == null) {
				if (other.actualContributionTotal != null) {
					return false;
				}
			} else if (!actualContributionTotal.equals(other.actualContributionTotal)) {
				return false;
			}
			if (approvalState == null) {
				if (other.approvalState != null) {
					return false;
				}
			} else if (!approvalState.equals(other.approvalState)) {
				return false;
			}
			if (compUscd == null) {
				if (other.compUscd != null) {
					return false;
				}
			} else if (!compUscd.equals(other.compUscd)) {
				return false;
			}
			if (investCompId == null) {
				if (other.investCompId != null) {
					return false;
				}
			} else if (!investCompId.equals(other.investCompId)) {
				return false;
			}
			if (investCompName == null) {
				if (other.investCompName != null) {
					return false;
				}
			} else if (!investCompName.equals(other.investCompName)) {
				return false;
			}
			if (investCompUscd == null) {
				if (other.investCompUscd != null) {
					return false;
				}
			} else if (!investCompUscd.equals(other.investCompUscd)) {
				return false;
			}
			if (investType == null) {
				if (other.investType != null) {
					return false;
				}
			} else if (!investType.equals(other.investType)) {
				return false;
			}
			if (isDel == null) {
				if (other.isDel != null) {
					return false;
				}
			} else if (!isDel.equals(other.isDel)) {
				return false;
			}
			if (stockPercent == null) {
				if (other.stockPercent != null) {
					return false;
				}
			} else if (!stockPercent.equals(other.stockPercent)) {
				return false;
			}
			if (subContributionTotal == null) {
				if (other.subContributionTotal != null) {
					return false;
				}
			} else if (!subContributionTotal.equals(other.subContributionTotal)) {
				return false;
			}
			return true;
		}
		@Override
		public int hashCode() {
			final int prime = 31;
			int result = 1;
			result = prime * result + ((actualContributionTotal == null) ? 0 : actualContributionTotal.hashCode());
			result = prime * result + ((approvalState == null) ? 0 : approvalState.hashCode());
			result = prime * result + ((compUscd == null) ? 0 : compUscd.hashCode());
			result = prime * result + ((investCompId == null) ? 0 : investCompId.hashCode());
			result = prime * result + ((investCompName == null) ? 0 : investCompName.hashCode());
			result = prime * result + ((investCompUscd == null) ? 0 : investCompUscd.hashCode());
			result = prime * result + ((investType == null) ? 0 : investType.hashCode());
			result = prime * result + ((isDel == null) ? 0 : isDel.hashCode());
			result = prime * result + ((stockPercent == null) ? 0 : stockPercent.hashCode());
			result = prime * result + ((subContributionTotal == null) ? 0 : subContributionTotal.hashCode());
			return result;
		}
		
		

	   
	
}
