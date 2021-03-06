package com.whoAmI.expertPage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.whoAmI.action.Action;
import com.whoAmI.action.ActionForward;
import com.whoAmI.expertPage.dao.ExpertPageCommentDAO;
import com.whoAmI.managerWorry.vo.WorryCommentManagerDTO;

public class ExpertCommentListOK implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		System.out.println("전문가리스트ok에 왓다");
		ExpertPageCommentDAO dao = new ExpertPageCommentDAO();
		PrintWriter out = resp.getWriter();
		
		int userNumber = (Integer) req.getSession().getAttribute("userNumber");
		JSONArray infos = new JSONArray();
		List<WorryCommentManagerDTO> commentList = dao.selectAll(userNumber);
		for (WorryCommentManagerDTO vo : commentList) {
			JSONObject commentInfo = new JSONObject();
			commentInfo.put("managerName", vo.getManagerName());
			commentInfo.put("worryCommentManagerContent", vo.getWorryCommentManagerContent());
			commentInfo.put("managerNumberDate", vo.getManagerNumberDate());
			commentInfo.put("worryCommentManagerNumber", vo.getWorryCommentManagerNumber());
			infos.add(commentInfo);
			System.out.println(infos);
		}

		out.print(infos.toJSONString());
		out.close();
		return null;
	}

}
