package com.example.demo.admin;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Iterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.demo.dto.NoticeDto;
import com.example.demo.dto.ProductDto;
import com.example.demo.dto.QnaDto;
import com.example.demo.dto.ReservationDto;

@Service
@Qualifier("as")
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminMapper mapper;

	@Override
	public String productList(Model model) {
		ArrayList<ProductDto> plist=mapper.productList();
		model.addAttribute("plist",plist);
		return "/admin/productList";
	}

	@Override
	public String productWrite() {
		return "/admin/productWrite";
	}

	@Override
	public String productWriteOk(ProductDto pdto,MultipartHttpServletRequest multi)throws Exception {
		String pimg="";
		String dimg="";
		Iterator<String> iter=multi.getFileNames();
		while(iter.hasNext()) {
			String imsi=iter.next();
			MultipartFile file=multi.getFile(imsi);
			if(!file.isEmpty()) {
				String oname=file.getOriginalFilename();
				String str=ResourceUtils.getFile("classpath:static/product").toString();
				
				File sfile=new File(str+"/"+oname);
				while(sfile.exists()) {
					String[] fnames=oname.split("[.]");
					oname=fnames[0]+System.currentTimeMillis()+"."+fnames[1];
					sfile=new File(str+"/"+oname);
				}
				if(!imsi.equals("exdimg")) {
					pimg=oname;
				}
				else {
					dimg=oname;
				}
				Path path=Paths.get(str+"/"+oname);
				Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
			}	
		}
		pdto.setDimg(dimg);
		pdto.setPimg(pimg);
		String pcode=String.format("%02d",mapper.getPcode(pdto.getPcode()));
		pdto.setPcode(pdto.getPcode()+pcode);
		mapper.productWriteOk(pdto);
		return "redirect:/admin/productList";
	}

	@Override
	public String productDelete(String id)throws Exception {
		ProductDto pdto=mapper.getProduct(id);
		String path=ResourceUtils.getFile("classpath:static/product").toString();
		File pimg=new File(path+"/"+pdto.getPimg());
		if(pimg.exists()) {
			pimg.delete();
		}
		File dimg=new File(path+"/"+pdto.getDimg());
		if(dimg.exists()) {
			dimg.delete();
		}
		mapper.productDelete(id);
		return "redirect:/admin/productList";
	}

	@Override
	public String productUpdate(String id,Model model){
		ProductDto pdto=mapper.getProduct(id);
		model.addAttribute("pdto",pdto);
		
		return "/admin/productUpdate";
	}

	@Override
	public String productUpdateOk(ProductDto pdto,MultipartHttpServletRequest multi)throws Exception {
		ProductDto pdto2=mapper.getProduct(pdto.getId()+"");
		String str=ResourceUtils.getFile("classpath:static/product").toString();
		Iterator<String> iter=multi.getFileNames();
		if(!pdto2.getPimg().equals(pdto.getPimg())) {
			File pfile=new File(str+"/"+pdto2.getPimg());
			if(pfile.exists()) {
				pfile.delete();
			}
			String imsi=iter.next();
			MultipartFile file=multi.getFile(imsi);
			if(!file.isEmpty()) {
				String oname=file.getOriginalFilename();
				File sfile=new File(str+"/"+oname);
				if(sfile.exists()) {
					String[] fnames=oname.split("[.]");
					oname=fnames[0]+System.currentTimeMillis()+"."+fnames[1];
					sfile=new File(str+"/"+oname);
				}
				Path path=Paths.get(str+"/"+oname);
				Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
				pdto.setPimg(oname);
			}
		}
        if(!pdto2.getDimg().equals(pdto.getDimg())) {
        	File dfile=new File(str+"/"+pdto2.getDimg());
    		if(dfile.exists()) {
    			dfile.delete();
    		}
    		String imsi=iter.next();
    		if(!imsi.equals("exdimg")) {
    			imsi=iter.next();
    		}
			MultipartFile file=multi.getFile(imsi);
			if(!file.isEmpty()) {
				String oname=file.getOriginalFilename();
				File sfile=new File(str+"/"+oname);
				if(sfile.exists()) {
					String[] fnames=oname.split("[.]");
					oname=fnames[0]+System.currentTimeMillis()+"."+fnames[1];
					sfile=new File(str+"/"+oname);
				}
				Path path=Paths.get(str+"/"+oname);
				Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
				pdto.setDimg(oname);
			}
		}
		
		mapper.productUpdateOk(pdto);
		return "redirect:/admin/productList";
	}

	@Override
	public String reservationList(Model model) {
		ArrayList<ReservationDto> rlist=mapper.reservationList();
		model.addAttribute("rlist",rlist);
		return "admin/reservationList";
	}

	@Override
	public String qnaList(Model model) {
		ArrayList<QnaDto> qlist=mapper.qnaList();
		model.addAttribute("qlist",qlist);
		return "admin/qnaList";
	}

	@Override
	public String chgState(String id) {
		mapper.chgState(id);
		return "redirect:/admin/reservationList";
	}

	@Override
	public String qnaAnswer(QnaDto qdto) {
		mapper.qnaAnswer(qdto);
		mapper.chgRef(qdto.getRef());
		return "redirect:/admin/qnaList";
	}

	@Override
	public String noticeList(Model model) {
		ArrayList<NoticeDto> nlist=mapper.noticeList();
		model.addAttribute("nlist",nlist);
		return "/admin/noticeList";
	}

	@Override
	public String noticeWrite() {
		return "/admin/noticeWrite";
	}

	@Override
	public String noticeWriteOk(NoticeDto ndto) {
		mapper.noticeWriteOk(ndto);
		return "redirect:/admin/noticeList";
	}

	@Override
	public String noticeContent(String id, Model model) {
		NoticeDto ndto=mapper.noticeContent(id);
		ndto.setContent(ndto.getContent().replace("\r\n", "<br>"));
		model.addAttribute("ndto",ndto);
		return "/admin/noticeContent";
	}

	@Override
	public String noticeDelete(String id) {
		mapper.noticeDelete(id);
		return "redirect:/admin/noticeList";
	}

	@Override
	public String noticeUpdate(String id, Model model) {
		NoticeDto ndto=mapper.noticeContent(id);
		model.addAttribute("ndto",ndto);
		return "/admin/noticeUpdate";
	}

	@Override
	public String noticeUpdateOk(NoticeDto ndto) {
		mapper.noticeUpdateOk(ndto);
		return "redirect:/admin/noticeContent?id="+ndto.getId();
	}
	
	
}
