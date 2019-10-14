package com.kh.develoffice.reservation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.develoffice.reservation.model.service.ReservationService;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService rService;
	
	
	@RequestMapping("myReservListView.do")
	public String myReservListView() {
		return "reservation/myReservation";
	}
	
	
	@RequestMapping("conferenceRoom.do")
	public String conferenceRoom() {
		return "reservation/confRoom";
	}
	
	
	@RequestMapping("car.do")
	public String car() {
		return "reservation/car";
	}
	
	
	@RequestMapping("massage.do")
	public String massage() {
		return "reservation/massage";
	}
	
	
	@RequestMapping("cafe.do")
	public String cafe() {
		return "reservation/cafe";
	}
	
	

}
