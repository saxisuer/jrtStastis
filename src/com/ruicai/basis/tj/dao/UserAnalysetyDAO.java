package com.ruicai.basis.tj.dao;

import java.util.List;

import com.ruicai.basis.entity.UserAnalysety;

public interface UserAnalysetyDAO {
	
	/**
	 * 返回用户分析统计结果
	 * @param userAnalysety
	 * @param firsttime
	 * @param lasttime
	 * @return
	 * @throws Exception
	 */
	public List<UserAnalysety> findUserAnalysetyList_all(UserAnalysety userAnalysety,String firsttime,String lasttime) throws Exception; 
}
