package com.uro.pola.codedd;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class CodeDataService {

	private static final Logger logger = LoggerFactory
			.getLogger(CodeDataService.class);

	private SqlMapClient sqlMapClient;

	@Inject
	public CodeDataService(SqlMapClient sqlMapClient) {
		this.sqlMapClient  =  sqlMapClient ;
	}

	public Map<String, Object> getCodeList(Map<String, Object> param)
			throws SQLException {
		logger.info("########################## getCodeList() ");

		// List qlist = sqlMap.queryForList("sample.query1");
		long totalC = 0;
		Map<String, Object> retmap = new HashMap<String, Object>();
		List<Map<String, Object>> qlist = null;
		try {
			qlist = sqlMapClient.queryForList("samplemap.codelist",param);

			if (qlist != null && qlist.get(0) != null) {
				Map temp = qlist.get(0);
				totalC = (Long) temp.get("totalCount");
			}
			retmap.put("dataList", qlist);
			retmap.put("totalCount", totalC);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return retmap;
	}

}
