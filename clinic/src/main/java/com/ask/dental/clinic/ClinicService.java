package com.ask.dental.clinic;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ask.dental.mapper.ClinicMapper;
import com.ask.dental.clinic.ClinicModel;

@Service(value="ClinicService")
public class ClinicService {
	@Autowired
	private ClinicMapper ClinicMapper;

	public ClinicModel selectClinic(ClinicModel Clinic){
		return ClinicMapper.selectClinic(Clinic);
	}


	public List<ClinicModel> selectClinicList(Map param) {
		return ClinicMapper.selectClinicList(param);
	}
	
	public int selectClinicCount(Map param) {
		return ClinicMapper.selectClinicCount(param);
	}

	public void insertClinic(ClinicModel Clinic){
		ClinicMapper.insertClinic(Clinic);
	}

	public void updateClinic(ClinicModel Clinic){
		ClinicMapper.insertClinic(Clinic);
	}

	public void deleteClinic(ClinicModel Clinic){
		ClinicMapper.deleteClinic(Clinic);
	}
	
    public List<ClinicModel> getSelectClinic(ClinicModel Clinic) {
        List<ClinicModel> lstSelClinic = ClinicMapper.getSelectClinic(Clinic);

        return lstSelClinic;
    }
}

