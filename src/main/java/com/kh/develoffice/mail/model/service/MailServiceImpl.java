package com.kh.develoffice.mail.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.develoffice.employee.model.vo.Employee;
import com.kh.develoffice.mail.model.dao.MailDao;
import com.kh.develoffice.mail.model.vo.Mail;
import com.kh.develoffice.mail.model.vo.PageInfo;
import com.kh.develoffice.mail.model.vo.SearchCondition;

@Service("mService")
public class MailServiceImpl implements MailService{
	
	@Autowired
	private MailDao mDao;

	@Override
	public int getListCount(Mail m) {

		return mDao.getlistCount(m);
	}

	@Override
	public ArrayList<Mail> receiveMailList(PageInfo pi, Mail m) {
		
		return mDao.receiveMailList(pi, m);
	}
	
	@Override
	public ArrayList<Mail> sendMailList(PageInfo pi, Mail m) {
		
		return mDao.sendMailList(pi, m);
	}

	@Override
	public ArrayList<Mail> deleteMailList(PageInfo pi, Employee e) {
		
		return mDao.deleteMailList(pi, e);
	}
	
	@Override
	public int insertMail(Mail m) {
		
		int result = mDao.insertMail(m);
		
		return result;
	}

	@Override
	public Mail receiveDetail(int mailNum) {
		
		return mDao.receiveDetail(mailNum);
	}

	@Override
	public int getSearchListCount(SearchCondition sc) {
		
		return mDao.getSearchListCount(sc);
	}

	@Override
	public ArrayList<Mail> selectSearchList(SearchCondition sc, PageInfo pi) {
		
		return mDao.selectSearchList(sc, pi);
	}

	@Override
	public Mail selectMail(int mailNum) {
		
		return mDao.selectMail(mailNum);
	}
	
	@Override
	public int updateMail(Mail m) {
		
		return mDao.updateMail(m);
	}

	@Override
	public int deleteMail(Mail m) {
		
		return mDao.deleteMail(m);
	}
	
	@Override
	public int selectEmpId(String toEmail) {
		
		return mDao.selectEmpId(toEmail);
		
	}

	@Override
	public int insertStatusMail(int empId) {
		
		return mDao.insertStatusMail(empId);
	}

	@Override
	public int restoreMail(Mail m) {
		
		return mDao.restoreMail(m);
	}



}
