package com.whoAmI.managerExpert;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.whoAmI.action.Action;
import com.whoAmI.action.ActionForward;
import com.whoAmI.managerExpert.dao.ExpertProfileDAO;
import com.whoAmI.managerExpert.vo.ExpertProfileVO;

public class ExpertListFilterOk implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ExpertProfileDAO epDao = new ExpertProfileDAO();
		PrintWriter out = resp.getWriter();
		
		HashMap<String, Object> filterMap = new HashMap<>();
		
		String  consultText = req.getParameter("consultText");
		String  consultVoice = req.getParameter("consultVoice");
		String  consultMeet = req.getParameter("consultMeet");
		String[] consultGender = req.getParameterValues("consultGender");
		
		filterMap.put("consultText", consultText);
		filterMap.put("consultVoice", consultVoice);
		filterMap.put("consultMeet", consultMeet);
		
			try {
				if(consultGender.length == 1) {
					filterMap.put("genderCheck", true);
					String gender = consultGender[0];
					if(gender.equals("여자")) {
						filterMap.put("consultFeMale", "여자");
					}else {
						filterMap.put("consultMale", "남자");
					}
				}
			} catch (NullPointerException e) {
				e.printStackTrace();
			}
		
		List<ExpertProfileVO> profileList  = epDao.selectProfilesFiltered(filterMap);
		
		JSONArray profiles = new JSONArray();
		for(ExpertProfileVO vo : profileList) {
			JSONObject profile = new JSONObject();
			profile.put("managerPictureNameOrignal", vo.getManagerPictureNameOrignal());
			profile.put("managerName", vo.getManagerName());
			profile.put("managerconsultText", vo.getManagerconsultText());
			profile.put("managerconsultVoice", vo.getManagerconsultVoice());
			profile.put("managerconsultMeet", vo.getManagerconsultMeet());
			profile.put("managerIntroduce", vo.getManagerIntroduce());
			profile.put("managerProfileNumber", vo.getManagerProfileNumber());
			profiles.add(profile);
		}
		
		out.print(profiles.toJSONString());
		out.close();
		
		return null;
	}
}
