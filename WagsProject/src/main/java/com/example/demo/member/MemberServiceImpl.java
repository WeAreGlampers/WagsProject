package com.example.demo.member;

import java.text.DecimalFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.time.temporal.Temporal;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.dto.MemberDto;
import com.example.demo.dto.ProductDto;
import com.example.demo.dto.ReviewDto;
import com.example.demo.utils.MyUtils;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
@Qualifier("ms")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper mapper;
	
	@Override
	public String memberInput() {
		return "/member/memberInput";
		
	}

	@Override
	public String memberInputOk(MemberDto mdto) {
		 if ( mapper.useridDupChk(mdto.getUserid()) ) {
			 return "redirect:/member/memberInput?err=1";
		 } else {
			mapper.memberInputOk(mdto);
			
			LocalDate today = LocalDate.now();
			LocalDate xday = LocalDate.of(2025, 05, 01);
			//System.out.println(today.isBefore(xday));
			if (today.isBefore(xday)) {
				
				mapper.getSave(mdto.getUserid());
			}
			return "redirect:/login/login";
		 }
	}

	@Override
	public String useridDupChk(HttpServletRequest request) {
		if (mapper.useridDupChk(request.getParameter("userid"))) {
			return "1";
		} else {
			return "0";
		}	
	}

	@Override
	public String memberInfo(Model model, HttpSession session) {
		if (session.getAttribute("userid")==null) {
			return "redirect:/login/login";
		} else {
			String userid = (String)session.getAttribute("userid");
			MemberDto mdto = mapper.getMemInfo(userid);
			
			model.addAttribute("mdto",mdto);
			DecimalFormat df = new DecimalFormat("#,###");
			String saveStr = df.format(mdto.getSave());
			mdto.setSaveStr(saveStr);			
			return "/member/memberInfo";
		}
		
		
	}

	@Override
	public String pwdUpdateChk(HttpSession session, String pwd) {
		if (session.getAttribute("userid")==null) {
			return "redirect:/login/login";
		} else {
			String userid=(String)session.getAttribute("userid");
			MemberDto mdto = mapper.getMemInfo(userid);
			//System.out.println(mdto.getPwd() + " " + pwd);
			if (mdto.getPwd().equals(pwd)) {
				return "redirect:/member/pwdUpdate";
			} else {
				return "redirect:/member/memberInfo?err=2";
			}
		}	
	}

	@Override
	public String pwdUpdate(Model model, HttpSession session,String pwd) {
		if (session.getAttribute("userid")==null) {
			return "redirect:/login/login";
		} else {
			String userid=(String)session.getAttribute("userid");
			MemberDto mdto = mapper.getMemInfo(userid);	
			model.addAttribute("mdto",mdto);

			return "/member/pwdUpdate";

		}
	}

	@Override
	public String exisPwd(HttpSession session, String pwd) {
		String userid=(String)session.getAttribute("userid");
		MemberDto mdto = mapper.getMemInfo(userid);
		
			if(mdto.getPwd().equals(pwd)) {
				return "1";
			} else {
				return "0";
			}	
	}

	@Override
	public String pwdUpdateOk(MemberDto mdto,HttpSession session) {
		if (session.getAttribute("userid")==null) {
			return "redirect:/login/login";
		} else {
			String userid = session.getAttribute("userid").toString();
			mdto.setUserid(userid);
			mapper.pwdUpdateOk(mdto);
			return "redirect:/member/memberInfo";
		}

	}

	@Override
	public String updatePhone(Model model, HttpSession session) {
		if(session.getAttribute("userid")==null) {
			return "member/sessionOut";
		} else {
			String userid=session.getAttribute("userid").toString();
			MemberDto mdto = mapper.getMemInfo(userid);
			model.addAttribute("mdto",mdto);
		}
		
		return "member/updatePhone";
	}

	@Override
	public String updateEmail(Model model, HttpSession session) {
		if(session.getAttribute("userid")==null) {
			return "member/sessionOut";
		} else {
			return "member/updateEmail";
		}
		
	}

	@Override
	public String updatePhoneOk(HttpServletRequest request, HttpSession session) {
		if (session.getAttribute("userid")==null) {
			return "0";
		} else {
			String userid=session.getAttribute("userid").toString();
			String phone = request.getParameter("phone");
			//System.out.println(userid + " " + phone);
			mapper.updatePhoneOk(userid,phone);
			return "1";
		}
		
	}

	@Override
	public String updateEmailOk(HttpServletRequest request, HttpSession session) {
		if (session.getAttribute("userid")==null) {
			return "0";
		} else {
			String userid = session.getAttribute("userid").toString();
			String email = request.getParameter("email");
			//System.out.println(userid + " " + email);
			mapper.updateEmailOk(userid,email);
			return "1";
		}
	}

	@Override
	public String reservationStatus(Model model, HttpSession session) {
		if (session.getAttribute("userid")==null) {
			return "redirect:/login/login";
		} else {
			String userid = session.getAttribute("userid").toString();
			ArrayList<HashMap> mapList = mapper.reservationStatus(userid);
			
			for(int i = 0; i < mapList.size(); i++) {
				HashMap map = mapList.get(i);
				int state =Integer.parseInt(map.get("state").toString());
				String id = map.get("id").toString();
				
				if (state != 6 && state != 7) {
					LocalDate today = LocalDate.now();
					String inday = map.get("inday").toString();
					String outday = map.get("outday").toString();
					//System.out.println(inday);
					LocalDate checkin = LocalDate.parse(inday);
					LocalDate checkout = LocalDate.parse(outday);
					long dDay=ChronoUnit.DAYS.between(today,checkin);
					int dDayint = (int)dDay;
					if(dDayint < 0) {
						mapper.chgStateCompleted(id);
						dDayint = 5;
						state = dDayint;
					} else if ( dDayint >= 0 && dDay < 4) {
						if (dDayint == 0) {
							dDayint = 4;
						}
						mapper.chgStateDday(dDayint,id);
						state = dDayint;
					}
				}
				String result = MyUtils.stateStr(state);
				map.put("stateStr", result);
				map.put("state",state);
			}

			
			model.addAttribute("mapList",mapList);
			return "member/reservationStatus";
		}
	}

	@Override
	public String cartView(HttpSession session, Model model) {
		if (session.getAttribute("userid")==null) {
			return "redirect:/login/login";
		} else {
			String userid = session.getAttribute("userid").toString();
			ArrayList<HashMap> cartMap = mapper.cartView(userid);
			model.addAttribute("cartMap",cartMap);
			return "/member/cartView";
		}
	}

	@Override
	public String cartDel(HttpSession session,HttpServletRequest request) {
		if (session.getAttribute("userid")==null) {
			return "redirect:/login/login";
		} else {
			String ids = request.getParameter("ids");
			String[] temp = ids.split(",");
			for(int i = 0; i < temp.length; i++) {
				mapper.cartDel(temp[i]);
			}
			
			return "redirect:/member/cartView";
		}
	}

	@Override
	public String reviewWrite(HttpSession session, Model model,HttpServletRequest request) {
		if (session.getAttribute("userid")==null) {
			return "/login/loging";
		} else {
			String userid = session.getAttribute("userid").toString();
			int id = Integer.parseInt(request.getParameter("id"));
			HashMap map = mapper.reservationStatusOne(id);

			model.addAttribute("map",map);
			return "/member/reviewWrite";
		}
	}

	@Override
	public String reviewWriteOk(ReviewDto rdto) {
		int id = rdto.getRid();
		mapper.reviewWriteOk(rdto);
		mapper.chgReviewCount(id);
		
		double avgStar = mapper.getStarAvg(rdto.getPcode());
		int reviewCount = mapper.getReviewCount(rdto.getPcode());
		mapper.updateProductStatus(avgStar,reviewCount,rdto.getPcode());
		
		return "redirect:/member/reviewList";
	}

	@Override
	public String reviewList(HttpSession session, Model model, HttpServletRequest request) {
		if(session.getAttribute("userid")==null) {
			return "redirect:/login/login";
		} else {
			String userid = session.getAttribute("userid").toString();
			ArrayList<HashMap> reviewList = mapper.getReview(userid);
			for (int i = 0; i <reviewList.size(); i++) {
				HashMap map = reviewList.get(i);
				map.put("content", map.get("content").toString().replace("\r\n", "<br>"));
			}
			model.addAttribute("reviewList", reviewList);
			return "/member/reviewList";
		}
	}

	@Override
	public String reviewDelete(HttpSession session, HttpServletRequest request) {
		String pcode = request.getParameter("pcode");
		mapper.reviewDelete(request.getParameter("id"));
		mapper.chgReviewCount2(request.getParameter("rid"));
		double avgStar = mapper.getStarAvg(pcode);
		int reviewCount = mapper.getReviewCount(pcode);
		mapper.updateProductStatus(avgStar,reviewCount,pcode);
		
		return "redirect:/member/reviewList";
	}

	@Override
	public String reviewUpdate(HttpSession session, ReviewDto rdto, Model model) {
		if (session.getAttribute("userid")==null) {
			return "redirect:/login/login";
		} else {
			HashMap map = mapper.reservationStatusOne(rdto.getRid());
			rdto = mapper.getReviewForUpdate(rdto.getId());
			model.addAttribute("rdto",rdto);
			model.addAttribute("map",map);
			return "/member/reviewUpdate";
		}
	}

	@Override
	public String reviewUpdateOk(HttpSession session, ReviewDto rdto) {
		if (session.getAttribute("userid")==null) {
			return "redirect:/login/login";
		} else {
			String pcode = rdto.getPcode();
			mapper.reviewUpdateOk(rdto);
			double avgStar = mapper.getStarAvg(pcode);
			int reviewCount = mapper.getReviewCount(pcode);
			mapper.updateProductStatus(avgStar,reviewCount,pcode);
			return "redirect:/member/reviewList";
		}
	}
	
	
	
	
	
	

}
