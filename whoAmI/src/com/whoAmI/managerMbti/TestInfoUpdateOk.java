package com.whoAmI.managerMbti;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.whoAmI.action.Action;
import com.whoAmI.action.ActionForward;
import com.whoAmI.managerMbti.dao.TestInfoDAO;
import com.whoAmI.managerMbti.dao.TestInfoPictureDAO;
import com.whoAmI.managerMbti.vo.PictureDTO;
import com.whoAmI.managerMbti.vo.TestInfoPictureVO;
import com.whoAmI.managerMbti.vo.TestInfoVO;

public class TestInfoUpdateOk implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		TestInfoVO info = new TestInfoVO();
		TestInfoDAO bDao = new TestInfoDAO();
		TestInfoPictureVO file = null;
		TestInfoPictureDAO fDao = new TestInfoPictureDAO();
		ActionForward af = new ActionForward();

		String uploadFolder = "C:\\aigb_0900_jsj\\jsp\\workspace\\whoAmI\\WebContent\\upload";
		int fileSize = 1024 * 1024 * 5;// 5M
		int testInfoNumber = 0, page = 0;
		
		// 요청객체, 업로드폴더 경로, 파일의 크기, 인코딩 방식, 이름변경정책
		MultipartRequest multi = new MultipartRequest(req, uploadFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
		page = Integer.parseInt(multi.getParameter("page"));
		
		testInfoNumber = Integer.parseInt(multi.getParameter("testInfoNumber"));
		
		info.setTestInfoTitle(multi.getParameter("testInfoTitle"));
		info.setTestInfoUsetime(multi.getParameter("testInfoUsetime"));
		info.setTestInfoPath(multi.getParameter("testInfoPath"));
		info.setTestInfoNumber(testInfoNumber);
//		info.setManagerNumber(1);
//		info.setManagerNumber((Integer)req.getSession().getAttribute("managerNumber"));
		info.setManagerNumber(fDao.selectManagerNumber(testInfoNumber));

		file = fDao.select(testInfoNumber);
		// 게시글 수정
		bDao.update(info);
		// 파일 삭제+추가
		fDao.delete(testInfoNumber);
		fDao.insert(multi,testInfoNumber );
		
		File[] files = {
				new File(uploadFolder, file.getTestInfoPicturePosterNameOrignal()),
				new File(uploadFolder, file.getTestInfoPictureSumnailNameOrignal())
		};
		
		for (int i = 0; i < files.length; i++) {
			if(files[i].exists()) {
				files[i].delete();
			}
		}
		
		af.setRedirect(true);
		af.setPath(req.getContextPath() + "/managerMbti/TestInfoListOk.ns?page=" + page);
		
		return af;
	}

}