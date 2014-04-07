package com.ask.dental.clinic;

import java.sql.Timestamp;

public class ClinicModel {
	/* 병원정보 */
	private int clinicSeq;
	private String clinicNm;
	private String clinicCode;
	private String clinicArea;
	private String clinicTel;
	private String clinicFax;
	private String clinicAddr;
	private String zipCode;
	/* 부가정보 */
	private String taxNm;
	private String taxTel;
	private String insurancePro;
	private String readerSite;
	private String readerTel;
	private String licenseNb;
	private String intrId;
	private String intrPw;
	/*의사정보*/
	private String doctorNm;
	private String doctorSch;
	private String doctorBirthday;
	/*실무자정보*/
	private String mngNm;
	/*입력정보*/
	private String delYn;
	private String insertuser;
	private Timestamp insertDate;
	private String updateUser;
	private Timestamp updateDate;
	/* + 정보*/
	private String clinicGr;
	private String clinicEtc;
	
	private String groupDesc;
	
	private String selClinicNm;
	private String selClinicCode;
	
	public int getClinicSeq() {
		return clinicSeq;
	}
	public void setClinicSeq(int clinicSeq) {
		this.clinicSeq = clinicSeq;
	}
	public String getClinicNm() {
		return clinicNm;
	}
	public void setClinicNm(String clinicNm) {
		this.clinicNm = clinicNm;
	}
	public String getClinicCode() {
		return clinicCode;
	}
	public void setClinicCode(String clinicCode) {
		this.clinicCode = clinicCode;
	}
	public String getClinicArea() {
		return clinicArea;
	}
	public void setClinicArea(String clinicArea) {
		this.clinicArea = clinicArea;
	}
	public String getClinicTel() {
		return clinicTel;
	}
	public void setClinicTel(String clinicTel) {
		this.clinicTel = clinicTel;
	}
	public String getClinicFax() {
		return clinicFax;
	}
	public void setClinicFax(String clinicFax) {
		this.clinicFax = clinicFax;
	}
	public String getClinicAddr() {
		return clinicAddr;
	}
	public void setClinicAddr(String clinicAddr) {
		this.clinicAddr = clinicAddr;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getTaxNm() {
		return taxNm;
	}
	public void setTaxNm(String taxNm) {
		this.taxNm = taxNm;
	}
	public String getTaxTel() {
		return taxTel;
	}
	public void setTaxTel(String taxTel) {
		this.taxTel = taxTel;
	}
	public String getInsurancePro() {
		return insurancePro;
	}
	public void setInsurancePro(String insurancePro) {
		this.insurancePro = insurancePro;
	}
	public String getReaderSite() {
		return readerSite;
	}
	public void setReaderSite(String readerSite) {
		this.readerSite = readerSite;
	}
	public String getReaderTel() {
		return readerTel;
	}
	public void setReaderTel(String readerTel) {
		this.readerTel = readerTel;
	}
	public String getLicenseNb() {
		return licenseNb;
	}
	public void setLicenseNb(String licenseNb) {
		this.licenseNb = licenseNb;
	}
	public String getIntrId() {
		return intrId;
	}
	public void setIntrId(String intrId) {
		this.intrId = intrId;
	}
	public String getIntrPw() {
		return intrPw;
	}
	public void setIntrPw(String intrPw) {
		this.intrPw = intrPw;
	}
	public String getDoctorNm() {
		return doctorNm;
	}
	public void setDoctorNm(String doctorNm) {
		this.doctorNm = doctorNm;
	}
	public String getDoctorSch() {
		return doctorSch;
	}
	public void setDoctorSch(String doctorSch) {
		this.doctorSch = doctorSch;
	}
	public String getDoctorBirthday() {
		return doctorBirthday;
	}
	public void setDoctorBirthday(String doctorBirthday) {
		this.doctorBirthday = doctorBirthday;
	}
	public String getMngNm() {
		return mngNm;
	}
	public void setMngNm(String mngNm) {
		this.mngNm = mngNm;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getInsertuser() {
		return insertuser;
	}
	public void setInsertuser(String insertuser) {
		this.insertuser = insertuser;
	}
	public Timestamp getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Timestamp insertDate) {
		this.insertDate = insertDate;
	}
	public String getUpdateUser() {
		return updateUser;
	}
	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}
	public Timestamp getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Timestamp updateDate) {
		this.updateDate = updateDate;
	}
	public String getClinicGr() {
		return clinicGr;
	}
	public void setClinicGr(String clinicGr) {
		this.clinicGr = clinicGr;
	}
	public String getClinicEtc() {
		return clinicEtc;
	}
	public void setClinicEtc(String clinicEtc) {
		this.clinicEtc = clinicEtc;
	}
	public String getGroupDesc() {
		return groupDesc;
	}
	public void setGroupDesc(String groupDesc) {
		this.groupDesc = groupDesc;
	}
	public String getSelClinicNm() {
		return selClinicNm;
	}
	public void setSelClinicNm(String selClinicNm) {
		this.selClinicNm = selClinicNm;
	}
	public String getSelClinicCode() {
		return selClinicCode;
	}
	public void setSelClinicCode(String selClinicCode) {
		this.selClinicCode = selClinicCode;
	}
}