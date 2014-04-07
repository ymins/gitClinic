package com.ask.dental.mapper;

import java.util.List;
import java.util.Map;

import com.ask.dental.clinic.ClinicModel;

public interface ClinicMapper {

	public ClinicModel selectClinic(ClinicModel Clinic);

	public List<ClinicModel> selectClinicList(Map param);

	public int selectClinicCount(Map param);
	
	public void insertClinic(ClinicModel Clinic);

	public void updateClinic(ClinicModel Clinic);

	public void deleteClinic(ClinicModel Clinic);
	
	public List<ClinicModel> getSelectClinic(ClinicModel Clinic);
}
