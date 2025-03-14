package com.example.demo.product;

import java.util.ArrayList;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.CartDto;
import com.example.demo.dto.ReservationDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public interface ProductService {
	public String productContent(HttpSession session, HttpServletRequest request, Model model);
	public String addCart(CartDto cdto, HttpServletRequest request, HttpSession session);
	public String dibsOk(HttpSession session,HttpServletRequest request);
	public @ResponseBody String dibsDel(HttpSession session,HttpServletRequest request); 
	public String productList(HttpServletRequest request,Model model);
	public String reservation(HttpSession session,Model model,HttpServletRequest request);
	public String reservationOk(HttpSession session,Model model,HttpServletRequest request);
	public @ResponseBody ArrayList<ReservationDto> UnavailableDates(HttpServletRequest request);
	public String qnaDel(HttpServletRequest request);
}
