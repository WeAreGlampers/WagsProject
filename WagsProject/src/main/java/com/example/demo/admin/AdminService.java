package com.example.demo.admin;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.demo.dto.ProductDto;
import com.example.demo.dto.QnaDto;

public interface AdminService {
	public String productList(Model model);
	public String productWrite();
	public String productWriteOk(ProductDto pdto,MultipartHttpServletRequest multi)throws Exception;
	public String productDelete(String id)throws Exception;
	public String productUpdate(String id,Model model);
	public String productUpdateOk(ProductDto pdto,MultipartHttpServletRequest multi)throws Exception;
	public String reservationList(Model model);
	public String qnaList(Model model);
	public String chgState(String id);
	public String qnaAnswer(QnaDto qdto);
}
