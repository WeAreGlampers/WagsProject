package com.example.demo.product;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.demo.dto.CartDto;

import com.example.demo.dto.ProductDto;

import com.example.demo.dto.ReservationDto;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ProductController {
	@Autowired
	@Qualifier("ps")
	private ProductService service;

	@GetMapping("/product/productContent")
	public String productContent(HttpSession session, HttpServletRequest request, Model model) {
		return service.productContent(session, request, model);
	}
	
	@GetMapping("/product/addCart")
	public @ResponseBody String addCart(CartDto cdto, HttpServletRequest request, HttpSession session) {
		return service.addCart(cdto,request,session);
	}
	
	@GetMapping("/product/dibsOk")
	public @ResponseBody String dibsOk(HttpSession session,HttpServletRequest request) {
		return service.dibsOk(session,request);
	}
	
	@GetMapping("/product/dibsDel")
	public @ResponseBody String dibsDel(HttpSession session,HttpServletRequest request) {
		return service.dibsDel(session,request);
	}
	
	@GetMapping("/product/qnaDel")
	public String qnaDel(HttpServletRequest request) {
		return service.qnaDel(request);
	}
	
	@RequestMapping("/product/productList")
	public String productList(HttpServletRequest request,Model model) {
		return service.productList(request,model);
	}

	@RequestMapping("/product/reservation")
	public String reservation(HttpSession session,Model model,HttpServletRequest request) {
		return service.reservation(session, model,request);
	}
	@PostMapping("/product/reservationOk")
	public String reservationOk(HttpSession session,Model model,HttpServletRequest request) {
		return service.reservationOk(session, model,request);
	}
	
	@GetMapping("/product/UnavailableDates")
	public @ResponseBody ArrayList<ReservationDto> UnavailableDates(HttpServletRequest request) {
		return service.UnavailableDates(request);
	}
	
}
